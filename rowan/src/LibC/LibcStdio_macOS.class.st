Class {
	#name : 'LibcStdio_macOS',
	#superclass : 'LibcStdio',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStdio_macOS >> wrappedClass [

	^_libc_stdio_macOS
]
