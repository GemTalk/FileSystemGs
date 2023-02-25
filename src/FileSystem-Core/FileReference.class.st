"
Part of FileSystem

=========

I combine a filesystem and path, which is sufficient to refer to a concrete file or directory. I provide methods for navigating my filesystem, performing filesystem operations and opening and closing files.  I am the primary mechanism for working with files and directories. 

| working |
working := FileSystem disk workingDirectory.
working files 

| disk |
disk := FileSystem disk.
disk root.                               	""a reference to the root directory""
disk working.                         	""a reference to the working directory""
"
Class {
	#name : 'FileReference',
	#superclass : 'AbstractFileReference',
	#instVars : [
		'filesystem'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'cross platform' }
FileReference class >> / aString [
	"Answer a reference to the argument resolved against the root of the current disk filesystem."
	
	^ FileSystem disk / aString
]

{ #category : 'instance creation' }
FileReference class >> fileSystem: aFilesystem path: aPath [
	^ self new setFileSystem: aFilesystem path: aPath
]

{ #category : 'instance creation' }
FileReference class >> newTempFilePrefix: prefix suffix: suffix [
	| tmpDir random fileName |
	
	tmpDir := FileLocator temp asFileReference.
	[ 
		random := GsUuidV4 new asInteger asString.
		fileName := prefix , random , suffix.
		(tmpDir / fileName) exists ] whileTrue.
	^ tmpDir / fileName
]

{ #category : 'navigating' }
FileReference >> , extension [
	^ self withPath: self path, extension
]

{ #category : 'comparing' }
FileReference >> = other [
	"Two FileReferences are considered equal if they refer to the same file / directory.
	As paths can have multiple relative representations, compare the absolute paths."
	"Perform the path comparison last as conversion to absolute paths is relatively expensive"
	^ self species = other species
		and: [self fileSystem = other fileSystem
			and: [self absolutePath = other absolutePath]]

]

{ #category : 'accessing' }
FileReference >> absolutePath [
	"Return the absolute of the receiver"
	^ self path isRelative
		ifFalse: [ self path ]
		ifTrue: [ filesystem resolve: self path ]
]

{ #category : 'accessing' }
FileReference >> accessTime [

	^ filesystem accessTimeOf: self path
]

{ #category : 'converting' }
FileReference >> asAbsolute [
	"Return the receiver as an absolute file reference."
	
	^ self isAbsolute
		ifTrue: [ self ]
		ifFalse: [ filesystem referenceTo: (filesystem resolve: path) ]
]

{ #category : 'converting' }
FileReference >> asFileReference [
	^ self
]

{ #category : 'converting' }
FileReference >> asPath [
	"Answer the receivers path"

	^path
]

{ #category : 'printing' }
FileReference >> asString [
  "needed for informative topaz stack display"
  ^ path asString 
]

{ #category : 'streams' }
FileReference >> binaryReadStreamOptions: options [

	| fileDescriptor |
	self exists
		ifFalse: [^FileDoesNotExistException signalWith: self].
	self isFile
		ifFalse: [^FsFileRequired signalWith: self pathString].
	fileDescriptor := self openOptions: options.
	^fileDescriptor binaryReadStream
]

{ #category : 'streams' }
FileReference >> binaryWriteStreamOptions: options [
	"Answer a binary write stream on the receiver"

	| fileDescriptor |
	(self exists and: [self isFile not])
		ifTrue: [^FsFileRequired signalWith: self].
	fileDescriptor := self openOptions: options.
	^ZnBufferedWriteStream on: fileDescriptor binaryWriteStream
]

{ #category : 'accessing' }
FileReference >> changeTime [
	"Returns the change time of the referenced entity."

	^filesystem changeTimeOf: self path
]

{ #category : 'comparing' }
FileReference >> containsReference: aReference [
	^  aReference fileSystem = filesystem and: [path contains: aReference path]
]

{ #category : 'operations' }
FileReference >> copyAllTo: aResolvable [
	"Performs a deep copy of the receiver, to a location specified by the argument. If the receiver is a file, the file will be copied; if a directory, the directory and its contents will be copied recursively. The argument must be a reference that doesn't exist; it will be created by the copy."
	
	| source destination |
	source := self.
	destination := aResolvable resolve.
	source
		allChildrenDo:
			[:each | | target |
			target := destination resolve: (each relativeTo: source).
			each copyTo: target]
]

{ #category : 'operations' }
FileReference >> copyTo: aReference [
	self isDirectory
		ifTrue: [ aReference ensureCreateDirectory ]
		ifFalse: [ filesystem copy: path toReference: aReference ]
]

{ #category : 'copying' }
FileReference >> copyWithPath: newPath [
	^ filesystem referenceTo: newPath
]

{ #category : 'accessing' }
FileReference >> creationTime [ 
	^ filesystem creationTimeOf: self path
]

{ #category : 'operations' }
FileReference >> delete [
	"Deletes the referenced file or directory. If the directory is not empty, 
	raises an error. Use #deleteAll to delete with the children."

	(self isDirectory and: [self hasChildren]) 
		ifTrue: [DirectoryIsNotEmpty signalWith: self].
	filesystem delete: path
]

{ #category : 'operations' }
FileReference >> deleteAll [
	"Delete this directory and all children of it, raise an error if the file does not exist."

	| toDelete toTraverse |
	toTraverse := { self }.
	toDelete := { }.
	[toTraverse isEmpty]
		whileFalse:
			[| each |
			each := toTraverse removeLast.
			each isDirectory
				ifTrue:
					[toTraverse addAll: each children.
					toDelete addLast: each]
				ifFalse: [each delete]].
	toDelete reverseDo: [:each | each delete]
]

{ #category : 'operations' }
FileReference >> deleteIfAbsent: aBlock [
	self exists 
		ifTrue: [ self delete ]
		ifFalse: aBlock
]

{ #category : 'accessing' }
FileReference >> deviceId [
	"Returns the device identifier associated with this reference."

	^filesystem deviceIdOf: self path
]

{ #category : 'operations' }
FileReference >> ensureCreateDirectory [
	"Create if necessary a directory for the receiver."
	filesystem ensureCreateDirectory: path
	
]

{ #category : 'testing' }
FileReference >> exists [

	^ filesystem exists: path
]

{ #category : 'accessing' }
FileReference >> fileOpeningOptionsClass [
	"Returns the appropriate subclass of FsFileOpeningOptions for this entity."

	^filesystem fileOpeningOptionsClass
]

{ #category : 'accessing' }
FileReference >> fileSystem [
	"Return the filesystem to which the receiver belong."
	^ filesystem
]

{ #category : 'accessing' }
FileReference >> fullName [
	"Return the full path name of the receiver."
	^ filesystem stringFromPath: (filesystem resolve: path)
]

{ #category : 'accessing' }
FileReference >> fullPath [
	^ self path
]

{ #category : 'accessing' }
FileReference >> gid [
	"Return the group id associated with this file."

	^filesystem gidOf: self path
]

{ #category : 'testing' }
FileReference >> hasChildren [
	"Return whether the receiver has any children."
	"FileSystem workingDirectory hasChildren"

	filesystem
		childNamesAt: path
		ifAbsent: [^false]
		ifNotDirectory: [^false]
		do: [:each | ^true].
	^false
]

{ #category : 'testing' }
FileReference >> hasDirectories [
	"Return whether the receiver has children that are directories."
	"FileSystem workingDirectory hasDirectories"
	
	filesystem
		directoryNamesAt: path
		ifAbsent: [^false]
		ifNotDirectory: [^false]
		do: [:each | ^true].
	^false
]

{ #category : 'testing' }
FileReference >> hasFiles [
	"Return whether the receiver has children that are files."
	"FileSystem workingDirectory hasFiles"
	
	filesystem
		fileNamesAt: path
		ifAbsent: [^false]
		ifNotDirectory: [^false]
		do: [:each | ^true].
	^false
]

{ #category : 'comparing' }
FileReference >> hash [
	^ path hash bitXor: filesystem hash
]

{ #category : 'accessing' }
FileReference >> inode [
	"Returns the inode for this file."

	^filesystem inodeOf: self path
]

{ #category : 'testing' }
FileReference >> isAbsolute [
	^ path isAbsolute
]

{ #category : 'testing' }
FileReference >> isBlock [
	"Is this reference to a block device?"

	^filesystem isBlock: self path
]

{ #category : 'testing' }
FileReference >> isCharacter [
	"Is this reference to a character device?"

	^filesystem isCharacter: self path
]

{ #category : 'testing' }
FileReference >> isDirectory [
	^ filesystem isDirectory: path
]

{ #category : 'testing' }
FileReference >> isFifo [
	"Is this reference to a fifo file?"

	^filesystem isFifo: self path
]

{ #category : 'testing' }
FileReference >> isFile [
	^ filesystem isFile: path
]

{ #category : 'testing' }
FileReference >> isReadable [
	"Return true if the file can be read by this user."

	^[self binaryReadStreamDo: [:stream | true]]
		on: FsPermissionDenied
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
FileReference >> isRegular [
	"Is this reference to a regular file?"

	^filesystem isRegular: self path
]

{ #category : 'testing' }
FileReference >> isRelative [
	^ path isRelative
]

{ #category : 'testing' }
FileReference >> isRoot [
	^ path isRoot
]

{ #category : 'testing' }
FileReference >> isSocket [
	"Is this reference to a socket?"

	^filesystem isSocket: self path
]

{ #category : 'testing' }
FileReference >> isSymlink [ 
	^ filesystem isSymlink: path
]

{ #category : 'testing' }
FileReference >> isWritable [
	"Return true if the file can be written by this user."

	^[self binaryWriteStreamDo: [:stream | true]]
		on: FsPermissionDenied
		do: [:ex | ex return: false]
]

{ #category : 'accessing' }
FileReference >> modificationTime [ 
	"Returns the last date of modification of self"
	^ filesystem modificationTimeOf: self path
]

{ #category : 'operations' }
FileReference >> moveTo: aReference [
	
	| result |
	result := self fileSystem 
		move: self path
		to: aReference resolve.
	result ifNotNil: [
		self setFileSystem: result fileSystem path: result path ].		
]

{ #category : 'accessing' }
FileReference >> numberOfHardLinks [
	"Returns the number of hard links to this file."

	^filesystem numberOfHardLinksOf: self path
]

{ #category : 'operations' }
FileReference >> openOptions: options [
	"Open the file using the specified options."

	^filesystem
		open: path
		options: options
]

{ #category : 'streams' }
FileReference >> openWritable: isWritable [

	| options |
	options := isWritable
		ifTrue: [self defaultOptionsForWrite]
		ifFalse: [self defaultOptionsForRead].
	^self openOptions: options
]

{ #category : 'delegated' }
FileReference >> parent [

	^self withPath: self path parent
]

{ #category : 'printing' }
FileReference >> pathString [
	"Return the full path name of the receiver."
	
	^ filesystem stringFromPath: (filesystem resolve: path)
]

{ #category : 'accessing' }
FileReference >> permissions [
	^ filesystem permissions: self path
]

{ #category : 'operations' }
FileReference >> permissions: permissions [
	"Set file permissions to those specified in the argument"

	^filesystem
		file: self path
		posixPermission: permissions posixPermission
]

{ #category : 'printing' }
FileReference >> printOn: aStream [
	filesystem forReferencePrintOn: aStream.
	filesystem printPath: path on: aStream
]

{ #category : 'operations' }
FileReference >> renameTo: newBasename [
	
	| destinationPath |
	destinationPath := self fileSystem 
		rename: self 
		to: self parent / newBasename.
	
	destinationPath ifNotNil: [
		self 
			setFileSystem: filesystem 
			path: destinationPath ].
	^ self
		
]

{ #category : 'accessing' }
FileReference >> resolve [
	^ self
]

{ #category : 'resolving' }
FileReference >> resolvePath: anObject [
	^ self withPath: (path resolve: anObject)
]

{ #category : 'resolving' }
FileReference >> resolveReference: aReference [
	
	^ (filesystem = aReference fileSystem or: [aReference isRelative])
		ifTrue: [filesystem referenceTo: (path resolvePath: aReference path)]
		ifFalse: [aReference]
]

{ #category : 'resolving' }
FileReference >> resolveString: aString [ 
	| thePath |
	thePath := filesystem pathFromString: aString.
	^ filesystem referenceTo: (path resolve: thePath)
]

{ #category : 'operations' }
FileReference >> setAsWorkingDirectory [
	"Set the current reference as the working directory"

	^filesystem setWorkingDirectory: self path
]

{ #category : 'initialize-release' }
FileReference >> setFileSystem: aFilesystem path: aPath [
	filesystem := aFilesystem.
	path := aPath
]

{ #category : 'accessing' }
FileReference >> size [
	^ filesystem sizeOf: path
]

{ #category : 'accessing' }
FileReference >> targetPath [
	"Return the part for this file. If this file is a symbolic link, return the path of the file being pointed at."

	^filesystem targetPathOf: self path
]

{ #category : 'accessing' }
FileReference >> uid [
	"Return the user id associated with this file."

	^filesystem uidOf: self path
]

{ #category : 'operations' }
FileReference >> uid: uid
gid: gid [
	"Set the user and group ID for the represented file."
	"A reliable method of testing this has not yet been found.
	For now, no SUnit exists."

	^filesystem
		file: self path
		uid: uid
		gid: gid
]
