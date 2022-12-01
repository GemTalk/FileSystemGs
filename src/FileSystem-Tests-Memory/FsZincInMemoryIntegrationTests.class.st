"
Part of FileSystem

=========

SUnit tests for random zinc stream integration issues.
"
Class {
	#name : 'FsZincInMemoryIntegrationTests',
	#superclass : 'FsZincIntegrationTests',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'accessing' }
FsZincInMemoryIntegrationTests >> sandboxName [
	"name of the sandbox directory"

	^'FsZincInMemoryIntegrationTests-Sandbox'
]

{ #category : 'running' }
FsZincInMemoryIntegrationTests >> setUp [

	super setUp.
	sandbox := FileSystem memory root / self sandboxName.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
FsZincInMemoryIntegrationTests >> tearDown [

	sandbox deleteAll.
	super tearDown
]
