"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

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
	#category : 'FileSystem-LibC'
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
