"
Part of FileSystem

=========

Test cases for fcntl.h interface
"
Class {
	#name : 'FsLibcFcntlTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
FsLibcFcntlTest >> setUp [
	instance := DiskStore current libcFcntl
]

{ #category : 'tests' }
FsLibcFcntlTest >> testFailOpen [
	"This test relies on the gem's working directory not having a file named testFailOpen.
	This should be true most of the time, but is not guaranteed."

	| filename  fd |
	filename := 'testFailOpen'.
	self
		should: [ fd := instance openPath: filename flags: 0 mode: 0 ]
		raise: FsENOENT.
	self assert: fd equals: nil
]

{ #category : 'tests' }
FsLibcFcntlTest >> testOpenCloseBash [
	"This test relies on the /bin/bash being there and accessible.
	This should be true on all Linux machines. And our Macs, though not necessarily Macs in general."

	| filename fd closeReturn |
	filename := '/bin/bash'.
	fd := instance openPath: filename flags: 0 mode: 0.
	self assert: fd > 0.

	closeReturn := FsLibcUnistd_Linux new closeFd: fd.
	self assert: closeReturn equals: 0
]
