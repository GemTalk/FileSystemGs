"
Part of FileSystem

=========

I represent a memory file system entry for a directory
"
Class {
	#name : 'MemoryFileSystemDirectory',
	#superclass : 'MemoryFileSystemEntry',
	#instVars : [
		'entries'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'creation' }
MemoryFileSystemDirectory >> ensureCreateDirectory: aDirectoryName [
	^ self 
		fileEntryAt: aDirectoryName
		put: (self class named: aDirectoryName)
]

{ #category : 'creation' }
MemoryFileSystemDirectory >> ensureCreateFile: aFileName [
	^ self 
		fileEntryAt: aFileName 
		put: (MemoryFileSystemFile named: aFileName)
]

{ #category : 'enumeration' }
MemoryFileSystemDirectory >> fileEntriesDo: aBlock [
	
	entries do: aBlock
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntriesIncludes: aFileName [
	^ entries includesKey: aFileName
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryAt: aFileName [
	^ entries at: aFileName
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryAt: aFileName ifAbsent: aBlock [
	^ entries at: aFileName ifAbsent: aBlock
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryAt: aFileName ifPresent: aBlock [
	^ (entries at: aFileName ifAbsent: [])
			ifNotNil: [:entry | aBlock value: entry ]
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryAt: aFileName put: anEntry [
	^ entries 
		at: aFileName 
		ifAbsentPut: [
			self modified.
			anEntry ]
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryRemove: aFileName [
	^ self fileEntryRemove: aFileName ifAbsent: [ FileDoesNotExistException signalWith: aFileName ]
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileEntryRemove: aFileName ifAbsent: absentBlock [
	| deletedEntry |
	deletedEntry := entries removeKey: aFileName ifAbsent: [ ^ absentBlock value ].
	modificationTime := DateAndTime now.
	^ deletedEntry
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> fileSize [
	^ 0
]

{ #category : 'initialization' }
MemoryFileSystemDirectory >> initialize [
	super initialize.
	entries := Dictionary new.
]

{ #category : 'testing' }
MemoryFileSystemDirectory >> isDirectory [
	^ true
]

{ #category : 'accessing' }
MemoryFileSystemDirectory >> permissions [
	"Return the closest posix permissions for this entity."

	^FileSystemPermission posixPermissions: 8r777
]
