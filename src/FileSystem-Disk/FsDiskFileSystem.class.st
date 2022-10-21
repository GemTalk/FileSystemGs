"
Part of FileSystem

=========

DiskFileSystem is not a standard class in FileSystem. GemStone's implementation introduces this class to avoid committing platform-specific objects like LinuxStore_aarch64 instances. Instead, DiskFileSystem will lazily recreate its store. This class avoids committing any of its instance variables by marking itself as DbTransient.
"
Class {
	#name : 'FsDiskFileSystem',
	#superclass : 'FileSystem',
	#instVars : [
		'store'
	],
	#gs_options : [
		'dbTransient'
	],
	#category : 'FileSystem-Disk'
}

{ #category : 'instance creation' }
FsDiskFileSystem class >> store: aStore [

	^self basicNew
		store: aStore;
		yourself
]

{ #category : 'testing' }
FsDiskFileSystem >> isDiskFileSystem [

	^true
]

{ #category : 'accessing' }
FsDiskFileSystem >> store [
	"Returns the associated store, ensuring it is recreated if necessary."

	^store ifNil: [store := DiskStore activeClass createDefault]
]

{ #category : 'private-accessing' }
FsDiskFileSystem >> store: aStore [
	"Set the store instance variable taking into account lifetime considerations."

	store := aStore
]
