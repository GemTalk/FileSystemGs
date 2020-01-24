Class {
	#name : 'UnixFileDescriptorTest',
	#superclass : 'TestCase',
	#category : 'FileDescriptor-Tests'
}

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testHelloWorld [
	| fd nl |
	fd := UnixFileDescriptor forStdout.
	nl := String with: Character lf.
	fd write: nl , 'Hello World!'
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testNoNew [
	self  should: [ UnixFileDescriptor new ] raise: Error
]

{ #category : 'BasicTests' }
UnixFileDescriptorTest >> testOpenStdout [
	| fd |
	fd := UnixFileDescriptor forStdout.
	self
		assert: fd class equals: UnixFileDescriptor;
		assert: fd id equals: 1
]
