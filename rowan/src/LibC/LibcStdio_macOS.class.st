Class {
	#name : 'LibcStdio_macOS',
	#superclass : 'LibcStdio',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStdio_macOS >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	errnoHolder := { 0 }.
	status := library
		rename: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]

{ #category : 'accessing' }
LibcStdio_macOS >> wrappedClass [

	^_libc_stdio_macOS
]
