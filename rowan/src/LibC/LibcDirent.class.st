Class {
	#name : 'LibcDirent',
	#superclass : 'LibcWrapper',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent >> closeDirectoryStream: dirPtr [
	| result errno |
	CCallout errno: 0.
	result := library closedir_: dirPtr.
	errno := CCallout errno.

	result == -1
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcDirent >> openDirectoryStreamWithPath: pathString [
	| result errno |
	CCallout errno: 0.
	result := library opendir_: pathString.
	errno := CCallout errno.

	result memoryAddress == 0 "NULL"
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcDirent >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| direntPtr cBytes errno isNull |
	CCallout errno: 0.
	direntPtr := library readdir_: dirPointer.
	errno := CCallout errno.

	isNull := direntPtr memoryAddress == 0.
	isNull & (errno ~~ 0)
		ifTrue: [ self handleErrno: errno ].
	cBytes := isNull
		ifTrue: [ direntPtr ]
		ifFalse: [ CByteArray fromCPointer: direntPtr numBytes: 275 ].
	^ DirentStruct forPointer: cBytes
]

{ #category : 'accessing' }
LibcDirent >> wrappedClass [
	^ _libcDirent
]
