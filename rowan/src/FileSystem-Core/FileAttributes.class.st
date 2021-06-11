"
This class is returned by #attributes on FileReference.

This class serves as an interface to access attributes of a file. Examples include whether the file is a symlink, the name, the size, modificationTime, etc...
"
Class {
	#name : 'FileAttributes',
	#superclass : 'Object',
	#instVars : [
		'reference'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'instance creation' }
FileAttributes class >> reference: aReference [

	^self new
		reference: aReference;
		yourself
]

{ #category : 'accessing' }
FileAttributes >> basename [
	"Returns the name of the file excluding any parent components."

	^reference basename
]

{ #category : 'accessing' }
FileAttributes >> creationTime [
	"Returns the creation time of the file if available.
	If creation time is unsupported, raise a FileAttributeNotSupported error."

	^FileAttributeNotSupported signalAttribute: #creationTime
]

{ #category : 'testing' }
FileAttributes >> exists [
	"Returns true if the receiver represents attributes for an entry in the file system."

	self subclassResponsibility
]

{ #category : 'testing' }
FileAttributes >> isDirectory [
	"Returns true if the receiver represents attributes for a directory."

	self subclassResponsibility
]

{ #category : 'testing' }
FileAttributes >> isFile [
	"Returns true if the receiver represents attributes for a file."

	self subclassResponsibility
]

{ #category : 'testing' }
FileAttributes >> isSymlink [
	"Returns true if the receiver represents attributes for a symlink."

	self subclassResponsibility
]

{ #category : 'accessing' }
FileAttributes >> modificationTime [
	"Returns the modification time of the file if available."

	self subclassResponsibility
]

{ #category : 'accessing' }
FileAttributes >> name [
	"Returns the name of the file."

	^self basename
]

{ #category : 'accessing' }
FileAttributes >> permissions [
	"Returns the posix permissions for the file."

	self subclassResponsibility
]

{ #category : 'accessing' }
FileAttributes >> reference [
	"Returns the FileReference for which the receiver represents."

	^reference
]

{ #category : 'accessing' }
FileAttributes >> reference: aFileReference [
	"Sets the FileReference for which the receiver represents."

	reference := aFileReference
]

{ #category : 'accessing' }
FileAttributes >> size [
	"Returns the size of the represented file."

	self subclassResponsibility
]
