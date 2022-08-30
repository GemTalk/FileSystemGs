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

	| fileSystem |
	super setUp.
	fileSystem := FileSystem disk.
	sandbox := FileLocator temp asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: fileSystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
DiskFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
DiskFileReferenceTest >> testAccessTime [

	self
		assert: sandbox accessTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
DiskFileReferenceTest >> testCreationTime [
	"See subclass implementations"

	self
		should: [sandbox creationTime]
		raise: FileAttributeNotSupported
]
