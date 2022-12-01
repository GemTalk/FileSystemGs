"
Part of FileSystem

=========

SUnit tests for the disk filesystem
"
Class {
	#name : 'FsDiskFileSystemTest',
	#superclass : 'FileSystemTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'initialize-release' }
FsDiskFileSystemTest >> createFileSystem [

	^FsDiskFileSystem store: (DiskStore createDefault)
]

{ #category : 'tests' }
FsDiskFileSystemTest >> testEqual [
	| other |
	other := self createFileSystem.
	self assert: filesystem = other
]

{ #category : 'tests' }
FsDiskFileSystemTest >> testIsDirectory [
	self assert: (filesystem isDirectory: FileLocator imageDirectory resolve path)
]

{ #category : 'tests' }
FsDiskFileSystemTest >> testIsDiskFileSystem [
	self assert: filesystem isDiskFileSystem.
	
]

{ #category : 'tests' }
FsDiskFileSystemTest >> testMoveMemoryToDisk [
	"Test moving a file from the memory filesystem to the disk filesystem.
	This ensures that the copyAndDelete:to: is called correctly."
	| memfs out testString old new |
	[
		memfs := FileSystem memory.
		old := memfs / 'testMoveMemoryToDisk_old'.
		out := old writeStream.
		testString := 'To be moved to disk'.
		[ out nextPutAll: testString ] ensure: [ out close ].
		
		new := FileLocator workingDirectory / 'testMoveMemoryToDisk_new'.
		old moveTo: new.
		
		self deny: (memfs / 'testMoveMemoryToDisk_old') exists.
		self assert: new exists.
		self assert: new contents equals: testString.
	] ensure: [ 
		old ensureDelete.
		new ensureDelete.
	]
]

{ #category : 'tests' }
FsDiskFileSystemTest >> testWorkingDirectory [
	| ref x y |
	"self fail." "Should this use GsFile?"
	ref := filesystem workingDirectory.
	x := GsFile serverRealPath: (GsFile _expandEnvVariable: 'PWD' isClient:false).
	self assert: (x beginsWith: (y := ref pathString))
]
