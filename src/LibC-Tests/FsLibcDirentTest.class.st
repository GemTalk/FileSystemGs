Class {
	#name : 'FsLibcDirentTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
FsLibcDirentTest >> setUp [
	instance := DiskStore current libcDirent
]

{ #category : 'tests' }
FsLibcDirentTest >> testListDirectory [
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
FsLibcDirentTest >> testListFile [
	"Ensure reading a file results in an FsENOTDIR"

	self
		should: [instance openDirectoryStreamWithPath: '/usr/bin/env']
		raise: FsENOTDIR
]
