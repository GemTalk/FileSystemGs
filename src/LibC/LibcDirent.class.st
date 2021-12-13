Class {
	#name : 'LibcDirent',
	#superclass : 'LibcInterface',
	#instVars : [
		'opendir',
		'closedir',
		'readdir'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcDirent >> closeDirectoryStream: dirPtr [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcDirent >> openDirectoryStreamWithPath: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcDirent >> readFromDirectoryStream: dirPointer [

	self subclassResponsibility
]
