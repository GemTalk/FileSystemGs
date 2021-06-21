"
I am an abstract superclass for store implementations. My subclasses provide access to the actual data storage of a particular kind of filesystem. 

The file system can be accessed via
	FileSystem disk 
	FileSystem memory
	
My associated filesystem can be accessed as follows:
      DiskStore currentFileSystem
"
Class {
	#name : 'FileSystemStore',
	#superclass : 'Object',
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'accessing' }
FileSystemStore class >> delimiter [
	^ self shouldBeImplemented 
]

{ #category : 'accessing' }
FileSystemStore class >> isCaseSensitive [
	^ self shouldBeImplemented
]

{ #category : 'instance creation' }
FileSystemStore class >> new [

	^self basicNew
		initialize;
		yourself
]

{ #category : 'public' }
FileSystemStore >> checkName: aString fixErrors: fixErrors [
	^ self subclassResponsibility
]

{ #category : 'other' }
FileSystemStore >> childNamesAt: path
ifAbsent: absentBlock
do: enumerator [
]

{ #category : 'abstract' }
FileSystemStore >> close [
	"Some kinds of filesystems need to open connections to external resources"
]

{ #category : 'private' }
FileSystemStore >> copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: aFilesystem [

	| buffer out in |
	
	in := nil.
	out := nil.
	buffer := nil.
	[
		in := aFilesystem binaryReadStreamOn: sourcePath.
		in ifNil: [ ^ absentBlock value ].
		
		(self exists: destinationPath)
			ifTrue: [ "cannot overwrite destination"
				^ presentBlock value ].
			
		out := aFilesystem binaryWriteStreamOn: destinationPath.
		
		[ in atEnd ]
			whileFalse: [ 
				buffer := in next: 1024.
				out nextPutAll: buffer ]]
	ensure: [ 
		in ifNotNil: [ in close ].
		out ifNotNil: [ out close ]]
]

{ #category : 'abstract' }
FileSystemStore >> createDirectory: aPath [
	self subclassResponsibility 
]

{ #category : 'public' }
FileSystemStore >> creationTimeOf: aPath [
	"Return the date of creation of the File described by aPath"

	^self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemStore >> currentWorkingDirectoryPath [
	^ Path root
]

{ #category : 'abstract' }
FileSystemStore >> delete: aPath [
	self subclassResponsibility 
]

{ #category : 'abstract' }
FileSystemStore >> deleteAll: aPath
in: fileSystem [

	self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemStore >> delimiter [
	^ self class delimiter
]

{ #category : 'public' }
FileSystemStore >> directoryAt: aPath
ifAbsent: absentBlock
directoryNamesDo: aBlock [
	"Enumerate through the directory names in the provided directory."

	self subclassResponsibility
]

{ #category : 'private' }
FileSystemStore >> directoryAt: aPath
ifAbsent: absentBlock
entryNamesDo: aBlock [
	"Enumerate through the entries in the provided directory."

	self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> ensureCreateDirectory: aPath [
	(self isDirectory: aPath) ifTrue: [ ^ self ].
	self ensureCreateDirectory: aPath parent.
	self createDirectory: aPath
]

{ #category : 'public' }
FileSystemStore >> exists: aPath [

	self subclassResponsibility
]

{ #category : 'private' }
FileSystemStore >> filename: aByteString matches: aByteString2 [
	^ aByteString = aByteString2
]

{ #category : 'initialization' }
FileSystemStore >> initialize [
]

{ #category : 'accessing' }
FileSystemStore >> isCaseSensitive [
	^ self class isCaseSensitive
]

{ #category : 'public' }
FileSystemStore >> isDirectory: aPath [

	self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> isFile: aPath [

	self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> isSymlink: aPath [

	^self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> isWritable: aPath [

	self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> modificationTimeOf: aPath [
	"Returns the last date of modification of the File described by aPath"

	^self subclassresponsibility
]

{ #category : 'abstract' }
FileSystemStore >> open [
	"Some kinds of filesystems need to open connections to external resources"
]

{ #category : 'public' }
FileSystemStore >> open: aFileReference
options: options [
	"Open the provided FileReference with the specific options provided."

	self subclassResponsibility
]

{ #category : 'converting' }
FileSystemStore >> pathFromString: aString [
	"Use the unix convention by default, since many filesystems are based on it."
	
	^ Path from: aString delimiter: self delimiter
]

{ #category : 'public' }
FileSystemStore >> permissions: aPath [

	^self subclassResponsibility
]

{ #category : 'converting' }
FileSystemStore >> printPath: aPath on: out [
	"Use the unix convention by default, since it's the most common."
	
	aPath isAbsolute ifTrue: [ out nextPut: self delimiter ].
	^ aPath printOn: out delimiter: self delimiter
]

{ #category : 'private' }
FileSystemStore >> rename: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: anFSFilesystem [

	| result |
	(self exists: destinationPath) ifTrue: [ ^ presentBlock value ].
	(self exists: sourcePath) ifFalse: [ ^ absentBlock value ].
	result := self rename: sourcePath to: destinationPath.
	result ifNil: [ self primitiveFailed ].
	^ self.
]

{ #category : 'abstract' }
FileSystemStore >> rename: sourcePath to: destinationPath [
	self subclassResponsibility 
]

{ #category : 'error signalling' }
FileSystemStore >> signalDirectoryDoesNotExist: aPath [
	^ DirectoryDoesNotExist signalWith: aPath
]

{ #category : 'error signalling' }
FileSystemStore >> signalDirectoryExists: aPath [
	^ DirectoryExists signalWith: aPath
]

{ #category : 'error signalling' }
FileSystemStore >> signalFileDoesNotExist: aPath [
	^ FileDoesNotExistException signalWith: aPath
]

{ #category : 'error signalling' }
FileSystemStore >> signalFileExists: aPath [
	^ FileExists signalWith: aPath
]

{ #category : 'error signalling' }
FileSystemStore >> signalUnsupportedAttribute: attributeName [

	^UnsupportedFileReferenceAttribute signalWith: attributeName
]

{ #category : 'public' }
FileSystemStore >> sizeOf: aPath [
	"Return the size of the File described by aPath"

	self subclassResponsibility
]

{ #category : 'converting' }
FileSystemStore >> stringFromPath: aPath [
	^ String streamContents: [ :out | 
		self printPath: aPath on: out ]
]
