"
I am a an object representing a Unix platform (64bits). Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'LinuxPlatform_x64',
	#superclass : 'LinuxPlatform',
	#category : 'System-Platforms-Unix'
}

{ #category : 'testing' }
LinuxPlatform_x64 class >> isActivePlatform [
	"This version of GemStone is always 64-bit."

	OSPlatform isGemStoneSpecific.
	^ self currentPlatformName = 'Linux'
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^LinuxStore
]

{ #category : 'testing' }
LinuxPlatform_x64 >> isLinux64 [
	^ true
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcDirentClass [

	^LibcDirent_Linux
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcFcntlClass [

	^LibcFcntl_Linux
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcStatClass [

	^LibcStat_Linux
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcStdioClass [

	^LibcStdio_Linux
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcUnistdClass [

	^LibcUnistd_Linux
]
