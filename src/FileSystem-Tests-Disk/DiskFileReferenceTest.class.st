Class {
	#name : 'DiskFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'utilities' }
DiskFileReferenceTest >> blockDeviceReference [
	"Return a reference to a block device."

	| devices |
	devices := #( '/dev/sda' '/dev/disk0' '/dev/nvme0' '/dev/mmcblk0' '/dev/loop0' ) collect: [:each | self fileSystem referenceTo: each].
	^devices detect: [:each | each exists] ifNone: [self assert: false]
]

{ #category : 'utilities' }
DiskFileReferenceTest >> characterDeviceReference [
	"Return a reference to a block device."

	^self fileSystem referenceTo: '/dev/null'
]

{ #category : 'accessing' }
DiskFileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^'DiskFileReferenceTest-Sandbox'
]

{ #category : 'running' }
DiskFileReferenceTest >> setUp [

	| fileSystem |
	super setUp.
	fileSystem := FileSystem disk.
	sandbox := FileLocator temp asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: fileSystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
DiskFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
DiskFileReferenceTest >> testAccessTime [

	self
		assert: sandbox accessTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
DiskFileReferenceTest >> testDeviceId [

	self
		assert: sandbox deviceId
		isKindOf: Integer
]

{ #category : 'tests' }
DiskFileReferenceTest >> testGid [

	self
		assert: sandbox gid
		isKindOf: Integer
]

{ #category : 'tests' }
DiskFileReferenceTest >> testInode [

	self
		assert: sandbox inode
		isKindOf: Integer
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsBlock [
	"Several potential block devices are searched to find one.
	It is possble the test could fail because one of these block devices is not available."

	self
		assert: self blockDeviceReference isBlock;
		deny: self characterDeviceReference isBlock;
		deny: ((self createFile: 'not-block') isBlock);
		deny: sandbox isBlock
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsCharacter [
	"/dev/null should be on every supported system."

	self
		deny: self blockDeviceReference isCharacter;
		assert: self characterDeviceReference isCharacter;
		deny: ((self createFile: 'not-character') isCharacter);
		deny: sandbox isCharacter
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsExecutable [
	"I expect /usr/bin/env to be on every system we support.
	Even FHS linux distros like NixOS have this file."

	| exe file |
	exe := self fileSystem referenceTo: '/usr/bin/env'.
	file := self createFile: 'not-executable'.
	self
		assert: exe isExecutable;
		deny: file isExecutable;
		assert: sandbox isExecutable
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsFifo [
	"I don't know of a good way to test the positive case.
	I just test the negative cases here."

	self
		deny: self blockDeviceReference isFifo;
		deny: self characterDeviceReference isFifo;
		deny: ((self createFile: 'not-fifo') isFifo);
		deny: sandbox isFifo
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsRegular [
	"See subclass implementations."

	self
		assert: ((self createFile: 'regular-file') isRegular);
		deny: sandbox isRegular;
		deny: self blockDeviceReference isRegular;
		deny: self characterDeviceReference isRegular
]

{ #category : 'tests' }
DiskFileReferenceTest >> testIsSocket [
	"I don't know of a good way to test the positive case.
	I just test the negative cases here."

	self
		deny: self blockDeviceReference isSocket;
		deny: self characterDeviceReference isSocket;
		deny: ((self createFile: 'not-fifo') isSocket);
		deny: sandbox isSocket
]

{ #category : 'compatibility tests' }
DiskFileReferenceTest >> testNumberOfHardLinks [
	"See subclass implementations"

	| file |
	file := self createFile: 'hard-links'.
	self
		assert: file numberOfHardLinks
		equals: 1
]

{ #category : 'tests' }
DiskFileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	| rw rwe original |
	rw := FileSystemPermission posixPermissions: 8r666.
	rwe := FileSystemPermission posixPermissions: 8r777.
	original := sandbox permissions.
	self
		assert: original
		isKindOf: FileSystemPermission.
	sandbox permissions: rw.
	self
		assert: sandbox permissions
		equals: rw.
	sandbox permissions: rwe.
	self
		assert: sandbox permissions
		equals: rwe.
	sandbox permissions: original
]

{ #category : 'tests' }
DiskFileReferenceTest >> testSetAsWorkingDirectory [

	| diskStore initialWD targetWD file |
	diskStore := FileSystem disk.
	initialWD := diskStore workingDirectory.
	targetWD := FileLocator temp resolve.
	self
		assert: targetWD
		isKindOf: FileReference.
	self
		deny: initialWD
		equals: targetWD.
	[targetWD setAsWorkingDirectory.
	self
		assert: diskStore workingDirectory
		equals: targetWD]
		ensure: [initialWD setAsWorkingDirectory].
	file := self createFile: 'hello-world'.
	self
		should: [file setAsWorkingDirectory]
		raise: DirectoryRequired.
	self
		should: [self characterDeviceReference setAsWorkingDirectory]
		raise: DirectoryRequired.
	self
		should: ['/does/not/exist' asFileReference setAsWorkingDirectory]
		raise: DirectoryDoesNotExist
]

{ #category : 'tests' }
DiskFileReferenceTest >> testUid [

	self
		assert: sandbox uid
		isKindOf: Integer
]
