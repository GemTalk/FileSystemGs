Class {
	#name : 'LibcDirent_Linux',
	#superclass : 'LibcDirent',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent_Linux >> closeDirectoryStream: dirPtr [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		closedir: { dirPtr }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcDirent_Linux >> openDirectoryStreamWithPath: pathString [

	| result errnoHolder |
	errnoHolder := { 0 }.
	result := library
		opendir: { pathString encodeAsUTF8 }
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
	errnoHolder := { 0 }.
	direntPtr := library
		readdir: { dirPointer }
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
LibcDirent_Linux >> wrappedClass [
	^ _libc_dirent_Linux
]
