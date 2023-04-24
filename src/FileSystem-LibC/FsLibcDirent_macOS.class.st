"
Part of FileSystem

=========

Abstract macOS interface to dirent.h
"
Class {
	#name : 'FsLibcDirent_macOS',
	#superclass : 'FsLibcDirent',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcDirent_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
FsLibcDirent_macOS >> openDirectoryStreamWithPath: pathString [
	"This result is not automatically freed.
	The caller is expected to ensure
	#closeDirectoryStream: is always called."

	| result errnoHolder |
	opendir == nil
		ifTrue:
			[opendir := CCallout
				library: library
				name: self opendirName
				result: #'ptr'
				args: #(#'const char*' )
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := opendir
		callWith: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result isNull
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
FsLibcDirent_macOS >> opendirName [
	"Returns the name of the opendir function"

	self subclassResponsibility
]

{ #category : 'accessing' }
FsLibcDirent_macOS >> readdirName [
	"Returns the name of the readdir function"

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcDirent_macOS >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| errnoHolder direntPtr isNull errno |
	readdir == nil
		ifTrue:
			[readdir := CCallout
				library: library
				name: self readdirName
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
		ifFalse: [FsDirentStruct_macOS forBytes: (CByteArray fromCPointer: direntPtr numBytes: FsDirentStruct_macOS structSize)]
]
