"
Part of FileSystem

=========

SUnit tests for random zinc stream integration issues.
"
Class {
	#name : 'FsZincDiskIntegrationTests',
	#superclass : 'FsZincIntegrationTests',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'accessing' }
FsZincDiskIntegrationTests >> sandboxName [
	"name of the sandbox directory"

	^'FsZincDiskIntegrationTests-Sandbox'
]

{ #category : 'running' }
FsZincDiskIntegrationTests >> setUp [

	| fileSystem |
	super setUp.
	fileSystem := FileSystem disk.
	sandbox := FileLocator workingDirectory asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: fileSystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
FsZincDiskIntegrationTests >> tearDown [

	sandbox deleteAll.
	super tearDown
]
