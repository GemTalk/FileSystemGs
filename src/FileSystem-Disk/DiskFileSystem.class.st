"
DiskFileSystem is not a standard class in FileSystem. GemStone's implementation introduces this class to avoid committing platform-specific objects like LinuxStore_aarch64 instances. Instead, DiskFileSystem will lazily recreate its store. This class avoids committing any of its instance variables by marking itself as DbTransient.
"
Class {
	#name : 'DiskFileSystem',
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
DiskFileSystem class >> store: aStore [

	^self basicNew
		store: aStore;
		yourself
]

{ #category : 'testing' }
DiskFileSystem >> isDiskFileSystem [

	^true
]

{ #category : 'accessing' }
DiskFileSystem >> store [
	"Returns the associated store, ensuring it is recreated if necessary."

	^store ifNil: [store := DiskStore activeClass createDefault]
]

{ #category : 'private-accessing' }
DiskFileSystem >> store: aStore [
	"Set the store instance variable taking into account lifetime considerations."

	store := aStore
]
