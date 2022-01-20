Class {
	#name : 'LibcStdio',
	#superclass : 'LibcInterface',
	#instVars : [
		'rename'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStdio >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	rename == nil
		ifTrue:
			[rename := CCallout
				library: library
				name: 'rename'
				result: #'int32'
				args: #(#'const char*' #'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := rename
		callWith: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]
