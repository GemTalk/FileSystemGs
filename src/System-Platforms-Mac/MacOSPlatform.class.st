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
MacOSPlatform >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^MacOSStore
]

{ #category : 'accessing' }
MacOSPlatform >> family [
	^#MacOS
]

{ #category : 'initialization' }
MacOSPlatform >> initializeLibc [

	libcDirent := LibcDirent_macOS new.
	libcFcntl := LibcFcntl_macOS new.
	libcUnistd := LibcUnistd_macOS new.
	libcStat := LibcStat_macOS new.
	libcStdio := LibcStdio_macOS new
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
MacOSPlatform >> libcDirentClass [

	^LibcDirent_macOS
]

{ #category : 'accessing' }
MacOSPlatform >> libcFcntlClass [

	^LibcFcntl_macOS
]

{ #category : 'accessing' }
MacOSPlatform >> libcStatClass [

	^LibcStat_macOS
]

{ #category : 'accessing' }
MacOSPlatform >> libcStdioClass [

	^LibcStdio_macOS
]

{ #category : 'accessing' }
MacOSPlatform >> libcUnistdClass [

	^LibcUnistd_macOS
]

{ #category : 'accessing' }
MacOSPlatform >> lineEnding [

	^ String lf
]

{ #category : 'accessing' }
MacOSPlatform >> platformResolverClass [
	"Returns the PlatformResolver subclass which should be used for this Platform."

	^MacOSResolver
]
