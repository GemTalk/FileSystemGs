Class {
	#name : 'LibcFcntl_Linux',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcFcntl_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
