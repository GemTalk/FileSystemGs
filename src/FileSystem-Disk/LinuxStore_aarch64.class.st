Class {
	#name : 'LinuxStore_aarch64',
	#superclass : 'LinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
LinuxStore_aarch64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FileOpeningOptions_Linux_aarch64
]
