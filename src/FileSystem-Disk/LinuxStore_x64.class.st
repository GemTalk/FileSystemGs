Class {
	#name : 'LinuxStore_x64',
	#superclass : 'LinuxStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'testing' }
LinuxStore_x64 class >> isActiveStore [
	"Returns true if this store is the active store for this platform."

	^self
		osIs: 'Linux'
		on: 'x86-64'
]

{ #category : 'accessing' }
LinuxStore_x64 >> fileOpeningOptionsClass [
	"Returns the appropriate class used to represent FileOpeningOptions."

	^FileOpeningOptions_Linux_x64
]

{ #category : 'initializing' }
LinuxStore_x64 >> initialize [

	super initialize.
	libcDirent := LibcDirent_Linux new.
	libcFcntl := LibcFcntl_Linux new.
	libcUnistd := LibcUnistd_Linux new.
	libcStat := LibcStat_Linux_x64 new.
	libcStdio := LibcStdio_Linux new
]
