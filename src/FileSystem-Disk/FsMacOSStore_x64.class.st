"
Part of FileSystem

=========

FsMacOSStore_x64 provides architecture-specific functionality for the store.
"
Class {
	#name : 'FsMacOSStore_x64',
	#superclass : 'FsMacOSStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
FsMacOSStore_x64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Darwin'
		on: 'x86-64'
]

{ #category : 'initializing' }
FsMacOSStore_x64 >> initialize [

	super initialize.
	libcDirent := FsLibcDirent_macOS_x64 new.
	libcFcntl := FsLibcFcntl_macOS new.
	libcUnistd := FsLibcUnistd_macOS new.
	libcStat := FsLibcStat_macOS_x64 new.
	libcStdio := FsLibcStdio_macOS new
]
