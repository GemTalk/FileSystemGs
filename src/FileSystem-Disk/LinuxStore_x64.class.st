Class {
	#name : 'LinuxStore_x64',
	#superclass : 'LinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
LinuxStore_x64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FileOpeningOptions_Linux_x64
]
