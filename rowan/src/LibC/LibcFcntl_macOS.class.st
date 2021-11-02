Class {
	#name : 'LibcFcntl_macOS',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcFcntl_macOS >> wrappedClass [

	^_libc_fcntl_macOS
]
