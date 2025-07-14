"
Part of FileSystem

=========

I am an abstract superclass for disk store implementations. My subclasses provide access to the actual data storage of a particular kind of filesystem.
"
Class {
	#name : 'DiskStore',
	#superclass : 'FileSystemStore',
	#instVars : [
		'libcDirent',
		'libcFcntl',
		'libcUnistd',
		'libcStat',
		'libcStdio'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileSystem-Disk'
}

{ #category : 'current' }
DiskStore class >> activeClass [
	"Returns the DiskStore subclass that should be used."

	^DiskStore allSubclasses
		detect: [:each | each isActiveStore]
		ifNone: [self error: 'DiskStore does not support this Platform/OS']
]

{ #category : 'current' }
DiskStore class >> cacheKey [
	"The key used to lookup the DiskStore singleton in SessionTemps."

	^#'GsCurrentDiskStore'
]

{ #category : 'current' }
DiskStore class >> createDefault [

	^self activeClass new
]

{ #category : 'current' }
DiskStore class >> current [

	^SessionTemps current
		at: self cacheKey
		ifAbsentPut: [self createDefault]
]

{ #category : 'current' }
DiskStore class >> currentFileSystem [

	^FileSystem disk
]

{ #category : 'public' }
DiskStore class >> delimiter [
	^ self current delimiter
]

{ #category : 'testing' }
DiskStore class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^false
]

{ #category : 'public' }
DiskStore class >> maxFileNameLength [
	self subclassResponsibility 
]

{ #category : 'testing' }
DiskStore class >> osIs: anOS
on: anArch [
	"Determine if the OS and Architecture match this system"

	^(System gemVersionAt: 'osName') = anOS and: [(System gemVersionAt: 'cpuArchitecture') = anArch]
]

{ #category : 'current' }
DiskStore class >> resetCurrent [

	SessionTemps current
		removeKey: self cacheKey
		ifAbsent: []
]

{ #category : 'comparing' }
DiskStore >> = other [

	^self species = other species
]

{ #category : 'accessing' }
DiskStore >> accessTimeOf: aPath [
	"Return the size of the File described by aPath"

	^(self stat: aPath) accessTime asDateAndTime
]

{ #category : 'accessing' }
DiskStore >> changeTimeOf: aPath [
	"Return the size of the File described by aPath"

	^(self stat: aPath) changeTime asDateAndTime
]

{ #category : 'public' }
DiskStore >> checkName: aFileName fixErrors: fixErrors [
	"Check a string aFileName for validity as a file name. Answer the original file name if it is valid. If the name is not valid (e.g., it is too long or contains illegal characters) and fixing is false, raise an error. If fixing is true, fix the name (usually by truncating and/or tranforming characters), and answer the corrected name. The default behavior is just to truncate the name to the maximum length for this platform. Subclasses can do any kind of checking and correction appropriate for their platform."
	
	| maxLength |
	aFileName size = 0 ifTrue: [self error: 'zero length file name'].
	maxLength := self maxFileNameLength.
	aFileName size > maxLength
		ifTrue: [self error: 'file name is too long'].
	^aFileName
]

{ #category : 'public' }
DiskStore >> createDirectory: path [
	"Create a directory for the argument path. 
	If the path refers to an existing file, raise FileExists.
	If the path refers to an existing directory, raise DirectoryExists.
	If the parent directory of the path does not exist, raise DirectoryDoesNotExist"

	self subclassResponsibility
]

{ #category : 'accessing' }
DiskStore >> currentWorkingDirectoryPath [
	"Answer an absolute Path for the current working directory of the VM."

	self subclassResponsibility
]

{ #category : 'public' }
DiskStore >> delete: path [

	self subclassResponsibility
]

{ #category : 'public-attributes' }
DiskStore >> deviceIdOf: aPath [
	"Return the device id associated with this file."

	^(self stat: aPath) deviceId
]

{ #category : 'public' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
directoryNamesDo: aBlock [
	"Enumerate through the directory names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo:
			[:entry | | name isDirectory |
			name := entry basename.
			isDirectory := entry isDirectory
						or: [(entry isUnknown or: [entry isSymlink])
								and: [(self stat: aPath / entry basename) isDirectory]].
			(isDirectory and: [(name = '.' or: [name = '..']) not]) ifTrue: [aBlock value: name]]
]

{ #category : 'private' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
entriesDo: aBlock [
	"Enumerate through the entries in the provided directory."

	self subclassResponsibility
]

{ #category : 'public' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
entryNamesDo: aBlock [
	"Enumerate through the entry names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo:
			[:entry | | name |
			name := entry basename.
			(name = '.' or: [name = '..'])
				ifFalse: [aBlock value: name]]
]

{ #category : 'public' }
DiskStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
fileNamesDo: aBlock [
	"Enumerate through the file names in the provided directory."

	^self
		directoryAt: aPath
		ifAbsent: absentBlock
		ifNotDirectory: notDirectoryBlock
		entriesDo:
			[:entry | | name isFile |
			name := entry basename.
			isFile := entry isFile
						or: [(entry isUnknown or: [entry isSymlink])
								and: [(self stat: aPath / entry basename) isFile]].
			isFile ifTrue: [aBlock value: name]]
]

{ #category : 'testing' }
DiskStore >> exists: aPath [

	| stat |
	stat := [self lstat: aPath]
		on: FileDoesNotExistException
		do: [:ex | ^false].
	^true
]

{ #category : 'public-operations' }
DiskStore >> file: aPath
posixPermission: posixPermission [
	"Set the permissions for the specified file."

	self subclassResponsibility
]

{ #category : 'public-operations' }
DiskStore >> file: aPath
uid: uid
gid: gid [
	"Set the uid and gid for the specified file."

	self subclassResponsibility
]

{ #category : 'accessing' }
DiskStore >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^self subclassResponsibility
]

{ #category : 'accessing' }
DiskStore >> fileSystemClass [
	"Defines the correct subclass of FileSystem to use with this store."

	^FsDiskFileSystem
]

{ #category : 'printing' }
DiskStore >> forReferencePrintOn: aStream [
	aStream nextPutAll: 'FileReference disk'
]

{ #category : 'public-attributes' }
DiskStore >> gidOf: aPath [
	"Return the group id associated with this file."

	^(self stat: aPath) gid
]

{ #category : 'comparing' }
DiskStore >> hash [

	^self species hash
]

{ #category : 'accessing' }
DiskStore >> inodeOf: aPath [
	"Returns the path's inode"

	^(self stat: aPath) inode
]

{ #category : 'testing' }
DiskStore >> isBlock: aPath [
	"Return true if the argument refers to a block device."

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isBlock]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isCharacter: aPath [
	"Return true if the argument refers to a character device."

	^(self stat: aPath) isCharacter
]

{ #category : 'testing' }
DiskStore >> isDirectory: aPath [

	aPath isRoot ifTrue: [^true].
	^[(self stat: aPath) isDirectory]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isDiskFileSystem [
	^ true
]

{ #category : 'testing' }
DiskStore >> isFifo: aPath [
	"Return true if the argument refers to a fifo file."

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isFifo]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isFile: aPath [

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isFile]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isRegular: aPath [
	"Return true if the argument refers to a regular file."

	^self isFile: aPath
]

{ #category : 'testing' }
DiskStore >> isSocket: aPath [
	"Return true if the argument refers to a socket file."

	aPath isRoot ifTrue: [^false].
	^[(self stat: aPath) isSocket]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'testing' }
DiskStore >> isSymlink: aPath [

	aPath isRoot ifTrue: [^false].
	^[(self lstat: aPath) isSymlink]
		on: FileDoesNotExistException
		do: [:ex | ex return: false]
]

{ #category : 'accessing' }
DiskStore >> libcFcntl [

	^libcFcntl
]

{ #category : 'accessing' }
DiskStore >> libcStat [

	^libcStat
]

{ #category : 'accessing' }
DiskStore >> libcUnistd [

	^libcUnistd
]

{ #category : 'public' }
DiskStore >> lstat: aPath [

	self subclassResponsibility
]

{ #category : 'public' }
DiskStore >> maxFileNameLength [
	"Returns the max file name length for this store."

	self subclassResponsibility
]

{ #category : 'accessing' }
DiskStore >> modificationTimeOf: aPath [
	"Return the size of the File described by aPath"

	^(self stat: aPath) modificationTime asDateAndTime
]

{ #category : 'public-attributes' }
DiskStore >> numberOfHardLinksOf: aPath [
	"Return the number of hard links of the File described by aPath"

	^(self stat: aPath) numberOfHardLinks
]

{ #category : 'public' }
DiskStore >> open: aFileReference
options: options [

	self subclassResponsibility
]

{ #category : 'public' }
DiskStore >> permissions: aPath [

	| stat |
	stat := self stat: aPath.
	^FileSystemPermission posixPermissions: stat permission
]

{ #category : 'public' }
DiskStore >> rename: sourcePath to: destinationPath [

	self subclassResponsibility
]

{ #category : 'private' }
DiskStore >> rootNode [
	^ #('' 0 0 true 0 8r555)
]

{ #category : 'public-operations' }
DiskStore >> setWorkingDirectory: aPath [
	"Set the working directory to the path provided."

	self subclassResponsibility
]

{ #category : 'accessing' }
DiskStore >> sizeOf: aPath [
	"Return the size of the File described by aPath"

	^(self stat: aPath) size
]

{ #category : 'public' }
DiskStore >> stat: aPath [

	self subclassResponsibility
]

{ #category : 'public-operations' }
DiskStore >> symlink: linkPathString
toTarget: targetPathString [
	"Create a symlink to the targetPathString
	at the location specified by linkPathString."

	self subclassResponsibility
]

{ #category : 'public-attributes' }
DiskStore >> uidOf: aPath [
	"Return the user id associated with this file."

	^(self stat: aPath) uid
]
