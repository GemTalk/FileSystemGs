"
Part of FileSystem

=========

Test cases for FsUnixFileOpeningOptions
"
Class {
	#name : 'FsUnixFileOpeningOptionsTest',
	#superclass : 'FsTestCase',
	#category : 'FileSystem-FileDescriptor-Tests'
}

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testAppend [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 writeOnly.
	instance append.
	self
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isAppend;
		assert: instance flags equals: 8r2001
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testCloseOnExec [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	instance closeOnExec.
	self
		assert: instance allowsRead;
		assert: instance isReadOnly;
		assert: instance isCloseOnExec;
		assert: instance flags equals: 8r2000000
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testCreate [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readWrite.
	instance create.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		deny: instance isReadOnly;
		assert: instance isCreate;
		assert: instance flags equals: 8r102
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testDataSync [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 writeOnly.
	instance dataSync.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isDataSync;
		assert: instance flags equals: 8r10001
]

{ #category : 'file creation mode tests' }
FsUnixFileOpeningOptionsTest >> testDefaultCreationMode [
	"Mode that is given when no mode has been explicitly specified."

	| instance |
	instance := FsFileOpeningOptions_Linux_x64 writeOnly.
	self assert: instance modeBits equals: 8r666
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testDirectory [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	instance directory.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isDirectory;
		assert: instance flags equals: 8r200000
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testExclusive [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 writeOnly.
	instance exclusive.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isExclusive;
		assert: instance flags equals: 8r201
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testNoFollow [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	instance noFollow.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isNoFollow;
		assert: instance flags equals: 8r400000
]

{ #category : 'instance creation tests' }
FsUnixFileOpeningOptionsTest >> testReadOnly [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	self
		assert: instance isReadOnly;
		deny: instance isWriteOnly;
		deny: instance isReadWrite;
		deny: instance allowsWrite;
		assert: instance allowsRead;
		assert: instance flags equals: 0.
]

{ #category : 'bad option tests' }
FsUnixFileOpeningOptionsTest >> testReadOnlyPlusTruncate [
	"Undefined behavior, prohibit it."

	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	self
		should: [ instance truncate ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'instance creation tests' }
FsUnixFileOpeningOptionsTest >> testReadWrite [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readWrite.
	self
		deny: instance isWriteOnly;
		assert: instance allowsWrite;
		assert: instance allowsRead;
		deny: instance isReadOnly;
		assert: instance isReadWrite;
		assert: instance flags equals: 2
]

{ #category : 'bad option tests' }
FsUnixFileOpeningOptionsTest >> testSettingAccessModeMultipleTimes [
	"Ensure Access Mode is only set once."

	| instance |
	instance := FsFileOpeningOptions_Linux_x64 new.
	instance readOnly.
	self
		should: [instance readWrite]
		raise: ImproperOperation.
	self
		should: [instance writeOnly]
		raise: ImproperOperation.
	instance := FsFileOpeningOptions_Linux_x64 new.
	instance readWrite.
	self
		should: [instance readOnly]
		raise: ImproperOperation.
	self
		should: [instance writeOnly]
		raise: ImproperOperation.
	instance := FsFileOpeningOptions_Linux_x64 new.
	instance writeOnly.
	self
		should: [instance readWrite]
		raise: ImproperOperation.
	self
		should: [instance readOnly]
		raise: ImproperOperation.
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testSync [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readOnly.
	instance sync.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isSync;
		assert: instance flags equals: 8r4010000
]

{ #category : 'single option adding tests' }
FsUnixFileOpeningOptionsTest >> testTruncate [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 readWrite.
	instance truncate.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isReadWrite;
		assert: instance isTruncate;
		assert: instance flags equals: 8r1002
]

{ #category : 'instance creation tests' }
FsUnixFileOpeningOptionsTest >> testWriteOnly [
	| instance |
	instance := FsFileOpeningOptions_Linux_x64 writeOnly.
	self
		assert: instance isWriteOnly;
		assert: instance allowsWrite;
		deny: instance allowsRead;
		deny: instance isReadOnly;
		deny: instance isReadWrite;
		assert: instance flags equals: 1
]
