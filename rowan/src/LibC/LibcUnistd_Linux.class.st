Class {
	#name : 'LibcUnistd_Linux',
	#superclass : 'LibcUnistd',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcUnistd_Linux >> wrappedClass [
	^ _libc_unistd_Linux
]
