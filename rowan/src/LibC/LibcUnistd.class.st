Class {
	#name : 'LibcUnistd',
	#superclass : 'LibcWrapper',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd >> closeFd: fdInteger [
	| result errno |
	CCallout errno: 0.
	result := library close_: fdInteger.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcUnistd >> readFromFileDescriptor: fd toBuffer: buf count: bytes [
	| result errno |
	CCallout errno: 0.
	result := library read_: fd _: buf _: bytes.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'accessing' }
LibcUnistd >> wrappedClass [
	^ _libcUnistd
]

{ #category : 'functions' }
LibcUnistd >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [
	| result errno |
	CCallout errno: 0.
	result := library write_: fd _: buf _: bytes.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]
