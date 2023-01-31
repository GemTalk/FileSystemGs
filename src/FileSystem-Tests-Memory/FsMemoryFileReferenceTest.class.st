"
Part of FileSystem

=========

Test cases for memory-backed FileReferences.
"
Class {
	#name : 'FsMemoryFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'accessing' }
FsMemoryFileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^'MemoryFileReferenceTest-Sandbox'
]

{ #category : 'running' }
FsMemoryFileReferenceTest >> setUp [

	super setUp.
	sandbox := FileSystem memory root / self sandboxName.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
FsMemoryFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testBinaryWriteStream [

	| file directory stream |
	file := sandbox / 'file'.
	directory := self createDirectory: 'directory'.

	"Ensure file is created by #binaryWriteStream."
	stream := file binaryWriteStream.
	stream
		nextPutAll: #[72 101 108 108 111 44 32 70 105 108 101 83 121 115 116 101 109 33];
		flush;
		close.
	self assert: file isFile.
	self
		assert: file contents
		equals: 'Hello, FileSystem!'.

	"Ensure #writeStream begins at start of file and truncates the file."
	stream := file binaryWriteStream.
	stream
		nextPutAll: #[65 66 67];
		flush;
		close.
	self
		assert: file contents
		equals: 'ABC'.

	"Ensure #writeStream send to a directory raises an exception."
	self
		should: [directory writeStream]
		raise: FsFileRequired
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testCreationTime [

		self
		assert: sandbox creationTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testFileOpeningOptionsClass [
	"This test shoud be handled in a subclass"

	self
		assert: sandbox fileOpeningOptionsClass
		equals: FsMemoryFileOpeningOptions
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsBlock [
	"Block devices unsupported"

	self
		deny: sandbox isBlock;
		deny: (self createFile: 'not-block') isBlock
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsCharacter [
	"No support."


	self
		deny: sandbox isCharacter;
		deny: (self createFile: 'not-character') isCharacter
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsExecutable [
	"Directories are executable but files are not."

	self
		assert: sandbox isExecutable;
		deny: (self createFile: 'not-executable') isExecutable
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsFifo [
	"Fifo files unsupported"

	self
		deny: sandbox isFifo;
		deny: (self createFile: 'not-fifo') isBlock
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsReadable [
	"Ensure #isReadable returns correct results"

	| file |
	file := self
		createFile: 'testIsReadable'
		contents: 'Permissions are tricky.'.
	self assert: file isReadable
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsRegular [

	self
		deny: sandbox isRegular;
		assert: (self createFile: 'regular-file') isRegular
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsSocket [
	"Socket files unsupported"

	self
		deny: sandbox isSocket;
		deny: (self createFile: 'not-socket') isSocket
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testIsWritable [
	"Ensure #isWritable returns correct results"

	| file |
	file := self
		createFile: 'testIsWriteable'
		contents: 'Permissions are tricky.'.
	self assert: file isWritable
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	self
		assert: sandbox permissions
		isKindOf: FileSystemPermission.
	self
		should: [sandbox permissions: (FileSystemPermission posixPermissions: 8r777)]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FsMemoryFileReferenceTest >> testWriteStream [

	| file directory stream |
	file := sandbox / 'file'.
	directory := self createDirectory: 'directory'.

	"Ensure file is created by #writeStream."
	stream := file writeStream.
	stream
		nextPutAll: 'abcdef';
		flush;
		close.
	self assert: file isFile.
	self
		assert: file contents
		equals: 'abcdef'.

	"Ensure #writeStream begins at start of file."
	"Should the following fails in against the memory file system.
	Should we ensure this behaves the same in all file systems?"
	stream := file writeStream.
	stream
		nextPutAll: '123';
		flush;
		close.
	self
		assert: file contents
		equals: '123'.

	"Ensure #writeStream send to a directory raises an exception."
	self
		should: [directory writeStream]
		raise: FsFileRequired
]
