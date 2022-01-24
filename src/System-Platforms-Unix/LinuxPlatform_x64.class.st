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

	^self platformName = 'Linux' and: [self platformArchitecture = 'x86-64']
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^LinuxStore_x64
]

{ #category : 'testing' }
LinuxPlatform_x64 >> isLinux64 [
	^ true
]

{ #category : 'accessing' }
LinuxPlatform_x64 >> libcStatClass [

	^LibcStat_Linux_x64
]
