"
Part of FileSystem

=========

I'm a specific store for memory file system
"
Class {
	#name : 'MemoryStore',
	#superclass : 'FileSystemStore',
	#instVars : [
		'root'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'current' }
MemoryStore class >> currentFileSystem [

	^SessionTemps current
		at: #MemoryStoreCurrentFS
		ifAbsentPut: [FsMemoryFileSystem store: MemoryStore new]
]

{ #category : 'public' }
MemoryStore class >> delimiter [
	^ $/
]

{ #category : 'class initialization' }
MemoryStore class >> reset [

	SessionTemps current removeKey: #MemoryStoreCurrentFS
]

{ #category : 'system startup' }
MemoryStore class >> startUp [
	self reset
]

{ #category : 'accessing' }
MemoryStore >> changeTimeOf: aPath [
	"Return the date of change of the File described by aPath"

	^self
		entryAt: aPath
		ifPresent: [:entry | entry modificationTime]
		ifAbsent: [self signalFileDoesNotExist: aPath]
]

{ #category : 'public' }
MemoryStore >> checkName: aString fixErrors: fixErrors [
	aString ifEmpty: [ self error: 'zero length file name' ].
	^ aString
]

{ #category : 'private' }
MemoryStore >> copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock fileSystem: aFilesystem [
        | sourceNode destinationNode |

        sourceNode := self
                entryAt: sourcePath
                ifPresent: [ :source | source ]
                ifAbsent: [ ^ absentBlock value].

        sourceNode isDirectory
                ifTrue: [ ^ absentBlock value ].

        destinationNode := self
                entryAt: destinationPath parent
                ifPresent: [ :destination |  destination ]
                ifAbsent: [ ^ self signalDirectoryDoesNotExist: destinationPath parent ].

        destinationNode isFile
                ifTrue: [ self signalDirectoryDoesNotExist: destinationPath parent ].

        (destinationNode fileEntriesIncludes: destinationPath basename)
                ifTrue: [ "cannot overwrite existing file"^ presentBlock value ].

        destinationNode
                fileEntryAt: destinationPath basename
                put: (sourceNode copy
                                        basename: destinationPath basename;
                                        yourself)
]

{ #category : 'public' }
MemoryStore >> createDirectory: path [
	| parent |
	parent := path parent.
	^ self
		entryAt: parent
		ifPresent: [ :entry | 
			entry
				fileEntryAt: path basename
				ifPresent: [ :node | 
					node isDirectory
						ifTrue: [ self signalDirectoryExists: path ]
						ifFalse: [ self signalFileExists: path ] ].
			entry ensureCreateDirectory: path basename  ]
		ifAbsent: [ self signalDirectoryDoesNotExist: parent ]
]

{ #category : 'public' }
MemoryStore >> createFile: aPath [

	^self
		entryAt: aPath parent
		ifPresent: [ :entry | 
			entry isDirectory
				ifTrue: [ entry ensureCreateFile: aPath basename ]]
		ifAbsent: [ self signalDirectoryDoesNotExist: aPath parent ]
]

{ #category : 'accessing' }
MemoryStore >> creationTimeOf: aPath [
	"Return the date of creation of the File described by aPath"

	^self
		entryAt: aPath
		ifPresent: [:entry | entry creationTime]
		ifAbsent: [self signalFileDoesNotExist: aPath]
]

{ #category : 'accessing' }
MemoryStore >> currentWorkingDirectoryPath [
	"For in-memory file systems, the working directory is the root directory."

	^Path root
]

{ #category : 'public' }
MemoryStore >> delete: path [

	self 
		entryAt: path parent
		ifPresent: [ :dict | 
			dict fileEntryRemove: path basename ifAbsent: [ FileDoesNotExistException signalWith: path ]] 
		ifAbsent: [ DirectoryDoesNotExist signalWith: path parent ]
]

{ #category : 'public' }
MemoryStore >> deleteAll: path
in: fileSystem [

	self 
		entryAt: path parent
		ifPresent:
			[:dict | 
			dict
				fileEntryRemove: path basename
				ifAbsent: [FileDoesNotExistException signalWith: path]] 
		ifAbsent: [DirectoryDoesNotExist signalWith: path parent]
]

{ #category : 'public' }
MemoryStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
directoryNamesDo: aBlock [
	"Enumerate through the directory names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo: [:entry | entry isDirectory ifTrue: [aBlock value: entry basename]]
]

{ #category : 'private' }
MemoryStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
entriesDo: aBlock [
	"Enumerate through the entries in the provided directory."

	| parent |
	self
		entryAt: aPath
		ifPresent: [:p | parent := p]
		ifAbsent: [^absentBlock value].
	parent isDirectory
		ifTrue: [parent fileEntriesDo: aBlock]
		ifFalse: [^notDirectoryBlock value]
]

{ #category : 'public' }
MemoryStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
entryNamesDo: aBlock [
	"Enumerate through the entries in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo: [:entry | aBlock value: entry basename]
]

{ #category : 'public' }
MemoryStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
fileNamesDo: aBlock [
	"Enumerate through the file names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo: [:entry | entry isFile ifTrue: [aBlock value: entry basename]]
]

{ #category : 'private' }
MemoryStore >> entryAt: aPath
ifPresent: presentBlock
ifAbsent: absentBlock [

	| current |
	current := self root.
	aPath isRoot
		ifTrue: [^presentBlock value: current].
	aPath
		do:
			[:segment |
			current isDirectory
				ifTrue:
					[current := current
						fileEntryAt: segment
						ifAbsent: [^absentBlock value]]
				ifFalse: [^absentBlock value]].
	^ presentBlock value: current
]

{ #category : 'testing' }
MemoryStore >> exists: aPath [

	^self
		entryAt: aPath
		ifPresent: [:entry | true]
		ifAbsent: [false]
]

{ #category : 'accessing' }
MemoryStore >> fileOpeningOptionsClass [
	"Returns the associated subclass of FsFileOpeningOptions."

	^FsMemoryFileOpeningOptions
]

{ #category : 'accessing' }
MemoryStore >> fileSystemClass [
	"Defines the correct subclass of FileSystem to use with this store."

	^FsMemoryFileSystem
]

{ #category : 'printing' }
MemoryStore >> forReferencePrintOn: aStream [
	aStream nextPutAll: 'FileReference memory'
]

{ #category : 'initialization' }
MemoryStore >> initialize [ 
	root := MemoryFileSystemDirectory new
]

{ #category : 'testing' }
MemoryStore >> isBlock: aPath [
	"We do not have block devices in a memory file system."

	^false
]

{ #category : 'testing' }
MemoryStore >> isCharacter: aPath [
	"We do not have character devices in a memory file system."

	^false
]

{ #category : 'testing' }
MemoryStore >> isDirectory: aPath [

	^self
		entryAt: aPath
		ifPresent: [:entry | entry isDirectory]
		ifAbsent: [false]
]

{ #category : 'testing' }
MemoryStore >> isExecutable: aPath [
	"Files are not executable but directories always are in the unix sense."

	^self isDirectory: aPath
]

{ #category : 'testing' }
MemoryStore >> isFifo: aPath [
	"We do not have fifo  files in a memory file system."

	^false
]

{ #category : 'testing' }
MemoryStore >> isFile: aPath [

	^self
		entryAt: aPath
		ifPresent: [:entry | entry isFile]
		ifAbsent: [false]
]

{ #category : 'testing' }
MemoryStore >> isMemoryFileSystem [
	^ true
]

{ #category : 'testing' }
MemoryStore >> isRegular: aPath [
	"Return true if the argument refers to a regular file."

	^self isFile: aPath
]

{ #category : 'testing' }
MemoryStore >> isSocket: aPath [
	"We do not have socket files in a memory file system."

	^false
]

{ #category : 'testing' }
MemoryStore >> isSymlink: aPath [
	"Return true if aPath refers to a symlink"

	aPath isRoot ifTrue: [^true].
	^self
		entryAt: aPath
		ifPresent: [:entry | entry isSymlink]
		ifAbsent: [self signalFileDoesNotExist: aPath]
]

{ #category : 'testing' }
MemoryStore >> isWritable: aPath [
	"Return true if aPath is writeable"

	^self
		entryAt: aPath
		ifPresent: [:entry | entry permissions isWritable]
		ifAbsent: [false]
]

{ #category : 'accessing' }
MemoryStore >> modificationTimeOf: aPath [
	"Returns the last date of modification of the File described by aPath"

	^self
		entryAt: aPath
		ifPresent: [:stat | stat modificationTime]
		ifAbsent: [self signalFileDoesNotExist: aPath]
]

{ #category : 'public' }
MemoryStore >> open: aFileReference
options: openingOptions [

	| path entry |
	path := aFileReference fullPath.
	entry := self
		entryAt: path
		ifPresent: [ :aMemoryFileSystemEntry | 
			aMemoryFileSystemEntry
				basicOpen;
				yourself ]
		ifAbsent: [ openingOptions isWritable
				ifFalse: [ self signalFileDoesNotExist: path ]
				ifTrue: [ self createFile: path ] ].
	^MemoryHandle
		reference: aFileReference
		entry: entry
		options: openingOptions
]

{ #category : 'accessing' }
MemoryStore >> permissions: aPath [
	"Returns the permissions of the associated file"

	^self
		entryAt: aPath
		ifPresent: [:stat | stat permissions]
		ifAbsent: [FileSystemPermission default]
]

{ #category : 'public' }
MemoryStore >> rename: sourcePath to: destinationPath [
	| sourceEntry destinationParentEntry newName |
	
	sourceEntry := self
		entryAt: sourcePath
		ifPresent: [:e | e]
		ifAbsent: [Error signal: 'Source path does not exist'].
	newName := destinationPath basename.
	
	destinationParentEntry := self
		entryAt: destinationPath parent
		ifPresent: [:p | p]
		ifAbsent: [Error signal: 'Parent of destination does not exist'].
	
	destinationParentEntry isDirectory
		ifFalse: [ Error signal: 'Copy destination has to be a directory' ].
	destinationParentEntry 
		fileEntryAt: newName
		ifPresent: [ Error signal: 'Destination file exists already' ].
		
	destinationParentEntry 
		fileEntryAt: newName
		put: sourceEntry.
	sourceEntry basename: newName.
	
	self
		entryAt: sourcePath parent
		ifPresent: [:parent | parent fileEntryRemove: sourcePath basename]
		ifAbsent: [Error signal: 'Unknown state']

]

{ #category : 'private' }
MemoryStore >> replaceFile: path in: aBlock [
	^ self
		entryAt: path parent
		ifPresent: [ :entry | | old new |
			entry isDirectory
				ifFalse: [ self signalFileDoesNotExist: path ].
			old := entry fileEntryAt: path basename ifAbsent: [ self signalFileDoesNotExist: path ].
			new := aBlock value: old.
			entry fileEntryAt: path basename put: new ]
		ifAbsent: [ self signalFileDoesNotExist: path ]
]

{ #category : 'accessing' }
MemoryStore >> root [
	^ root
]

{ #category : 'accessing' }
MemoryStore >> sizeOf: aPath [

	^self
		entryAt: aPath
		ifPresent: [:entry | entry size]
		ifAbsent: [self signalFileDoesNotExist: aPath]
]
