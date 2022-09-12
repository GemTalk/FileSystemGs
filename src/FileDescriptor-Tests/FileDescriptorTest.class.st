Class {
	#name : 'FileDescriptorTest',
	#superclass : 'TestCase',
	#instVars : [
		'stdin',
		'stdout',
		'stderr'
	],
	#category : 'FileDescriptor-Tests'
}

{ #category : 'initializing' }
FileDescriptorTest >> setUp [
	"Configure the known file descriptors"

	super setUp.
	stdin := FileDescriptor stdin.
	stdout := FileDescriptor stdout.
	stderr := FileDescriptor stderr
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testNoNew [

	self
		should: [FileDescriptor new]
		raise: Error
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testOpenStderr [

	self
		assert: stderr class equals: FileDescriptor;
		assert: stderr fd equals: 2
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testOpenStdin [

	self
		assert: stdin class equals: FileDescriptor;
		assert: stdin fd equals: 0
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testOpenStdout [

	self
		assert: stdout class equals: FileDescriptor;
		assert: stdout fd equals: 1
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testReadFromUsrBinEnv [

	| id fd bytes |
	id := DiskStore current libcFcntl openPath: '/usr/bin/env' flags: 0 mode: 0.
	fd := FileDescriptor fd: id.
	[bytes := fd read: 4] ensure: [fd close].
	self
		assert: bytes size
		equals: 4.
	self
		assert: bytes class
		equals: ByteArray.
	self
		deny: bytes
		equals: #[0 0 0 0]
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testWriteStringErrors [

	self
		should: [stdout write: 'Hello, World!']
		raise: ArgumentTypeError
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testWriteToStderr [

	| message count |
	message := Character lf asString, 'Running #testWriteToStderr'.
	count := stderr write: message asByteArray.
	self
		assert: count
		equals: 27
]

{ #category : 'BasicTests' }
FileDescriptorTest >> testWriteToStdout [

	| message count |
	message := Character lf asString, 'Running #testWriteToStdout'.
	count := stdout write: message asByteArray.
	self
		assert: count
		equals: 27
]
