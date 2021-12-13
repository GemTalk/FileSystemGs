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

	self subclassResponsibility
]
