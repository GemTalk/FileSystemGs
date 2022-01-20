Class {
	#name : 'LibcDirent_Linux',
	#superclass : 'LibcDirent',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcDirent_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]

{ #category : 'functions' }
LibcDirent_Linux >> openDirectoryStreamWithPath: pathString [

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
	result memoryAddress == 0 "NULL"
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcDirent_Linux >> readFromDirectoryStream: dirPointer [
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
	isNull := direntPtr memoryAddress == 0.
	errno := errnoHolder first.
	isNull & (errno ~~ 0)
		ifTrue: [self handleErrno: errno].
	^isNull
		ifTrue: [nil]
		ifFalse: [DirentStruct_Linux forBytes: (CByteArray fromCPointer: direntPtr numBytes: DirentStruct_Linux structSize)]
]
