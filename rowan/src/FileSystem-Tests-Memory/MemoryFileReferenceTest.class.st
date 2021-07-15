Class {
	#name : 'MemoryFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'running' }
MemoryFileReferenceTest >> setUp [
	super setUp.
	filesystem := FileSystem memory.
	sandbox := filesystem root
]

{ #category : 'running' }
MemoryFileReferenceTest >> tearDown [

	sandbox children do: [:each | each deleteAll].
	super tearDown
]
