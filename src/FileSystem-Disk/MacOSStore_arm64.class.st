Class {
	#name : 'MacOSStore_arm64',
	#superclass : 'MacOSStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
MacOSStore_arm64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Darwin'
		on: 'arm64'
]

{ #category : 'initializing' }
MacOSStore_arm64 >> initialize [

	super initialize.
	libcDirent := LibcDirent_macOS_arm64 new.
	libcFcntl := LibcFcntl_macOS new.
	libcUnistd := LibcUnistd_macOS new.
	libcStat := LibcStat_macOS_arm64 new.
	libcStdio := LibcStdio_macOS new
]
