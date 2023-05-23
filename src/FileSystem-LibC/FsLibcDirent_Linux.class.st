"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Interface for Linux specific aspects of dirent.h
"
Class {
	#name : 'FsLibcDirent_Linux',
	#superclass : 'FsLibcDirent',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcDirent_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]

{ #category : 'functions' }
FsLibcDirent_Linux >> openDirectoryStreamWithPath: pathString [
	"This result is not automatically freed.
	The caller is expected to ensure
	#closeDirectoryStream: is always called."

	| result errnoHolder |
	opendir == nil
		ifTrue:
			[opendir := CCallout
				library: library
				name: 'opendir'
				result: #'ptr'
				args: #(#'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := opendir
		callWith: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result isNull
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcDirent_Linux >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| errnoHolder direntPtr isNull errno |
	readdir == nil
		ifTrue:
			[readdir := CCallout
				library: library
				name: 'readdir'
				result: #'ptr'
				args: #(#'ptr')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	direntPtr := readdir
		callWith: { dirPointer }
		errno: errnoHolder.
	isNull := direntPtr isNull.
	errno := errnoHolder first.
	isNull & (errno ~~ 0)
		ifTrue: [self handleErrno: errno].
	^isNull
		ifTrue: [nil]
		ifFalse: [FsDirentStruct_Linux forBytes: (CByteArray fromCPointer: direntPtr numBytes: FsDirentStruct_Linux structSize)]
]
