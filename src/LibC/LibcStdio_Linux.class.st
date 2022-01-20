Class {
	#name : 'LibcStdio_Linux',
	#superclass : 'LibcStdio',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStdio_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
