Class {
	#name : 'DiskFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'running' }
DiskFileReferenceTest >> setUp [
	super setUp.
	filesystem := FileSystem disk.
	sandbox := FileLocator temp asFileReference / 'DiskFileReferenceTest-Sandbox'.
	self
		assert: sandbox fileSystem
		equals: filesystem.
	self deny: sandbox exists.
	sandbox ensureCreateDirectory
]

{ #category : 'running' }
DiskFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]
