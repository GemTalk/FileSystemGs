"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Interface to stdio.h
"
Class {
	#name : 'FsLibcStdio',
	#superclass : 'FsLibcInterface',
	#instVars : [
		'rename'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcStdio >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	rename == nil
		ifTrue:
			[rename := CCallout
				library: library
				name: 'rename'
				result: #'int32'
				args: #(#'const char*' #'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := rename
		callWith: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]
