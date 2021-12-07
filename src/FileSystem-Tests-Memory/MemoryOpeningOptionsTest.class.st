Class {
	#name : 'MemoryOpeningOptionsTest',
	#superclass : 'TestCase',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'running' }
MemoryOpeningOptionsTest >> testAttemptToConfigureMoreThanOnce [

	| options |
	options := MemoryFileOpeningOptions readWrite.
	self
		should: [options readOnly]
		raise: ImproperOperation
]

{ #category : 'running' }
MemoryOpeningOptionsTest >> testReadOnly [

	| options |
	options := MemoryFileOpeningOptions readOnly.
	self
		assert: options isReadOnly;
		deny: options isReadWrite;
		deny: options isWriteOnly;
		assert: options isReadable;
		deny: options isWritable
]

{ #category : 'running' }
MemoryOpeningOptionsTest >> testReadWrite [

	| options |
	options := MemoryFileOpeningOptions readWrite.
	self
		deny: options isReadOnly;
		assert: options isReadWrite;
		deny: options isWriteOnly;
		assert: options isReadable;
		assert: options isWritable
]

{ #category : 'running' }
MemoryOpeningOptionsTest >> testWriteOnly [

	| options |
	options := MemoryFileOpeningOptions writeOnly.
	self
		deny: options isReadOnly;
		deny: options isReadWrite;
		assert: options isWriteOnly;
		deny: options isReadable;
		assert: options isWritable
]
