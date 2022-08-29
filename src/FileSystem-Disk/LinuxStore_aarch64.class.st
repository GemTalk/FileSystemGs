Class {
	#name : 'LinuxStore_aarch64',
	#superclass : 'LinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
LinuxStore_aarch64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Linux'
		on: 'aarch64'
]

{ #category : 'accessing' }
LinuxStore_aarch64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FileOpeningOptions_Linux_aarch64
]

{ #category : 'initializing' }
LinuxStore_aarch64 >> initialize [

	super initialize.
	libcDirent := LibcDirent_Linux new.
	libcFcntl := LibcFcntl_Linux new.
	libcUnistd := LibcUnistd_Linux new.
	libcStat := LibcStat_Linux_aarch64 new.
	libcStdio := LibcStdio_Linux new
]
