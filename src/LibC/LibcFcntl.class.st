Class {
	#name : 'LibcFcntl',
	#superclass : 'LibcInterface',
	#instVars : [
		'open',
		'chmod'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl >> chmod: pathString
posixPermission: posixPermission [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcFcntl >> openPath: pathString flags: flagsInteger mode: modeInteger [

	| errnoHolder result |
	open == nil
		ifTrue: [open := CCallout
			library: library
			name: 'open'
			result: #'int32'
			args: #(#'const char*' #'int32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := open
		callWith: { pathString encodeAsUTF8. flagsInteger. #'int32'. modeInteger. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]
