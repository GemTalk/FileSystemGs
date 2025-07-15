"
Part of FileSystem

=========

FsMacOSStore_arm64 provides architecture-specific functionality for the store.
"
Class {
	#name : 'FsMacOSStore_arm64',
	#superclass : 'FsMacOSStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
FsMacOSStore_arm64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Darwin'
		on: 'arm64'
]
