"
Part of FileSystem

=========

macOS fcntl.h interface
"
Class {
	#name : 'FsLibcFcntl_macOS',
	#superclass : 'FsLibcFcntl',
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcFcntl_macOS >> chmod: pathString
mode: mode [

	| errnoHolder result |
	chmod == nil
		ifTrue: [chmod := CCallout
			library: library
			name: 'chmod'
			result: #'int32'
			args: #(#'const char*' #'uint16')
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
FsLibcFcntl_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
