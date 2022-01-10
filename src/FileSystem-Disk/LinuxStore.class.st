Class {
	#name : 'LinuxStore',
	#superclass : 'UnixStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
LinuxStore >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^LinuxFileOpeningOptions
]
