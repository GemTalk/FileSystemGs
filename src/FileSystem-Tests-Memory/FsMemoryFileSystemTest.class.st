"
Part of FileSystem

=========

SUnit tests for MemoryFileSystem
"
Class {
	#name : 'FsMemoryFileSystemTest',
	#superclass : 'FileSystemTest',
	#category : 'FileSystem-Tests-Memory'
}

{ #category : 'initialize-release' }
FsMemoryFileSystemTest >> createFileSystem [
	^ FileSystem memory
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> lastModificationTimeOf: fileReference [
	"DateAndTime primUTCMicrosecondsClock is not precise across all OS so put in slight delay between calling modificationTime"

	^ [ fileReference modificationTime ]
		ensure: [ (Delay forMilliseconds: 100) wait ]
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testCurrentEqual [
	| other another |
	another := FileSystem currentMemoryFileSystem.
	other := FileSystem currentMemoryFileSystem.
	self assert: other equals: another
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testIsMemoryFileSystem [
	self assert: filesystem isMemoryFileSystem.
	
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testModifiedTimeWhenFileCreated [
	self assert: (filesystem / 'file.txt') ensureCreateFile modificationTime notNil
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testModifiedTimeWhenFileModifiedByWriteStream [
	| modifiedTime fileReference |
	fileReference := (filesystem / 'file.txt') ensureCreateFile.
	modifiedTime := self lastModificationTimeOf: fileReference.
	fileReference writeStreamDo: [ :aStream | aStream nextPutAll: 'data' ].
	self assert: modifiedTime notNil.
	self deny: modifiedTime equals: fileReference modificationTime
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testModifiedTimeWhenFileModifiedWithBinaryWriteStream [
	| modifiedTime fileReference data |
	fileReference := (filesystem / 'file.txt') ensureCreateFile.
	modifiedTime := self lastModificationTimeOf: fileReference.
	data := 'some data'.
	fileReference binaryWriteStreamDo: [ :aStream | aStream nextPutAll: data ].
	self assert: modifiedTime notNil.
	self deny: modifiedTime equals: fileReference modificationTime.
	self
		assert: data asByteArray
		equals: (fileReference binaryReadStreamDo: [ :aStream | aStream upToEnd ]).
	self assert: data equals: (fileReference readStreamDo: [ :aStream | aStream contents ])
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testModifiedTimeWhenFileWrittenTo [
	| modifiedTime fileReference |
	fileReference := (filesystem / 'file.txt') ensureCreateFile.
	modifiedTime := self lastModificationTimeOf: fileReference.
	fileReference binaryWriteStreamDo: [ :aStream | aStream nextPutAll: 'data' ].
	self assert: modifiedTime notNil.
	self deny: modifiedTime equals: fileReference modificationTime
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testModifiedTimeWhenHandleTruncated [
	| modifiedTime fileReference handle |
	fileReference := (filesystem / 'file.txt') ensureCreateFile.
	handle := fileReference openWritable: true.
	modifiedTime := self lastModificationTimeOf: fileReference.
	handle truncate.
	self assert: modifiedTime notNil.
	self deny: modifiedTime equals: fileReference modificationTime
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testNotEqualWhenCreatingNewMemoryFileSystem [
	| other |
	other := FileSystem memory.
	self deny: other equals: filesystem
]

{ #category : 'tests' }
FsMemoryFileSystemTest >> testNotEqualWhenRequestingMemoryFileSystem [
	| other |
	other := self createFileSystem.
	self deny: other equals: filesystem
]
