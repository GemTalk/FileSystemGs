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
Linux64Platform >> currentWorkingDirectoryPath [
	"I don't catch any of the low-level errors here.
	There's not much sensible I can do with them at this level."

	| pointer externalBytes |
	pointer := LibcUnistd new getCurrentDirName.	

	"Arrange for the result to be freed, and figure out how big it is."
	externalBytes := CByteArray fromCharStarGcFree: pointer.

	^ self pathStringDecodedFrom: externalBytes
]

{ #category : 'testing' }
Linux64Platform >> isLinux64 [
	^ true
]

{ #category : 'accessing' }
Linux64Platform >> pathStringDecodedFrom: aCByteArray [
	"Assumption is that paths on Linux are either ASCII or UTF-8"

	| internalBytes |
	internalBytes := aCByteArray
		_copyFrom: 0
		to: aCByteArray size - 1
		resKind: Utf8.

	^ internalBytes decodeToString
]
