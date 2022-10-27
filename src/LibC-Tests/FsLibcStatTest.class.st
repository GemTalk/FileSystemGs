"
Part of FileSystem

=========

Test cases for stat.h interface
"
Class {
	#name : 'FsLibcStatTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
FsLibcStatTest >> setUp [

	super setUp.
	instance := DiskStore current libcStat
]

{ #category : 'running' }
FsLibcStatTest >> testStatRootDirectory [

	| stat |
	stat := instance stat: '/'.
	self assert: stat isDirectory
]
