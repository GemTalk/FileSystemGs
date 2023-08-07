"
Part of FileSystem

=========

MemoryFileSystem is not a standard class in FileSystem. GemStone's implementation introduces this class as a corallary to DiskFileSystem. There are no special options specified for this class.
"
Class {
	#name : 'FsMemoryFileSystem',
	#superclass : 'FileSystem',
	#instVars : [
		'store'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'instance creation' }
FsMemoryFileSystem class >> store: aStore [

	^self basicNew
		store: aStore;
		yourself
]

{ #category : 'testing' }
FsMemoryFileSystem >> isMemoryFileSystem [

	^true
]

{ #category : 'printing' }
FsMemoryFileSystem >> printJsonOn: aStream [
	"Print a JSON representation on the provided stream.
	For FileSystem this is defined as ""disk"" for disk-based
	instances and ""memory"" for memory-based instances."

	aStream nextPutAll: '"memory"'
]

{ #category : 'accessing' }
FsMemoryFileSystem >> store [
	"Subclasses all must have a store but subclasses options differ.
	This accessor allows them to manage their variable lifetimes appropriately."

	^store
]

{ #category : 'private-accessing' }
FsMemoryFileSystem >> store: aStore [
	"Set the store instance variable taking into account lifetime considerations."

	store := aStore
]

{ #category : 'public-operations' }
FsMemoryFileSystem >> symlink: linkPathString
toTarget: targetPathString [
	"Create a symlink to the targetPathString
	at the location specified by linkPathString.
	Note: The caller is expected to provide
	path strings. Other resolvables are not
	supported."

	self error: 'Symlinks are not supported by memory-based FileSystem instances.'
]
