Class {
	#name : 'LibcDirent_macOS',
	#superclass : 'LibcDirent',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent_macOS >> closeDirectoryStream: dirPtr [

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

{ #category : 'initialization' }
LibcDirent_macOS >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
LibcDirent_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
LibcDirent_macOS >> openDirectoryStreamWithPath: pathString [

	| result errnoHolder |
	opendir == nil
		ifTrue:
			[opendir := CCallout
				library: library
				name: 'opendir'
				result: #'int32'
				args: #(#'const char*' )
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
LibcDirent_macOS >> readFromDirectoryStream: dirPointer [
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
		ifFalse: [DirentStruct forBytes: (CByteArray fromCPointer: direntPtr numBytes: DirentStruct structSize)]
]

{ #category : 'accessing' }
LibcDirent_macOS >> wrappedClass [

	^_libc_dirent_macOS
]
