Class {
	#name : 'MemoryFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'accessing' }
MemoryFileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^'MemoryFileReferenceTest-Sandbox'
]

{ #category : 'running' }
MemoryFileReferenceTest >> setUp [

	super setUp.
	sandbox := FileSystem memory root / self sandboxName.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
MemoryFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
MemoryFileReferenceTest >> testCreationTime [

		self
		assert: sandbox creationTime
		isKindOf: DateAndTime
]
