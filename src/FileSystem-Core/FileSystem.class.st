"
Part of FileSystem

=========

I present a low-level protocol for interacting with filesystems. I hold a reference to
a store (a subinstance of FileSystemStore) which takes care of the details of performing 
file and directory operations on the filesystem I represent. 

I am responsible for resolving all paths that
I pass into my store. My store acts as a factory and offers platform specific actions.


FileSystem instances know two methods that return a Reference object: workingDirectory and root.

FileSystem disk workingDirectory
FileSystem disk root
"
Class {
	#name : 'FileSystem',
	#superclass : 'Object',
	#category : 'FileSystem-Core'
}

{ #category : 'instance creation' }
FileSystem class >> store: aStore [
	"Create an instance of the appropriate FileSystem subclass."

	^aStore fileSystemClass store: aStore
]

{ #category : 'navigating' }
FileSystem >> * anObject [
	"Return a relative reference."
	
	^ self referenceTo: (Path * anObject)
]

{ #category : 'navigating' }
FileSystem >> / anObject [
	"Return the absolute reference obtained by resolving anObject against the
	root of this filesystem."
	
	^ self root / anObject
]

{ #category : 'comparing' }
FileSystem >> = other [

	^self species = other species and: [self store = other store]
]

{ #category : 'public' }
FileSystem >> accessTimeOf: aResolvable [
	"Returns the access date of aResolvable"

	^self store accessTimeOf: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> changeTimeOf: aResolvable [
	"Returns the change date of aResolvable"

	^self store changeTimeOf: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> checkName: aString fixErrors: fixErrors [

	^self store
		checkName: aString
		fixErrors: fixErrors
]

{ #category : 'public-enumerating' }
FileSystem >> childNamesAt: aResolvable
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
do: aBlock [

	| path |
	path := self resolve: aResolvable.
	self store
		directoryAt: path
		ifAbsent: [^absentBlock value]
		ifNotDirectory: [^notDirectoryBlock value]
		entryNamesDo: aBlock
]

{ #category : 'public' }
FileSystem >> close [

	self store close
]

{ #category : 'public' }
FileSystem >> copy: sourcePath ifAbsent: absentBlock to: destinationPath ifPresent: presentBlock [
	"Copy the file referenced as sourcePath to the destination referred as destPath. Perform associate actions in case of problems."

	self store
		copy: (self resolve: sourcePath)
		ifAbsent: absentBlock
		to: (self resolve: destinationPath)
		ifPresent: presentBlock
		fileSystem: self
]

{ #category : 'public' }
FileSystem >> copy: sourcePath to: destPath [
	"Copy the file referenced as sourcePath to the destination referred as destPath.  
	If there is no file at sourcePath, raise FileDoesNotExist.
	If destPath is a file, raise FileExists."
	
	self
		copy: sourcePath
		ifAbsent: [ self store signalFileDoesNotExist: sourcePath ]
		to: destPath
		ifPresent: [ self store signalFileExists: destPath ]
]

{ #category : 'public' }
FileSystem >> copy: aPath toReference: destinationReference [

	^self = destinationReference fileSystem
		ifTrue: [ self copy: aPath to: destinationReference resolve path ]
		ifFalse: [ self copy: aPath toRemote: destinationReference ]
]

{ #category : 'public' }
FileSystem >> copy: aPath
toRemote: destRef [

	| inputStream path |
	path := self resolve: aPath.
	[inputStream := (self referenceTo: path) binaryReadStream.
	inputStream ifNil: [self store signalFileDoesNotExist: path].
	destRef fileSystem
		copyFrom: inputStream
		to: destRef path]
		ensure: [inputStream ifNotNil: [inputStream close]]
]

{ #category : 'public' }
FileSystem >> copyAndDelete: sourcePath to: destination [
	"Copy the file referenced as sourcePath to the destination referred as destPath.  
	If there is no file at sourcePath, raise FileDoesNotExist.
	If destPath is a file, raise FileExists.
	If an error occurs during the operation, try and roll back to the original state."
	
	[
		self copy: sourcePath toReference: destination.
		self delete: sourcePath.
	] on: Error do: [ :error |
		destination delete.
		error pass.
	]
]

{ #category : 'private' }
FileSystem >> copyFrom: inputStream
to: destPath [

	| buffer out |
	out := nil.
	(self exists: destPath)
		ifTrue: [self store signalFileExists: destPath].
	[out := (self referenceTo: destPath) binaryWriteStream.
	buffer := ByteArray new: 1024.
	[inputStream atEnd]
		whileFalse:
			[buffer := inputStream nextInto: buffer.
			out nextPutAll: buffer]]
		ensure: [out ifNotNil: [out close]]
]

{ #category : 'public' }
FileSystem >> createDirectory: aResolvable [
	"Resolve aResolvable into an absolute path, then as the store to create a directory there. 
	The store is expected to raise an exception if it cannot do so."

	^self store createDirectory: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> creationTimeOf: aResolvable [
	"Returns the creation date of aResolvable"

	^self store creationTimeOf: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> delete: aResolvable [

	self store delete: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> delimiter [
	"Return path delimiter used by this filesystem."

	^self store delimiter
]

{ #category : 'public-accessing' }
FileSystem >> deviceIdOf: aResolvable [
	"Return the device id associated with this file."

	^self store deviceIdOf: (self resolve: aResolvable)
]

{ #category : 'public-enumerating' }
FileSystem >> directoryNamesAt: aResolvable
ifAbsent: anAbsentBlock
ifNotDirectory: notDirectoryBlock
do: aBlock [
	"Enumerate through the names of directories in aResolvable.
	Evaluate anAbsentBlock if aResolvable does not exist."

	| path |
	path := self resolve: aResolvable.
	self store
		directoryAt: path
		ifAbsent: [^anAbsentBlock value]
		ifNotDirectory: [^notDirectoryBlock value]
		directoryNamesDo: aBlock
]

{ #category : 'public' }
FileSystem >> ensureCreateDirectory: aResolvable [
	"Resolve the argument to an absolute path, then ask the store to make
	sure that all the directories contained in the argument path exist or are created."
	
	self store ensureCreateDirectory: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> exists: aResolvable [
	"Resolve the argument, and answer true if the there is
	a file or directory at that path, false if there is not."
	
	^self store exists: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> extensionDelimiter [
	^ $.
]

{ #category : 'public-operations' }
FileSystem >> file: aResolvable
posixPermission: posixPermission [
	"Set the permissions for the specified file."

	^self store
		file: (self resolve: aResolvable)
		posixPermission: posixPermission
]

{ #category : 'public-operations' }
FileSystem >> file: aResolvable
uid: uid
gid: gid [
	"Set the uid and gid for the specified file."

	^self store
		file: (self resolve: aResolvable)
		uid: uid
		gid: gid
]

{ #category : 'public-enumerating' }
FileSystem >> fileNamesAt: aResolvable
ifAbsent: anAbsentBlock
ifNotDirectory: notDirectoryBlock
do: aBlock [
	"Enumerate the files in the provided directory."

	| path |
	path := self resolve: aResolvable.
	self store
		directoryAt: path
		ifAbsent: [^anAbsentBlock value]
		ifNotDirectory: [^notDirectoryBlock value]
		fileNamesDo: aBlock
]

{ #category : 'accessing' }
FileSystem >> fileOpeningOptionsClass [
	"Return the proper subclass of FsFileOpeningOptions for this FileSystem."

	^self store fileOpeningOptionsClass
]

{ #category : 'printing' }
FileSystem >> forReferencePrintOn: aStream [

	self store forReferencePrintOn: aStream
]

{ #category : 'public-accessing' }
FileSystem >> gidOf: aResolvable [
	"Return the group id associated with this file."

	^self store gidOf: (self resolve: aResolvable)
]

{ #category : 'comparing' }
FileSystem >> hash [

	^self store hash
]

{ #category : 'public' }
FileSystem >> inodeOf: aResolvable [
	"Returns the access date of aResolvable"

	^self store inodeOf: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isBlock: aResolvable [
	"Return true if the argument refers to a block device."

	^self store isBlock: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isCaseSensitive [
	"This method doesn't really make a whole lot of sense in this form.
	On macOS and Linux, you could have a case-insensitive root but a
	case-sensitive /mnt directory. This should move to FileReference
	which should determine whether a specific entity is stored on a
	case-sensitive file system."

	^Error signal: 'FileSystem >> #isCaseSensitive requires rework.'
]

{ #category : 'public-testing' }
FileSystem >> isCharacter: aResolvable [
	"Return true if the argument refers to a character device."

	^self store isCharacter: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isDirectory: aResolvable [
	"Resolve the argument, and answer true if the result refers
	to a directory, false if it refers to a file or doesn't exist."

	^self store isDirectory: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isFifo: aResolvable [
	"Return true if the argument refers to a fifo file."

	^self store isFifo: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isFile: aResolvable [
	"Resolve the argument, and answer true if the result refers
	to a file, false if it refers to a directory or doesn't exist."

	^self store isFile: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isRegular: aResolvable [
	"Return true if the argument refers to a regular file."

	^self store isRegular: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isSocket: aResolvable [
	"Return true if the argument refers to a socket file."

	^self store isSocket: (self resolve: aResolvable)
]

{ #category : 'public-testing' }
FileSystem >> isSymlink: aResolvable [
	"Resolve the argument, and answer true if the result refers
	to a directory, false if it refers to a file or doesn't exist."

	^self store isSymlink: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> modificationTimeOf: aResolvable [
	"Returns the last date of modification of aResolvable"

	^self store modificationTimeOf: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> move: sourcePath to: destination [
	"Move the file /directory referenced as sourcePath to the destination referred as destPath.  
	If there is no file at sourcePath, raise FileDoesNotExist.
	If destPath is a file, raise FileExists.
	If destPath is a directory, move the sourcePath in to the directory"

	| fullDestination |

	destination isFile ifTrue: [ FileExists signalWith: destination ].
	destination isDirectory
		ifTrue: [ fullDestination := destination / sourcePath basename ]
		ifFalse: [ fullDestination := destination ].
	self = destination fileSystem ifTrue: 
	[
		"Ideally we would test whether the source and destination are on the same filesystem from the OSs perspective.
		Since we can't do that, just try rename, and if that fails, copy and delete."
		[ self rename: sourcePath to: fullDestination resolve path ]
			on: Error
			do: [ :error | self copyAndDelete: sourcePath to: fullDestination ].
	] ifFalse:
		[ self copyAndDelete: sourcePath to: fullDestination ].
	^fullDestination
]

{ #category : 'public' }
FileSystem >> numberOfHardLinksOf: aResolvable [
	"Returns the hard links of aResolvable"

	^self store numberOfHardLinksOf: (self resolve: aResolvable)
]

{ #category : 'public' }
FileSystem >> open [
	"Some kinds of filesystems need to open connections to external resources. Does nothing by default."
	
	self store open
]

{ #category : 'public' }
FileSystem >> open: aResolvable
options: openingOptions [
	"Resolve aResolvable into an absolute path, then ask the store to open the file at
	that path using the specified access mode."

	| path |
	path := self resolve: aResolvable.
	^self store
		open: (FileReference fileSystem: self path: path) 
		options: openingOptions
]

{ #category : 'converting' }
FileSystem >> pathFromObject: anObject [ 
	^ anObject asPathWith: self
]

{ #category : 'converting' }
FileSystem >> pathFromString: aString [

	^self store pathFromString: aString
]

{ #category : 'public' }
FileSystem >> permissions: aResolvable [
	"Resolve the argument and return the Permissions for this file or directory "

	^self store permissions: (self resolve: aResolvable)
]

{ #category : 'printing' }
FileSystem >> printJsonOn: aStream [
	"Print a JSON representation on the provided stream.
	For FileSystem this is defined as ""disk"" for disk-based
	instances and ""memory"" for memory-based instances."

	self subclassResponsibility
]

{ #category : 'printing' }
FileSystem >> printPath: aPath on: aStream [

	self store printPath: aPath on: aStream
]

{ #category : 'public' }
FileSystem >> readStreamOn: aResolvable [
	"Resolve the argument into an absolute path and open a file handle on the file
	at that path. Ask the handle to give us a read stream for reading the file."

	^ (self open: aResolvable options: self defaultOptionsForRead) readStream
]

{ #category : 'public' }
FileSystem >> referenceTo: aResolvable [ 
	"Answer a reference to the argument from the context of the receiver filesystem.  	
		Example: Filesystem disk referenceTo: 'plonk.taz'"

	^ FileReference 
		fileSystem: self
		path: (self pathFromObject: aResolvable)
]

{ #category : 'public' }
FileSystem >> rename: sourcePath ifAbsent: aBlock to: destPath ifPresent: pBlock [
	"Rename the file referenced as sourcePath to the destination referred as destPath. 
	Perform associate actions in case of problems."
	
	| source destination |
	source := self resolve: sourcePath.
	destination := self resolve: destPath.
	self store
		rename: source
		ifAbsent: aBlock
		to: destination
		ifPresent: pBlock
		fileSystem: self.
	^destination
]

{ #category : 'public' }
FileSystem >> rename: sourcePath to: destName [
	"Rename the file referenced as sourcePath to destPath.  Raise exceptions 
	FileExists or FileDoesNotExist  if the operation fails"
	
	^self
		rename: sourcePath
		ifAbsent: [self store signalFileDoesNotExist: sourcePath]
		to: destName
		ifPresent: [self store signalFileExists: destName]
]

{ #category : 'public' }
FileSystem >> resolve: aResolvable [
	^ aResolvable asResolvedBy: self
]

{ #category : 'navigating' }
FileSystem >> resolvePath: aPath [
	"Return a path where the argument is resolved in the context of the
	receiver. The behavior is similar to the one of a command line.
		> cd /a/b/c
		> cd b
		The shell will attempt to make /a/b/c/b the current directory. "

	^ self workingDirectoryPath resolve: aPath
]

{ #category : 'navigating' }
FileSystem >> resolveReference: aReference [

	^aReference fileSystem = self
		ifTrue: [self workingDirectoryPath resolvePath: aReference path]
]

{ #category : 'navigating' }
FileSystem >> resolveString: aString [
	"Returns the root of the receiver filesystem, i.e. / on unix"
	
	^self workingDirectoryPath resolvePath: (self store pathFromString: aString)
]

{ #category : 'accessing' }
FileSystem >> root [
	"Returns the root of the receiver filesystem, i.e. / on unix"

	^self referenceTo: Path root
]

{ #category : 'public-operations' }
FileSystem >> setWorkingDirectory: aResolvable [
	"Set the current working directory"

	^self store setWorkingDirectory: (self resolve: aResolvable)
]

{ #category : 'signaling' }
FileSystem >> signalDirectoryDoesNotExist: aPath [

	^self store signalDirectoryDoesNotExist: aPath
]

{ #category : 'public' }
FileSystem >> sizeOf: aResolvable [
	"Resolve the argument and return the size for this file or directory "

	^self store sizeOf: (self resolve: aResolvable)
]

{ #category : 'accessing' }
FileSystem >> store [
	"Subclasses all must have a store but subclasses options differ.
	This accessor allows them to manage their variable lifetimes appropriately."

	^self subclassResponsibility
]

{ #category : 'private-accessing' }
FileSystem >> store: aStore [
	"Set the store instance variable taking into account lifetime considerations."

	self subclassResponsibility
]

{ #category : 'converting' }
FileSystem >> stringFromPath: aPath [

	^self store stringFromPath: aPath
]

{ #category : 'public' }
FileSystem >> targetPathOf: aResolvable [
	"Return a path of the actual file location.
	For regular files, that is itself.
	For symlinks, that is the file pointed to."

	^self store targetPathOf: (self resolve: aResolvable)
]

{ #category : 'public-accessing' }
FileSystem >> uidOf: aResolvable [
	"Return the user id associated with this file."

	^self store uidOf: (self resolve: aResolvable)
]

{ #category : 'accessing' }
FileSystem >> workingDirectory [
	"Returns a reference to the current working directory of the VM.
	This may not be the same directory for the entire life of a VM, 
	since it can be set programmatically."

	^self referenceTo: self workingDirectoryPath
]

{ #category : 'accessing' }
FileSystem >> workingDirectoryPath [
	"Returns the absolute path string of the current working directory of the VM.
	This may not be the same directory for the entire life of a VM, 
	since it can be set programmatically."

	^self store currentWorkingDirectoryPath
]

{ #category : 'public' }
FileSystem >> writeStreamOn: aResolvable [
	"Open a write stream on the file referred by the argument. It can be a string or a path"

	^(self open: aResolvable options: self defaultOptionsForWrite) writeStream
]
