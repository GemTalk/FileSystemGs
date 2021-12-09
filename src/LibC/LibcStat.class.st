Class {
	#name : 'LibcStat',
	#superclass : 'LibcInterface',
	#instVars : [
		'fstat',
		'stat',
		'mkdir'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat >> fstat: fd [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcStat >> mkdir: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcStat >> stat: pathString [

	self subclassResponsibility
]
