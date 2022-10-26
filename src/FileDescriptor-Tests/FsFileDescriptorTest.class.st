"
Part of FileSystem

=========

Test cases for FsFileDescriptor
"
Class {
	#name : 'FsFileDescriptorTest',
	#superclass : 'TestCase',
	#instVars : [
		'stdin',
		'stdout',
		'stderr'
	],
	#category : 'FileDescriptor-Tests'
}

{ #category : 'initializing' }
FsFileDescriptorTest >> setUp [
	"Configure the known file descriptors"

	super setUp.
	stdin := FsFileDescriptor stdin.
	stdout := FsFileDescriptor stdout.
	stderr := FsFileDescriptor stderr
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testNoNew [

	self
		should: [FsFileDescriptor new]
		raise: Error
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testOpenStderr [

	self
		assert: stderr class equals: FsFileDescriptor;
		assert: stderr fd equals: 2
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testOpenStdin [

	self
		assert: stdin class equals: FsFileDescriptor;
		assert: stdin fd equals: 0
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testOpenStdout [

	self
		assert: stdout class equals: FsFileDescriptor;
		assert: stdout fd equals: 1
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testReadFromUsrBinEnv [

	| id fd bytes |
	id := DiskStore current libcFcntl openPath: '/usr/bin/env' flags: 0 mode: 0.
	fd := FsFileDescriptor fd: id.
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
FsFileDescriptorTest >> testWriteStringErrors [

	self
		should: [stdout write: 'Hello, World!']
		raise: ArgumentTypeError
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testWriteToStderr [

	| message count |
	message := Character lf asString, 'Running #testWriteToStderr'.
	count := stderr write: message asByteArray.
	self
		assert: count
		equals: 27
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testWriteToStdout [

	| message count |
	message := Character lf asString, 'Running #testWriteToStdout'.
	count := stdout write: message asByteArray.
	self
		assert: count
		equals: 27
]