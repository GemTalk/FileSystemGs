Class {
	#name : 'DiskFileSystem',
	#superclass : 'FileSystem',
	#instVars : [
		'store'
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
