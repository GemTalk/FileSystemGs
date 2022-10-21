"
Part of FileSystem

=========

Error raised when attempting to initialize an FsFileDescriptor multiple times.
"
Class {
	#name : 'FsFileDescriptorAlreadyInitialized',
	#superclass : 'Error',
	#category : 'FileDescriptor'
}

{ #category : 'accessing' }
FsFileDescriptorAlreadyInitialized >> messageText [

	^super messageText ifNil: ['Cannot set file descriptor ID more than once.']
]
