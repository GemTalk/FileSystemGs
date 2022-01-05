"
I am a an object representing a Unix platform (64bits). Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'Linux64Platform',
	#superclass : 'UnixPlatform',
	#category : 'System-Platforms-Unix'
}

{ #category : 'testing' }
Linux64Platform class >> isActivePlatform [
	"This version of GemStone is always 64-bit."

	OSPlatform isGemStoneSpecific.
	^ self currentPlatformName = 'Linux'
]

{ #category : 'accessing' }
Linux64Platform >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^LinuxStore
]

{ #category : 'testing' }
Linux64Platform >> isLinux64 [
	^ true
]

{ #category : 'accessing' }
Linux64Platform >> libcDirentClass [

	^LibcDirent_Linux
]

{ #category : 'accessing' }
Linux64Platform >> libcFcntlClass [

	^LibcFcntl_Linux
]

{ #category : 'accessing' }
Linux64Platform >> libcStatClass [

	^LibcStat_Linux
]

{ #category : 'accessing' }
Linux64Platform >> libcStdioClass [

	^LibcStdio_Linux
]

{ #category : 'accessing' }
Linux64Platform >> libcUnistdClass [

	^LibcUnistd_Linux
]
