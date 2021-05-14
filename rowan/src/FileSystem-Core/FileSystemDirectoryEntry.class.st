"
I am a cache for metadata about a file or directory. The information I hold is as follows:

reference
	A reference to the file or directory to which my data pertains.
"
Class {
	#name : 'FileSystemDirectoryEntry',
	#superclass : 'Object',
	#instVars : [
		'reference'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'accessing' }
FileSystemDirectoryEntry class >> allPosixPermissions [ 
	^8r777
]

{ #category : 'converting' }
FileSystemDirectoryEntry >> asFileReference [
	^ reference
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> basename [

	^ reference basename
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> creation [
	^ self creationTime 
]

{ #category : 'other' }
FileSystemDirectoryEntry >> creationSeconds [
	"Return the creation date and time of the entry receiver in seconds."

	^self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> creationTime [
	"Return the creation date and time of the entry receiver."

	^self subclassResponsibility
]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> extension [
	^ reference extension
]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> fullName [
	^ reference fullName
]

{ #category : 'testing' }
FileSystemDirectoryEntry >> isDirectory [
	"Return whether the receiver is a directory"
	
	^self subclassResponsibility
]

{ #category : 'testing' }
FileSystemDirectoryEntry >> isFile [
	"Return whether the receiver is a file"
	
	^self isDirectory not
]

{ #category : 'testing' }
FileSystemDirectoryEntry >> isSymlink [ 

	^self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> modification [
	^ self modificationTime 
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> modificationSeconds [
	"Return the modification date and time of the entry receiver in seconds."

	^self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> modificationTime [
	"Return the modification date and time of the entry receiver."

	^self subclassResponsibility
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> name [
    ^ self basename
]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> pathSegments [
	^ reference pathSegments
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> permissions [ 
	^self posixPermissions
		ifNotNil: [ FileSystemPermission posixPermissions: self posixPermissions ]
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> posixPermissions [ 

	^self subclassResponsibility
]

{ #category : 'printing' }
FileSystemDirectoryEntry >> printOn: aStream [

	aStream nextPutAll: 'DirectoryEntry: '.
	reference ifNotNil: [:ref | aStream nextPutAll: reference printString].
]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> readStream [
	^ reference readStreamPortable

]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> readStreamPortable [
	^ reference readStreamPortable

]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> reference [
	^ reference
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> reference: aFileReference [

	reference := aFileReference
]

{ #category : 'accessing' }
FileSystemDirectoryEntry >> size [
	"Returns the receiver size"

	^self subclassResponsibility
]

{ #category : 'delegate' }
FileSystemDirectoryEntry >> writeStream [

	^reference writeStream
]
