Class {
	#name : 'UnixFileOpeningOptionsTest',
	#superclass : 'TestCase',
	#category : 'FileDescriptor-Tests'
}

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testAppend [
	| instance |
	instance := LinuxFileOpeningOptions writeOnly.
	instance append.
	self
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isAppend;
		assert: instance flags equals: 8r2001
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testCloseOnExec [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance closeOnExec.
	self
		assert: instance allowsRead;
		assert: instance isReadOnly;
		assert: instance isCloseOnExec;
		assert: instance flags equals: 8r2000000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testCreate [
	| instance |
	instance := LinuxFileOpeningOptions readWrite.
	instance create.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		deny: instance isReadOnly;
		assert: instance isCreate;
		assert: instance flags equals: 8r102
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testDataSync [
	| instance |
	instance := LinuxFileOpeningOptions writeOnly.
	instance dataSync.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isDataSync;
		assert: instance flags equals: 8r10001
]

{ #category : 'file creation mode tests' }
UnixFileOpeningOptionsTest >> testDefaultCreationMode [
	"Mode that is given when no mode has been explicitly specified."

	| instance |
	instance := LinuxFileOpeningOptions writeOnly.
	self assert: instance modeBits equals: 8r666
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testDirect [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance direct.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isDirect;
		assert: instance flags equals: 8r40000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testDirectory [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance directory.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isDirectory;
		assert: instance flags equals: 8r200000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testExclusive [
	| instance |
	instance := LinuxFileOpeningOptions writeOnly.
	instance exclusive.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isExclusive;
		assert: instance flags equals: 8r201
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testLateReadOnly [
	"Can't add an access mode after other options."

	| instance |
	instance := LinuxFileOpeningOptions new.
	instance append.
	self
		should: [ instance readOnly ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testLateReadWrite [
	"Can't add an access mode after other options."

	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	self
		should: [ instance readWrite ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testLateWriteOnly [
	"Can't add an access mode after other options."

	| instance |
	instance := LinuxFileOpeningOptions new.
	instance create.
	self
		should: [ instance writeOnly ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testNoAccessTime [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance noAccessTime.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isNoAccessTime;
		assert: instance flags equals: 8r1000000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testNoFollow [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance noFollow.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isNoFollow;
		assert: instance flags equals: 8r400000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testPath [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance path.
	self
		deny: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isPath;
		assert: instance flags equals: 8r10000000
]

{ #category : 'multiple option adding tests' }
UnixFileOpeningOptionsTest >> testPath1 [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance
		path;
		closeOnExec;
		directory;
		noFollow;
		path.
	self
		deny: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isPath;
		assert: instance isCloseOnExec;
		assert: instance isDirectory;
		assert: instance isNoFollow;
		deny: instance isDataSync;
		assert: instance flags equals: 8r12600000
]

{ #category : 'multiple option adding tests' }
UnixFileOpeningOptionsTest >> testPath2 [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance
		noFollow;
		directory;
		closeOnExec;
		path.
	self
		deny: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isPath;
		assert: instance isCloseOnExec;
		assert: instance isDirectory;
		assert: instance isNoFollow;
		deny: instance isDataSync;
		assert: instance flags equals: 8r12600000
]

{ #category : 'multiple option adding tests' }
UnixFileOpeningOptionsTest >> testPath3 [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance
		noFollow;
		path.
	self
		deny: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isPath;
		assert: instance isNoFollow;
		deny: instance isDataSync;
		assert: instance flags equals: 8r10400000
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testPathPlusWhatever [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance path.
	self
		should: [ instance append ]
		raise: instance improperOperationExceptionClass;
		should: [ instance create ]
		raise: instance improperOperationExceptionClass;
		should: [ instance dataSync ]
		raise: instance improperOperationExceptionClass;
		should: [ instance direct ]
		raise: instance improperOperationExceptionClass;
		should: [ instance exclusive ]
		raise: instance improperOperationExceptionClass;
		should: [ instance noAccessTime ]
		raise: instance improperOperationExceptionClass;
		should: [ instance sync ]
		raise: instance improperOperationExceptionClass;
		should: [ instance tmpFile ]
		raise: instance improperOperationExceptionClass;
		should: [ instance truncate ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testPathPlusWrite [
	
	| instance |
	instance := LinuxFileOpeningOptions readWrite.
	self
		should: [ instance path ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'instance creation tests' }
UnixFileOpeningOptionsTest >> testReadOnly [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	self
		assert: instance isReadOnly;
		deny: instance isWriteOnly;
		deny: instance isReadWrite;
		deny: instance allowsWrite;
		assert: instance allowsRead;
		assert: instance flags equals: 0.
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testReadOnlyPlusTmpFile [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	self
		should: [ instance tmpFile ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'bad option tests' }
UnixFileOpeningOptionsTest >> testReadOnlyPlusTruncate [
	"Undefined behavior, prohibit it."

	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	self
		should: [ instance truncate ]
		raise: instance improperOperationExceptionClass
]

{ #category : 'instance creation tests' }
UnixFileOpeningOptionsTest >> testReadWrite [
	| instance |
	instance := LinuxFileOpeningOptions readWrite.
	self
		deny: instance isWriteOnly;
		assert: instance allowsWrite;
		assert: instance allowsRead;
		deny: instance isReadOnly;
		assert: instance isReadWrite;
		assert: instance flags equals: 2
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testSync [
	| instance |
	instance := LinuxFileOpeningOptions readOnly.
	instance sync.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isSync;
		assert: instance flags equals: 8r4010000
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testTmpFile [
	| instance |
	instance := LinuxFileOpeningOptions readWrite.
	instance tmpFile.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isReadWrite;
		assert: instance isTmpFile;
		assert: instance flags equals: 8r20200002
]

{ #category : 'single option adding tests' }
UnixFileOpeningOptionsTest >> testTruncate [
	| instance |
	instance := LinuxFileOpeningOptions readWrite.
	instance truncate.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isReadWrite;
		assert: instance isTruncate;
		assert: instance flags equals: 8r1002
]

{ #category : 'instance creation tests' }
UnixFileOpeningOptionsTest >> testWriteOnly [
	| instance |
	instance := LinuxFileOpeningOptions writeOnly.
	self
		assert: instance isWriteOnly;
		assert: instance allowsWrite;
		deny: instance allowsRead;
		deny: instance isReadOnly;
		deny: instance isReadWrite;
		assert: instance flags equals: 1
]
