Class {
	#name : 'FileDescriptorAlreadyInitialized',
	#superclass : 'Error',
	#category : 'FileDescriptor'
}

{ #category : 'accessing' }
FileDescriptorAlreadyInitialized >> messageText [

	^super messageText ifNil: ['Cannot set file descriptor ID more than once.']
]
