"
I am a wrapper around a MemoryDirectoryEntry which is polymorphic with the Stat cache used for DiskDirectoryEntry
"
Class {
	#name : 'MemoryDirectoryEntry',
	#superclass : 'FileSystemDirectoryEntry',
	#instVars : [
		'entry'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'instance creation' }
MemoryDirectoryEntry class >> reference: aFileReference
entry: fileOrDirectoryEntry [

	^self new
		reference: aFileReference;
		entry: fileOrDirectoryEntry;
		yourself
]

{ #category : 'accessing' }
MemoryDirectoryEntry >> entry [

	^entry
]

{ #category : 'accessing' }
MemoryDirectoryEntry >> entry: aFileOrDirectoryEntry [

	entry := aFileOrDirectoryEntry
]

{ #category : 'testing' }
MemoryDirectoryEntry >> isDirectory [
	"Return whether the receiver is a directory"
	
	^entry isDirectory
]

{ #category : 'testing' }
MemoryDirectoryEntry >> isSymlink [
	"Return whether the receiver is a symlink"
	
	^entry isSymlink
]
