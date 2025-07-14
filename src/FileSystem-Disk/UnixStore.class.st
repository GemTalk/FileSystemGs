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

{ #category : 'initializing' }
UnixStore >> initialize [

	super initialize.
	primitive := FsUnixPrimitive new
]
