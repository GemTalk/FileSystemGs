Class {
	#name : 'LibcFcntl',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl >> openPath: pathString flags: flagsInteger mode: modeInteger [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		open: { pathString. flagsInteger. #'int32'. modeInteger. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result

	"| result varArgs errno |
	varArgs := Array with: #'int32' with: modeInteger.
	CCallout errno: 0.
	result := library open_: pathString _: flagsInteger _: varArgs.
	errno := CCallout errno.

	result == -1
		ifTrue: [ self handleErrno: errno ].
	^ result"
]

{ #category : 'accessing' }
LibcFcntl >> wrappedClass [
	^ _libcFcntl
]
