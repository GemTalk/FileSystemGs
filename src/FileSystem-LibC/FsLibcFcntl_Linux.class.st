"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Linux fcntl.h interface
"
Class {
	#name : 'FsLibcFcntl_Linux',
	#superclass : 'FsLibcFcntl',
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcFcntl_Linux >> chmod: pathString
mode: mode [

	| errnoHolder result |
	chmod == nil
		ifTrue: [chmod := CCallout
			library: library
			name: 'chmod'
			result: #'int32'
			args: #(#'const char*' #'uint32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := chmod
		callWith: { pathString encodeAsUTF8. mode }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
FsLibcFcntl_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
