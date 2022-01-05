"
I'm a specific store for OSX file systems
"
Class {
	#name : 'MacOSStore',
	#superclass : 'UnixStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
MacOSStore >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^MacOSFileOpeningOptions
]
