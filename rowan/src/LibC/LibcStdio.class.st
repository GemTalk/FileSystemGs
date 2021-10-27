Class {
	#name : 'LibcStdio',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStdio >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	errnoHolder := { 0 }.
	status := library
		rename: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]
