Extension { #name : 'FileSystem' }

{ #category : '*FileSystem-Memory' }
FileSystem class >> currentMemoryFileSystem [
	^ MemoryStore currentFileSystem
]

{ #category : '*FileSystem-Memory' }
FileSystem class >> memory [
	^ self store: MemoryStore new
]

{ #category : '*FileSystem-Memory' }
FileSystem >> isMemoryFileSystem [
	^ store isMemoryFileSystem
]
