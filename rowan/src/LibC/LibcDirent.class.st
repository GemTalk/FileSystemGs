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

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcDirent >> openDirectoryStreamWithPath: pathString [
	| result errno |
	CCallout errno: 0.
	result := library opendir_: pathString.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcDirent >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct."

	| direntPtr cBytes errno |
	CCallout errno: 0.
	direntPtr := library readdir_: dirPointer.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	cBytes := direntPtr memoryAddress = 0
		ifTrue: [ direntPtr ]
		ifFalse: [ CByteArray fromCPointer: direntPtr numBytes: 275 ].
	^ DirentStruct forPointer: cBytes
]

{ #category : 'accessing' }
LibcDirent >> wrappedClass [
	^ _libcDirent
]
