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
FsMemoryFileReferenceTest >> testCreationTime [

		self
		assert: sandbox creationTime
		isKindOf: DateAndTime
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
FsMemoryFileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	self
		assert: sandbox permissions
		isKindOf: FileSystemPermission.
	self
		should: [sandbox permissions: (FileSystemPermission posixPermissions: 8r777)]
		raise: FileAttributeNotSupported
]
