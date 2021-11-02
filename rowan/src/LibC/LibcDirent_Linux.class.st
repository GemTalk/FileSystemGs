Class {
	#name : 'LibcDirent_Linux',
	#superclass : 'LibcDirent',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcDirent_Linux >> wrappedClass [
	^ _libc_dirent_Linux
]
