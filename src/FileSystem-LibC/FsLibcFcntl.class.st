"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Interface to fcntl.h
"
Class {
	#name : 'FsLibcFcntl',
	#superclass : 'FsLibcInterface',
	#instVars : [
		'open',
		'chmod'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcFcntl >> chmod: pathString
posixPermission: posixPermission [

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcFcntl >> open: pathString flags: flagsInteger mode: modeInteger [

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
