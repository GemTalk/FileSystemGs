"
I am an object representing Mac OS X and macOS. I do not represent Classic Mac OS which is no longer considered relevant.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'MacOSPlatform_x64',
	#superclass : 'MacOSPlatform',
	#category : 'System-Platforms-Mac'
}

{ #category : 'testing' }
MacOSPlatform_x64 class >> isActivePlatform [
	^ self isMacOS
]

{ #category : 'testing' }
MacOSPlatform_x64 class >> isMacOS [

	^ self platformName = 'Darwin'
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcDirentClass [

	^LibcDirent_macOS_x64
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcStatClass [

	^LibcStat_macOS_x64
]
