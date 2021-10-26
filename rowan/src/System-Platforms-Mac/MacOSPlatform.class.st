"
I am an object representing Mac OS X and macOS. I do not represent Classic Mac OS which is no longer considered relevant.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'MacOSPlatform',
	#superclass : 'UnixPlatform',
	#category : 'System-Platforms-Mac'
}

{ #category : 'testing' }
MacOSPlatform class >> isActivePlatform [
	^ self isMacOS
]

{ #category : 'testing' }
MacOSPlatform class >> isMacOS [

	^ self currentPlatformName = 'Darwin'
]

{ #category : 'accessing' }
MacOSPlatform >> defaultMaximumPathLength [
		"This method returns the default maximum path length for the getCurrentWorkingDirectory implementation. MacOS default PATH_MAX is 1024.  PATH_MAX is needed to avoid buffer overflow. In case PATH_MAX is not sufficient the method currentWorkingDirectoryWithBufferSize: can be used to give desired buffer size."
	 ^1024

]

{ #category : 'accessing' }
MacOSPlatform >> family [
	^#MacOS
]

{ #category : 'initialization' }
MacOSPlatform >> initializeLibc [

	libcDirent := LibcDirent new.
	libcFcntl := LibcFcntl new.
	libcUnistd := MacOSLibcUnistd new.
	libcStat := LibcStat new.
	libcStdio := LibcStdio new
]

{ #category : 'testing' }
MacOSPlatform >> isMacOS [
	^ true
]

{ #category : 'testing' }
MacOSPlatform >> isMacOSX [
	^ true
]

{ #category : 'accessing' }
MacOSPlatform >> lineEnding [

	^ String lf
]
