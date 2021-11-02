Class {
	#name : 'LibcDirent_macOS',
	#superclass : 'LibcDirent',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcDirent_macOS >> wrappedClass [

	^_libc_dirent_macOS
]
