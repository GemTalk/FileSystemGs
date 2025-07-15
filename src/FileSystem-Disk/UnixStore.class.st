"
Part of FileSystem

=========

I'm a specific store for Unix file systems
"
Class {
	#name : 'UnixStore',
	#superclass : 'DiskStore',
	#instVars : [
		'primitive'
	],
	#category : 'FileSystem-Disk'
}

{ #category : 'public' }
UnixStore class >> delimiter [
	^ $/
]

{ #category : 'public' }
UnixStore class >> maxFileNameLength [

	^ 255
]

{ #category : 'public' }
UnixStore >> checkName: aFileName fixErrors: fixing [
	"Check if the file name contains any invalid characters"
	| fName |
	fName := super checkName: aFileName fixErrors: fixing.
	
	(fName includes: self delimiter) ifFalse:
		[^fName].
	
	fixing ifFalse: [self error:'Invalid file name'].
	
	^ fName copyReplaceAll: self delimiter asString with: '#'
]

{ #category : 'public' }
UnixStore >> createDirectory: path [
	"Create a directory for the argument path. 
	If the path refers to an existing file, raise FileExists.
	If the path refers to an existing directory, raise DirectoryExists.
	If the parent directory of the path does not exist, raise DirectoryDoesNotExist"

	| pathString parent |
	pathString := self stringFromPath: path.
	[primitive mkdir: pathString]
		onException: { FsEACCES. FsUnixError }
		do:
			{
			
				[:ex | ex resignalAs: (FilePermissionDenied reference: path asFileReference)].

				[:ex |
				(self exists: path)
					ifTrue:
						[^(self isFile: path)
							ifTrue: [self signalFileExists: path]
							ifFalse: [self signalDirectoryExists: path]].
				parent := path parent.
				(self isDirectory: parent)
					ifFalse: [^self signalDirectoryDoesNotExist: parent].
				ex pass].
			}
]

{ #category : 'accessing' }
UnixStore >> currentWorkingDirectoryPath [
	"Answer an absolute Path for the current working directory of the VM."

	| pathString |
	pathString := primitive getcwd.
	^Path
		from: pathString
		delimiter: self delimiter
]

{ #category : 'public' }
UnixStore >> delete: path [

	| pathString |
	(self exists: path)
		ifFalse: [ ^ FileDoesNotExistException signalWith: path ].
	pathString := self stringFromPath: path.
	(self lstat: path) isDirectory
		ifTrue: [primitive rmdir: pathString]
		ifFalse: [primitive unlinkPath: pathString]
]

{ #category : 'private' }
UnixStore >> directoryAt: aPath
ifAbsent: absentBlock
ifNotDirectory: notDirectoryBlock
entriesDo: aBlock [
	"Enumerate through the entries in the provided directory."

	| pathString dir dirent |
	pathString := self stringFromPath: aPath.
	dir := [primitive openDirectoryStreamWithPath: pathString]
		onException:
			{
				FsENOTDIR.
				FsENOENT.
			}
		do:
			{
				[:ex | ^notDirectoryBlock value].
				[:ex | ^absentBlock value].
			}.
	[[dirent := primitive readFromDirectoryStream: dir.
	dirent notNil]
		whileTrue:
			[aBlock value: dirent]]
		ensure: [primitive closeDirectoryStream: dir]
]

{ #category : 'public' }
UnixStore >> file: aPath
posixPermission: posixPermission [
	"Set the permissions for the specified file."

	| pathString |
	pathString := self stringFromPath: aPath.
	[primitive
		chmod: pathString
		mode: posixPermission]
		on: FsENOENT
		do: [:ex | FileDoesNotExistException signal: aPath].
	^nil
]

{ #category : 'public' }
UnixStore >> file: aPath
uid: uid
gid: gid [
	"Set the uid and gid for the specified file."

	| pathString |
	pathString := self stringFromPath: aPath.
	[primitive
		chown: pathString
		uid: uid
		gid: gid]
		on: FsENOENT
		do: [:ex | FileDoesNotExistException signal: aPath].
	^nil
]

{ #category : 'public' }
UnixStore >> fstat: fd [

	^primitive fstat: fd
]

{ #category : 'initializing' }
UnixStore >> initialize [

	super initialize.
	primitive := FsUnixPrimitive new
]

{ #category : 'public' }
UnixStore >> lstat: aPath [

	| pathString |
	pathString := self stringFromPath: aPath.
	^[primitive lstat: pathString]
		on: FsENOENT
		do: [:ex | self signalFileDoesNotExist: aPath]
]

{ #category : 'public' }
UnixStore >> open: aFileReference
options: options [

	| fd |
	fd := [primitive
				open: aFileReference pathString
				flags: options flags
				mode: options modeBits]
			onException: {FsENOENT. FsEACCES}
			do:
				{
					[:ex | | parent |
					parent := aFileReference parent.
					parent exists
						ifTrue: [self signalFileDoesNotExist: aFileReference fullPath]
						ifFalse: [self signalDirectoryDoesNotExist: parent]].

					[:ex | ex resignalAs: (FilePermissionDenied reference: aFileReference)]
				}.
	^FsFileDescriptor fd: fd
]

{ #category : 'accessing' }
UnixStore >> primitiveInterface [
	"Returns self's instance of FsUnixPrimitive."

	^primitive
]

{ #category : 'public' }
UnixStore >> rename: sourcePath to: destinationPath [

	| sourcePathString targetPathString |
	sourcePathString := self stringFromPath: sourcePath.
	targetPathString := self stringFromPath: destinationPath.
	primitive
		rename: sourcePathString
		to: targetPathString
]

{ #category : 'public' }
UnixStore >> setWorkingDirectory: aPath [
	"Set the working directory to the path provided."

	| pathString |
	pathString := self stringFromPath: aPath.
	[[primitive
		chdir: pathString]
		on: FsENOENT
		do: [:ex | DirectoryDoesNotExist signal: aPath]]
		on: FsENOTDIR
		do: [:ex | DirectoryRequired signal: aPath].
	^true
]

{ #category : 'public' }
UnixStore >> stat: aPath [

	| pathString |
	pathString := self stringFromPath: aPath.
	^[primitive stat: pathString]
		on: FsENOENT
		do: [:ex | self signalFileDoesNotExist: aPath]
]

{ #category : 'public' }
UnixStore >> symlink: linkPathString
toTarget: targetPathString [
	"Create a symlink to the targetPathString
	at the location specified by linkPathString."

	[[primitive
		symlink: linkPathString
		toTarget: targetPathString]
		on: FsEACCES
		do: [:ex | FilePermissionDenied signalWith: linkPathString asFileReference]]
		on: FsEEXIST
		do: [:ex | FileExists signalWith: linkPathString asFileReference].
	^true
]
