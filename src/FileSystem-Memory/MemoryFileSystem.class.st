"
MemoryFileSystem is not a standard class in FileSystem. GemStone's implementation introduces this class as a corallary to DiskFileSystem. There are no special options specified for this class.
"
Class {
	#name : 'MemoryFileSystem',
	#superclass : 'FileSystem',
	#instVars : [
		'store'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'instance creation' }
MemoryFileSystem class >> store: aStore [

	^self basicNew
		store: aStore;
		yourself
]

{ #category : 'testing' }
MemoryFileSystem >> isMemoryFileSystem [

	^true
]

{ #category : 'accessing' }
MemoryFileSystem >> store [
	"Subclasses all must have a store but subclasses options differ.
	This accessor allows them to manage their variable lifetimes appropriately."

	^store
]

{ #category : 'private-accessing' }
MemoryFileSystem >> store: aStore [
	"Set the store instance variable taking into account lifetime considerations."

	store := aStore
]
