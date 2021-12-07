Class {
	#name : 'LibcFcntl_Linux',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl_Linux >> openPath: pathString flags: flagsInteger mode: modeInteger [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		open: { pathString encodeAsUTF8. flagsInteger. #'int32'. modeInteger. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
LibcFcntl_Linux >> wrappedClass [
	^ _libc_fcntl_Linux
]
