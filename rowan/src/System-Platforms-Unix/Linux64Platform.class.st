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

{ #category : 'initializing' }
Linux64Platform >> initializeLibc [

	libcDirent := LibcDirent_Linux new.
	libcFcntl := LibcFcntl_Linux new.
	libcUnistd := LibcUnistd_Linux new.
	libcStat := LibcStat_Linux new.
	libcStdio := LibcStdio_Linux new
]

{ #category : 'testing' }
Linux64Platform >> isLinux64 [
	^ true
]
