Class {
	#name : 'LibcFcntl_macOS',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcFcntl_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
