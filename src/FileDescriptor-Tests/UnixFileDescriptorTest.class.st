Class {
	#name : 'UnixFileDescriptorTest',
	#superclass : 'TestCase',
	#instVars : [
		'stdin',
		'stdout',
		'stderr'
	],
	#category : 'FileDescriptor-Tests'
}

{ #category : 'initializing' }
UnixFileDescriptorTest >> setUp [
	"Configure the known file descriptors"

	super setUp.
	stdin := UnixFileDescriptor stdin.
	stdout := UnixFileDescriptor stdout.
	stderr := UnixFileDescriptor stderr
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testNoNew [

	self
		should: [UnixFileDescriptor new]
		raise: Error
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testOpenStderr [

	self
		assert: stderr class equals: UnixFileDescriptor;
		assert: stderr fd equals: 2
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testOpenStdin [

	self
		assert: stdin class equals: UnixFileDescriptor;
		assert: stdin fd equals: 0
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testOpenStdout [

	self
		assert: stdout class equals: UnixFileDescriptor;
		assert: stdout fd equals: 1
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testReadFromUsrBinEnv [

	| id fd bytes |
	id := OSPlatform current libcFcntlClass new openPath: '/usr/bin/env' flags: 0 mode: 0.
	fd := UnixFileDescriptor fd: id.
	[bytes := fd read: 4] ensure: [fd close].
	self
		assert: bytes size
		equals: 4.
	self
		deny: bytes
		equals: #[0 0 0 0]
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testWriteStringErrors [

	self
		should: [stdout write: 'Hello, World!']
		raise: ArgumentTypeError
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testWriteToStderr [

	| message count |
	message := Character lf asString, 'Running #testWriteToStderr'.
	count := stderr write: message asByteArray.
	self
		assert: count
		equals: 27
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testWriteToStdout [

	| message count |
	message := Character lf asString, 'Running #testWriteToStdout'.
	count := stdout write: message asByteArray.
	self
		assert: count
		equals: 27
]
