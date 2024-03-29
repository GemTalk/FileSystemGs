"
Part of FileSystem

=========

I am an abstract file system entry for a memory file system.
My subclasses should specialize on the kind of file they are.
"
Class {
	#name : 'MemoryFileSystemEntry',
	#superclass : 'Object',
	#instVars : [
		'creationTime',
		'modificationTime',
		'basename'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'instance creation' }
MemoryFileSystemEntry class >> named: aFileName [
	^ self new
		basename: aFileName;
		yourself
]

{ #category : 'instance creation' }
MemoryFileSystemEntry class >> new [

	^ self basicNew
		initialize;
		yourself
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> basename [
	^ basename
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> basename: aString [
	basename := aString
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> creationTime [
	
	^ creationTime
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> fileSize [
	self subclassResponsibility 
]

{ #category : 'initialization' }
MemoryFileSystemEntry >> initialize [ 
	creationTime := modificationTime := DateAndTime now.
]

{ #category : 'testing' }
MemoryFileSystemEntry >> isDirectory [
	self subclassResponsibility
]

{ #category : 'testing' }
MemoryFileSystemEntry >> isFile [
	^ self isDirectory not
]

{ #category : 'testing' }
MemoryFileSystemEntry >> isSymlink [
	"Does this entry represent a symlink?"

	^false
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> modificationTime [
	^ modificationTime
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> modificationTime: anObject [
	
	modificationTime := anObject
]

{ #category : 'private' }
MemoryFileSystemEntry >> modified [
	modificationTime := DateAndTime now.
]

{ #category : 'accessing' }
MemoryFileSystemEntry >> permissions [
	"Return the closest posix permissions for this entity."

	self subclassResponsibility
]
