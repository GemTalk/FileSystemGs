Class {
	#name : 'LibcDirent',
	#superclass : 'LibcInterface',
	#instVars : [
		'opendir',
		'closedir',
		'readdir'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent >> closeDirectoryStream: dirPtr [

	| errnoHolder result |
	closedir == nil
		ifTrue:
			[closedir := CCallout
				library: library
				name: 'closedir'
				result: #'int32'
				args: #(#'ptr')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := closedir
		callWith: { dirPtr }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcDirent >> openDirectoryStreamWithPath: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcDirent >> readFromDirectoryStream: dirPointer [

	self subclassResponsibility
]
