Class {
	#name : 'LibcDirent',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent >> closeDirectoryStream: dirPtr [

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
LibcDirent >> openDirectoryStreamWithPath: pathString [

	| result errnoHolder |
	errnoHolder := { 0 }.
	result := library
		opendir: { pathString }
		errno: errnoHolder.
	result memoryAddress == 0 "NULL"
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcDirent >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| errnoHolder direntPtr isNull errno cBytes |
	errnoHolder := { 0 }.
	direntPtr := library
		readdir: { dirPointer }
		errno: errnoHolder.
	isNull := direntPtr memoryAddress == 0.
	errno := errnoHolder first.
	isNull & (errno ~~ 0)
		ifTrue: [self handleErrno: errno].
	cBytes := isNull
		ifTrue: [direntPtr]
		ifFalse: [CByteArray fromCPointer: direntPtr numBytes: DirentStruct structSize].
	^DirentStruct forPointer: cBytes
]

{ #category : 'accessing' }
LibcDirent >> wrappedClass [
	^ _libcDirent
]
