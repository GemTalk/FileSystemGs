Class {
	#name : 'LibcDirentTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
LibcDirentTest >> setUp [
	instance := DiskStore current libcDirent
]

{ #category : 'tests' }
LibcDirentTest >> testListDirectory [
	"List the files in the current working directory"

	| dir names dirent returned |
	dir := instance openDirectoryStreamWithPath: '.'.
	self assert: dir memoryAddress > 0.
	names := OrderedCollection new.
	[dirent := instance readFromDirectoryStream: dir.
	dirent isNil]
		whileFalse:
			[names add: dirent d_name].
	self assert: names size >= 2.
	self assert: names first class equals: ByteArray.
	returned := instance closeDirectoryStream: dir.
	self assert: returned equals: 0
]

{ #category : 'tests' }
LibcDirentTest >> testListFile [
	"Ensure reading a file results in an ENOTDIR"

	| dir names dirent returned |
	self
		should: [instance openDirectoryStreamWithPath: '/usr/bin/env']
		raise: ENOTDIR
]
