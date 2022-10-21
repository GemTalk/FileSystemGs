"
Part of FileSystem

=========

Interface for direct.h
"
Class {
	#name : 'FsLibcDirent',
	#superclass : 'FsLibcInterface',
	#instVars : [
		'opendir',
		'closedir',
		'readdir'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
FsLibcDirent >> closeDirectoryStream: dirPtr [

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
FsLibcDirent >> openDirectoryStreamWithPath: pathString [
	"See warnings in subclasses"

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcDirent >> readFromDirectoryStream: dirPointer [

	self subclassResponsibility
]
