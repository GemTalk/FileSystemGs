Class {
	#name : 'LibcStat',
	#superclass : 'LibcInterface',
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
