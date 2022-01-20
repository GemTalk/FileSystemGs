Class {
	#name : 'LibcStdio_macOS',
	#superclass : 'LibcStdio',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStdio_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
