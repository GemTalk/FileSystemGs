Class {
	#name : 'DiskFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'accessing' }
DiskFileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^'DiskFileReferenceTest-Sandbox'
]

{ #category : 'running' }
DiskFileReferenceTest >> setUp [
	super setUp.
	filesystem := FileSystem disk.
	sandbox := FileLocator temp asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: filesystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
DiskFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]
