Class {
	#name : 'MemoryFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'accessing' }
MemoryFileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^'MemoryFileReferenceTest-Sandbox'
]

{ #category : 'running' }
MemoryFileReferenceTest >> setUp [

	super setUp.
	sandbox := FileSystem memory root / self sandboxName.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
MemoryFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testCreationTime [

		self
		assert: sandbox creationTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsBlock [
	"Block devices unsupported"

	self
		deny: sandbox isBlock;
		deny: (self createFile: 'not-block') isBlock
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsCharacter [
	"No support."


	self
		deny: sandbox isCharacter;
		deny: (self createFile: 'not-character') isCharacter
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsExecutable [
	"Directories are executable but files are not."

	self
		assert: sandbox isExecutable;
		deny: (self createFile: 'not-executable') isExecutable
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsFifo [
	"Fifo files unsupported"

	self
		deny: sandbox isFifo;
		deny: (self createFile: 'not-fifo') isBlock
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsRegular [

	self
		deny: sandbox isRegular;
		assert: (self createFile: 'regular-file') isRegular
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testIsSocket [
	"Socket files unsupported"

	self
		deny: sandbox isSocket;
		deny: (self createFile: 'not-socket') isSocket
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	self
		assert: sandbox permissions
		isKindOf: FileSystemPermission.
	self
		should: [sandbox permissions: (FileSystemPermission posixPermissions: 8r777)]
		raise: FileAttributeNotSupported
]
