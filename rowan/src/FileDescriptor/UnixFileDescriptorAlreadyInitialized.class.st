Class {
	#name : 'UnixFileDescriptorAlreadyInitialized',
	#superclass : 'Error',
	#category : 'FileDescriptor'
}

{ #category : 'accessing' }
UnixFileDescriptorAlreadyInitialized >> messageText [

	^super messageText ifNil: ['Cannot set file descriptor ID more than once.']
]
