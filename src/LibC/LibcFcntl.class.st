Class {
	#name : 'LibcFcntl',
	#superclass : 'LibcInterface',
	#instVars : [
		'open'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl >> openPath: pathString flags: flagsInteger mode: modeInteger [

	self subclassResponsibility
]
