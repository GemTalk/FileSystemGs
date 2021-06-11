"
This class implements the FileAttributes interface for files store on the Disk.
"
Class {
	#name : 'DiskFileAttributes',
	#superclass : 'FileAttributes',
	#instVars : [
		'store'
	],
	#category : 'FileSystem-Disk'
}

{ #category : 'instance creation' }
DiskFileAttributes class >> reference: aFileReference
store: aDiskStore [

	^(self reference: aFileReference)
		store: aDiskStore;
		yourself
]

{ #category : 'instance creation' }
DiskFileAttributes class >> stat: aStatStruct [

	^self new
		stat: aStatStruct;
		yourself
]

{ #category : 'testing' }
DiskFileAttributes >> isDirectory [
	"Returns true if the receiver represents attributes for a directory."

	^reference fileSystem isDirectory: reference
]

{ #category : 'testing' }
DiskFileAttributes >> isFile [
	"Returns true if the receiver represents attributes for a file."

	^reference fileSystem isFile: reference
]

{ #category : 'testing' }
DiskFileAttributes >> isSymlink [
	"Returns true if the receiver represents attributes for a symlink."

	^reference fileSystem isSymlink: reference
]
