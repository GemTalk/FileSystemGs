"
Part of FileSystem

=========

I'm a specific store for OSX file systems
"
Class {
	#name : 'FsMacOSStore',
	#superclass : 'UnixStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
FsMacOSStore >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FsFileOpeningOptions_macOS
]

{ #category : 'accessing' }
FsMacOSStore >> maxFileNameLength [
	"Returns the max file name length"

	^1024
]
