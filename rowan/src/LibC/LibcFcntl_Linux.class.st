Class {
	#name : 'LibcFcntl_Linux',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcFcntl_Linux >> wrappedClass [
	^ _libc_fcntl_Linux
]
