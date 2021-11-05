Class {
	#name : 'LibcDirent',
	#superclass : 'LibcInterface',
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
