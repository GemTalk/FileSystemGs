Class {
	#name : 'UnixFileOpeningOptionsTest',
	#superclass : 'TestCase',
	#category : 'FileDescriptor-Tests'
}

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testAppend [
	| instance |
	instance := UnixFileOpeningOptions writeOnly.
	instance append.
	self
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isAppend;
		assert: instance flags equals: 8r2001
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testCloseOnExec [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance closeOnExec.
	self
		assert: instance allowsRead;
		assert: instance isReadOnly;
		assert: instance isCloseOnExec;
		assert: instance flags equals: 8r2000000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testCreate [
	| instance |
	instance := UnixFileOpeningOptions readWrite.
	instance create.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		deny: instance isReadOnly;
		assert: instance isCreate;
		assert: instance flags equals: 8r102
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testDataSync [
	| instance |
	instance := UnixFileOpeningOptions writeOnly.
	instance dataSync.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isDataSync;
		assert: instance flags equals: 8r10001
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testDirect [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance direct.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isDirect;
		assert: instance flags equals: 8r40000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testDirectory [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance directory.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isDirectory;
		assert: instance flags equals: 8r200000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testExclusive [
	| instance |
	instance := UnixFileOpeningOptions writeOnly.
	instance exclusive.
	self
		deny: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isWriteOnly;
		assert: instance isExclusive;
		assert: instance flags equals: 8r201
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testNoAccessTime [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance noAccessTime.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isNoAccessTime;
		assert: instance flags equals: 8r1000000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testNoFollow [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance noFollow.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isNoFollow;
		assert: instance flags equals: 8r400000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testPath [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance path.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isPath;
		assert: instance flags equals: 8r10000000
]

{ #category : 'instance creation tests' }
UnixFileOpeningOptionsTest >> testReadOnly [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	self
		assert: instance isReadOnly;
		deny: instance isWriteOnly;
		deny: instance isReadWrite;
		deny: instance allowsWrite;
		assert: instance allowsRead;
		assert: instance flags equals: 0.
]

{ #category : 'instance creation tests' }
UnixFileOpeningOptionsTest >> testReadWrite [
	| instance |
	instance := UnixFileOpeningOptions readWrite.
	self
		deny: instance isWriteOnly;
		assert: instance allowsWrite;
		assert: instance allowsRead;
		deny: instance isReadOnly;
		assert: instance isReadWrite;
		assert: instance flags equals: 2
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testSync [
	| instance |
	instance := UnixFileOpeningOptions readOnly.
	instance sync.
	self
		assert: instance allowsRead;
		deny: instance allowsWrite;
		assert: instance isReadOnly;
		assert: instance isSync;
		assert: instance flags equals: 8r4010000
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testTmpFile [
	| instance |
	instance := UnixFileOpeningOptions readWrite.
	instance tmpFile.
	self
		assert: instance allowsRead;
		assert: instance allowsWrite;
		assert: instance isReadWrite;
		assert: instance isTmpFile;
		assert: instance flags equals: 8r20200002
]

{ #category : 'option adding tests' }
UnixFileOpeningOptionsTest >> testTruncate [
	| instance |
	instance := UnixFileOpeningOptions readWrite.
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
	instance := UnixFileOpeningOptions writeOnly.
	self
		assert: instance isWriteOnly;
		assert: instance allowsWrite;
		deny: instance allowsRead;
		deny: instance isReadOnly;
		deny: instance isReadWrite;
		assert: instance flags equals: 1
]
