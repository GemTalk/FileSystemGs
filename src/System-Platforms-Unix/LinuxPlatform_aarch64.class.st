Class {
	#name : 'LinuxPlatform_aarch64',
	#superclass : 'LinuxPlatform',
	#category : 'System-Platforms-Unix'
}

{ #category : 'testing' }
LinuxPlatform_aarch64 class >> isActivePlatform [
	"This version of GemStone is always 64-bit."

	^self platformName = 'Linux' and: [self platformArchitecture = 'aarch64']
]

{ #category : 'accessing' }
LinuxPlatform_aarch64 >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^LinuxStore_aarch64
]

{ #category : 'accessing' }
LinuxPlatform_aarch64 >> libcStatClass [

	^LibcStat_Linux_aarch64
]
