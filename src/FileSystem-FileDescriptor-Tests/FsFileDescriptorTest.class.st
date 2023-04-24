"
Part of FileSystem

=========

Test cases for FsFileDescriptor
"
Class {
	#name : 'FsFileDescriptorTest',
	#superclass : 'FsTestCase',
	#instVars : [
		'stdin',
		'stdout',
		'stderr'
	],
	#category : 'FileSystem-FileDescriptor-Tests'
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
		assert: stderr _fd equals: 2
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testOpenStdin [

	self
		assert: stdin class equals: FsFileDescriptor;
		assert: stdin _fd equals: 0
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testOpenStdout [

	self
		assert: stdout class equals: FsFileDescriptor;
		assert: stdout _fd equals: 1
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testPosition [

	| id fd size |
	id := DiskStore current libcFcntl open: '/usr/bin/env' flags: 0 mode: 0.
	fd := FsFileDescriptor fd: id.
	self
		assert: fd position
		equals: 0.
	size := fd size.
	fd position: size - 1.
	self
		assert: fd position
		equals: size - 1.
	fd position: size. "Ensure we can go beyond the end of the file."
	self
		assert: fd position
		equals: size.
	self
		should: [fd position: -1]
		raise: OutOfRange.
	self
		assert: fd position
		equals: size
]

{ #category : 'BasicTests' }
FsFileDescriptorTest >> testReadFromUsrBinEnv [

	| id fd bytes |
	id := DiskStore current libcFcntl open: '/usr/bin/env' flags: 0 mode: 0.
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
