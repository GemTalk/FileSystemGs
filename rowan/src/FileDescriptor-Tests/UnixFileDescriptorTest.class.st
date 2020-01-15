Class {
	#name : 'UnixFileDescriptorTest',
	#superclass : 'TestCase',
	#category : 'FileDescriptor-Tests'
}

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testOpenStdin [
	| fd |
	fd := UnixFileDescriptor forStdout.
	self
		assert: fd class equals: UnixFileDescriptor;
		assert: fd id equals: 1
]
