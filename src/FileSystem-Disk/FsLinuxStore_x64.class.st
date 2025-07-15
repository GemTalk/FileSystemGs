"
Part of FileSystem

=========

FsLinuxStore_x6464 provides architecture-specific functionality for the store.
"
Class {
	#name : 'FsLinuxStore_x64',
	#superclass : 'FsLinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
FsLinuxStore_x64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Linux'
		on: 'x86-64'
]

{ #category : 'accessing' }
FsLinuxStore_x64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FsFileOpeningOptions_Linux_x64
]
