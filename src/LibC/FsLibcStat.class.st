"
Part of FileSystem

=========

Interface to stat.h
"
Class {
	#name : 'FsLibcStat',
	#superclass : 'FsLibcInterface',
	#instVars : [
		'fstat',
		'stat',
		'mkdir'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
FsLibcStat >> fstat: fd [

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcStat >> mkdir: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcStat >> stat: pathString [

	self subclassResponsibility
]
