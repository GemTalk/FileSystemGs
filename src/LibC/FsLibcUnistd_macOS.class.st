"
Part of FileSystem

=========

macOS interface to unistd.h
"
Class {
	#name : 'FsLibcUnistd_macOS',
	#superclass : 'FsLibcUnistd',
	#category : 'LibC'
}

{ #category : 'functions' }
FsLibcUnistd_macOS >> ftruncate: fileDescriptor
to: length [

	| errnoHolder result |
	ftruncate == nil
		ifTrue:
			[ftruncate := CCallout
				library: library
				name: 'ftruncate'
				result: #'int64'
				args: #(#'int32' #'int64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := ftruncate
		callWith: { fileDescriptor. length }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
FsLibcUnistd_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
