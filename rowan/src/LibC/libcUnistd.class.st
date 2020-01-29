Class {
	#name : 'libcUnistd',
	#superclass : 'LibcWrapper',
	#category : 'LibC'
}

{ #category : 'constants' }
libcUnistd >> libraryClass [
	^ _libcUnistd
]

{ #category : 'Functions' }
libcUnistd >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [
	| result errno |
	[ 
	CCallout errno: 0.

	result := library write_: fd _: buf _: bytes.
	errno := CCallout errno ] value.	"unpreemptively"

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]
