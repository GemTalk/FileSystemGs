"
Part of FileSystem

=========

FsLinuxStore_aarch64 provides architecture-specific functionality for the store.
"
Class {
	#name : 'FsLinuxStore_aarch64',
	#superclass : 'FsLinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
FsLinuxStore_aarch64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Linux'
		on: 'aarch64'
]

{ #category : 'accessing' }
FsLinuxStore_aarch64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FsFileOpeningOptions_Linux_aarch64
]
