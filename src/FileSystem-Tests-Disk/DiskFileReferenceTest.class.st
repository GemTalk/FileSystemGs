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
