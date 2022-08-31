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
	#category : 'FileSystem-Core'
}

{ #category : 'accessing' }
FileSystemStore class >> delimiter [
	^ self shouldBeImplemented 
]

{ #category : 'instance creation' }
FileSystemStore class >> new [

	^self basicNew
		initialize;
		yourself
]

{ #category : 'public-attributes' }
FileSystemStore >> accessTimeOf: aPath [
	"Return the access time of the File described by aPath"

	self signalUnsupportedAttribute
]

{ #category : 'public-attributes' }
FileSystemStore >> changeTimeOf: aPath [
	"Return the change time of the File described by aPath"

	self signalUnsupportedAttribute
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

{ #category : 'public-attributes' }
FileSystemStore >> creationTimeOf: aPath [
	"Return the creation time of the File described by aPath"

	self signalUnsupportedAttribute
]

{ #category : 'accessing' }
FileSystemStore >> currentWorkingDirectoryPath [
	"Returns the current working directory as a Path."

	^self subclassResponsibility
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

{ #category : 'public-enumerating' }
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

{ #category : 'private' }
FileSystemStore >> directoryAt: aPath
ifAbsent: absentBlock
fileNamesDo: aBlock [
	"Enumerate through the file names in the provided directory."

	self subclassResponsibility
]

{ #category : 'public' }
FileSystemStore >> ensureCreateDirectory: aPath [
	(self isDirectory: aPath) ifTrue: [ ^ self ].
	self ensureCreateDirectory: aPath parent.
	self createDirectory: aPath
]

{ #category : 'public-testing' }
FileSystemStore >> exists: aPath [

	self subclassResponsibility
]

{ #category : 'private' }
FileSystemStore >> filename: aByteString matches: aByteString2 [
	^ aByteString = aByteString2
]

{ #category : 'accessing' }
FileSystemStore >> fileSystemClass [
	"Defines the correct subclass of FileSystem to use with this store."

	^self subclassResponsibility
]

{ #category : 'initialization' }
FileSystemStore >> initialize [
]

{ #category : 'public-attributes' }
FileSystemStore >> inodeOf: aPath [
	"Return the size of the File described by aPath"

	self signalUnsupportedAttribute
]

{ #category : 'public-testing' }
FileSystemStore >> isDirectory: aPath [

	self subclassResponsibility
]

{ #category : 'public-testing' }
FileSystemStore >> isFile: aPath [

	self subclassResponsibility
]

{ #category : 'public-testing' }
FileSystemStore >> isSymlink: aPath [

	^self subclassResponsibility
]

{ #category : 'public-testing' }
FileSystemStore >> isWritable: aPath [

	self subclassResponsibility
]

{ #category : 'public-attributes' }
FileSystemStore >> modificationTimeOf: aPath [
	"Return the modification time of the File described by aPath"

	self signalUnsupportedAttribute
]

{ #category : 'public-attributes' }
FileSystemStore >> numberOfHardLinksOf: aPath [
	"Return the number of hard links of the File described by aPath"

	self signalUnsupportedAttribute
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

{ #category : 'public-attributes' }
FileSystemStore >> permissions: aPath [
	"Returns the permissions for the entity at <aPath>"

	self signalUnsupportedAttribute
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
FileSystemStore >> signalUnsupportedAttribute [

	^FileAttributeNotSupported signalWith: self
]

{ #category : 'error signalling' }
FileSystemStore >> signalUnsupportedAttribute: attributeName [

	^FileAttributeNotSupported signalWith: attributeName
]

{ #category : 'public-attributes' }
FileSystemStore >> sizeOf: aPath [
	"Return the size of the File described by aPath"

	self signalUnsupportedAttribute
]

{ #category : 'converting' }
FileSystemStore >> stringFromPath: aPath [
	^ String streamContents: [ :out | 
		self printPath: aPath on: out ]
]

{ #category : 'public-attributes' }
FileSystemStore >> targetPathOf: aPath [
	"Return a path of the actual file location.
	For regular files, that is itself.
	For symlinks, that is the file pointed to."

	self signalUnsupportedAttribute
]
