Class {
	#name : 'LibcFcntl',
	#superclass : 'LibcWrapper',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl >> openPath: pathString flags: flagsInteger mode: modeInteger [
	| result pathBuffer varArgs errno |
	pathBuffer := CByteArray withAll: pathString.
	varArgs := Array with: #'int32' with: modeInteger.
	CCallout errno: 0.
	result := library open_: pathString _: flagsInteger _: varArgs.
	errno := CCallout errno.

	result == -1
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'accessing' }
LibcFcntl >> wrappedClass [
	^ _libcFcntl
]
