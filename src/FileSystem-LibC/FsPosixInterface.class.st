Class {
	#name : 'FsPosixInterface',
	#superclass : 'Object',
	#instVars : [
		'library',
		'opendir',
		'closedir',
		'readdir'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'instance creation' }
FsPosixInterface class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'interface-dirent' }
FsPosixInterface >> closeDirectoryStream: dirPtr [

	| errnoHolder result |
	closedir == nil
		ifTrue:
			[closedir := CCallout
				library: library
				name: 'gs_fs_closedir'
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

{ #category : 'error handling' }
FsPosixInterface >> handleErrno: errorNumber [
	" Default handling of system errors: just signal the default exception class for the error.
	Subclasses may override this method for specific errors that need other handling."

	| errorClass |
	errorClass := FsUnixError errorClassForErrorNumber: errorNumber.
	^ errorClass signal
]

{ #category : 'initialization' }
FsPosixInterface >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
FsPosixInterface >> libraryName [
	"Returns the name or path to the library that should be loaded."

	^'libFileSystemGs.so'
]

{ #category : 'interface-dirent' }
FsPosixInterface >> openDirectoryStreamWithPath: pathString [
	"This result is not automatically freed.
	The caller is expected to ensure
	#closeDirectoryStream: is always called."

	| result errnoHolder |
	opendir == nil
		ifTrue:
			[opendir := CCallout
				library: library
				name: 'gs_fs_opendir'
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

{ #category : 'interface-dirent' }
FsPosixInterface >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| errnoHolder direntPtr isNull errno |
	readdir == nil
		ifTrue:
			[readdir := CCallout
				library: library
				name: 'gs_fs_readdir'
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
