"
Part of FileSystem

=========

Test Cases for FsMemoryOpeningOptions
"
Class {
	#name : 'FsMemoryOpeningOptionsTest',
	#superclass : 'GsTestCase',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'running' }
FsMemoryOpeningOptionsTest >> testAttemptToConfigureMoreThanOnce [

	| options |
	options := FsMemoryFileOpeningOptions readWrite.
	self
		should: [options readOnly]
		raise: ImproperOperation
]

{ #category : 'running' }
FsMemoryOpeningOptionsTest >> testReadOnly [

	| options |
	options := FsMemoryFileOpeningOptions readOnly.
	self
		assert: options isReadOnly;
		deny: options isReadWrite;
		deny: options isWriteOnly;
		assert: options isReadable;
		deny: options isWritable
]

{ #category : 'running' }
FsMemoryOpeningOptionsTest >> testReadWrite [

	| options |
	options := FsMemoryFileOpeningOptions readWrite.
	self
		deny: options isReadOnly;
		assert: options isReadWrite;
		deny: options isWriteOnly;
		assert: options isReadable;
		assert: options isWritable
]

{ #category : 'running' }
FsMemoryOpeningOptionsTest >> testWriteOnly [

	| options |
	options := FsMemoryFileOpeningOptions writeOnly.
	self
		deny: options isReadOnly;
		deny: options isReadWrite;
		assert: options isWriteOnly;
		deny: options isReadable;
		assert: options isWritable
]
