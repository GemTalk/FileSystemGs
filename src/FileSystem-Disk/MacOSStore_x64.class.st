Class {
	#name : 'MacOSStore_x64',
	#superclass : 'MacOSStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
MacOSStore_x64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Darwin'
		on: 'x86-64'
]

{ #category : 'initializing' }
MacOSStore_x64 >> initialize [

	super initialize.
	libcDirent := LibcDirent_macOS_x64 new.
	libcFcntl := LibcFcntl_macOS new.
	libcUnistd := LibcUnistd_macOS new.
	libcStat := LibcStat_macOS_x64 new.
	libcStdio := LibcStdio_macOS new
]
