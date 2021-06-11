"
I am an abstract superclass for disk store implementations. My subclasses provide access to the actual data storage of a particular kind of filesystem. 

"
Class {
	#name : 'DiskStore',
	#superclass : 'FileSystemStore',
	#instVars : [
		'maxFileNameLength'
	],
	#category : 'FileSystem-Disk'
}

{ #category : 'current' }
DiskStore class >> activeClass [
	self allSubclasses do: [:ea | 
		ea isActiveClass ifTrue: [^ ea]].
	^ self
]

{ #category : 'current' }
DiskStore class >> cacheKey [
	^ #'GsCurrentDiskFileSystem'
]

{ #category : 'current' }
DiskStore class >> createDefault [
	^ self new
]

{ #category : 'current' }
DiskStore class >> current [
	^ self currentFileSystem store
]

{ #category : 'current' }
DiskStore class >> currentFileSystem [
	| cached |
	(cached := SessionTemps current at: self cacheKey ifAbsent: [  ])
		ifNil: [ 
			cached := FileSystem store: self activeClass createDefault.
			SessionTemps current at: self cacheKey put: cached ].
	^ cached
]

{ #category : 'public' }
DiskStore class >> delimiter [
	^ self current delimiter
]

{ #category : 'current' }
DiskStore class >> isActiveClass [

	^false
	"^self delimiter = File delimiter"
]

{ #category : 'public' }
DiskStore class >> maxFileNameLength [
	self subclassResponsibility 
]

{ #category : 'comparing' }
DiskStore >> = other [
	^ self species = other species
]

{ #category : 'public' }
DiskStore >> checkName: aFileName fixErrors: fixErrors [
	"Check a string aFileName for validity as a file name. Answer the original file name if it is valid. If the name is not valid (e.g., it is too long or contains illegal characters) and fixing is false, raise an error. If fixing is true, fix the name (usually by truncating and/or tranforming characters), and answer the corrected name. The default behavior is just to truncate the name to the maximum length for this platform. Subclasses can do any kind of checking and correction appropriate for their platform."
	
	| maxLength |
	aFileName size = 0 ifTrue: [self error: 'zero length file name'].
	maxLength := self maxFileNameLength.
	aFileName size > maxLength ifTrue: [
		fixErrors
			ifTrue: [^ aFileName contractTo: maxLength]
			ifFalse: [self error: 'file name is too long']].
	^ aFileName
]

{ #category : 'public' }
DiskStore >> createDirectory: path [
	"Create a directory for the argument path. 
	If the path refers to an existing file, raise FileExists.
	If the path refers to an existing directory, raise DirectoryExists.
	If the parent directory of the path does not exist, raise DirectoryDoesNotExist"

	| pathString errnoHolder result parent |
	pathString := self stringFromPath: path.
	[OSPlatform current libcStat mkdir: pathString]
		on: UnixError
		do:
			[:ex |
			(self exists: path)
				ifTrue:
					[^(self isFile: path)
						ifTrue: [self signalFileExists: path]
						ifFalse: [self signalDirectoryExists: path]].
			parent := path parent.
			(self isDirectory: parent)
				ifFalse: [^self signalDirectoryDoesNotExist: parent].
			ex pass]
]

{ #category : 'accessing' }
DiskStore >> currentWorkingDirectoryPath [
	"Answer an absolute Path for the current working directory of the VM."

	| pathString |
	pathString := OSPlatform current currentWorkingDirectoryPath.
	^ Path from: pathString delimiter: self delimiter
]

{ #category : 'accessing' }
DiskStore >> defaultOptionsForRead [

	^UnixFileOpeningOptions readOnly
]

{ #category : 'accessing' }
DiskStore >> defaultOptionsForWrite [

	^UnixFileOpeningOptions writeOnly
		create;
		yourself
]

{ #category : 'public' }
DiskStore >> delete: path [

	| pathString |
	(self exists: path)
		ifFalse: [ ^ FileDoesNotExistException signalWith: path ].
	pathString := self stringFromPath: path.
	(self isDirectory: path)
		ifTrue: [self libcUnistd rmdir: pathString]
		ifFalse: [self libcUnistd unlinkPath: pathString]
]

{ #category : 'public' }
DiskStore >> deleteAll: path
in: fileSystem [

	DeleteVisitor delete: (fileSystem root resolve: path)
]

{ #category : 'private' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
entriesDo: aBlock [
	"Enumerate through the entry names in the provided directory."

	| pathString dir dirent |
	pathString := self stringFromPath: aPath.
	dir := self libcDirent openDirectoryStreamWithPath: pathString.
	[[dirent := self libcDirent readFromDirectoryStream: dir.
	dirent notNil]
		whileTrue:
			[aBlock value: dirent]]
		ensure: [self libcDirent closeDirectoryStream: dir]
]

{ #category : 'private' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
entryNamesDo: aBlock [
	"Enumerate through the entry names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		entriesDo:
			[:entry | | name |
			name := entry basename.
			(name = '.' or: [name = '..'])
				ifFalse: [aBlock value: name]]
]

{ #category : 'testing' }
DiskStore >> exists: aPath [

	| stat |
	stat := [self stat: aPath]
		on: FileDoesNotExistException
		do: [:ex | ^false].
	^true
]

{ #category : 'printing' }
DiskStore >> forReferencePrintOn: aStream [
	aStream nextPutAll: 'File @ '
]

{ #category : 'accessing' }
DiskStore >> handleClass [
	^ UnixFileDescriptor
]

{ #category : 'comparing' }
DiskStore >> hash [
	^ self species hash
]

{ #category : 'initialization' }
DiskStore >> initialize [
	super initialize.
	maxFileNameLength := 255.
]

{ #category : 'testing' }
DiskStore >> isDirectory: aPath [

	aPath isRoot ifTrue: [^true].
	^[(self stat: aPath) isDirectory]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isDiskFileSystem [
	^ true
]

{ #category : 'public' }
DiskStore >> isFile: aPath [

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isFile]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'public' }
DiskStore >> isReadable: aPath [
	(self exists: aPath) ifFalse: [ ^ false ].
	self flag: 'TODO: Make this work properly'.
	self error: 'ToBeImplemented'.
	(self basicOpen: aPath writable: #read) 
		ifNotNil: [ :id|
			"File close: id."
			^ true].
	^ false
]

{ #category : 'public' }
DiskStore >> isSymlink: aPath [

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isSymlink]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'public' }
DiskStore >> isWritable: aPath [
	(self exists: aPath)
		ifFalse: [ ^ false ].
	self flag: 'TODO: Make this work properly'.
	self error: 'ToBeImplemented'.
	(self basicOpen: aPath writable: #'write')
		ifNotNil: [ :id | 
			"File close: id."
			^ true ].
	^ false
]

{ #category : 'accessing' }
DiskStore >> libcDirent [

	^OSPlatform current libcDirent
]

{ #category : 'accessing' }
DiskStore >> libcUnistd [

	^OSPlatform current libcUnistd
]

{ #category : 'public' }
DiskStore >> maxFileNameLength [
	^ maxFileNameLength
]

{ #category : 'public' }
DiskStore >> open: aFileReference
writable: isWritable [

	| options fd |
	options := isWritable
		ifTrue: [self defaultOptionsForWrite]
		ifFalse: [self defaultOptionsForRead].
	fd := [OSPlatform current libcFcntl
				openPath: aFileReference pathString
				flags: options flags
				mode: options modeBits]
			on: ENOENT
			do:
				[:ex | | parent |
				"This is written in this manner to match the previous behavior in UnixFileDescriptor.
				A better means of detecting and signaling appropriate errors needs to be devised.
				This handling is simplistic and incorrect."
				isWritable
					ifTrue:
						[parent := aFileReference parent.
						parent exists
							ifTrue: [ex pass]
							ifFalse: [self signalDirectoryDoesNotExist: parent]]
					ifFalse:
						[self signalFileDoesNotExist: aFileReference fullPath]].
	^UnixFileDescriptor id: fd
]

{ #category : 'public' }
DiskStore >> openFileStream: path writable: writable [
	| fullPath |
	fullPath := self stringFromPath: path.
	"redirect over the default implementation"
	^ writable 
		ifFalse: [ FileStreamPortable readOnlyFileNamed: fullPath ]
		ifTrue: [ FileStreamPortable fileNamed: fullPath ]
]

{ #category : 'public' }
DiskStore >> rename: sourcePath to: destinationPath [

	| sourcePathString targetPathString |
	sourcePathString := self stringFromPath: sourcePath.
	targetPathString := self stringFromPath: destinationPath.
	OSPlatform current libcStdio
		rename: sourcePathString
		to: targetPathString
]

{ #category : 'private' }
DiskStore >> rootNode [
	^ #('' 0 0 true 0 8r555)
]

{ #category : 'accessing' }
DiskStore >> sizeOf: aPath [
	"Return the size of the File described by aPath"

	^(self stat: aPath) size
]

{ #category : 'public' }
DiskStore >> stat: aPath [

	| pathString |
	pathString := self stringFromPath: aPath.
	^[OSPlatform current libcStat stat: pathString]
		on: ENOENT
		do: [:ex | self signalFileDoesNotExist: aPath]
]
