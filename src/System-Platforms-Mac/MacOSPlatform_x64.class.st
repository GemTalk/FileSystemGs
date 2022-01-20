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

	^ self currentPlatformName = 'Darwin'
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> defaultMaximumPathLength [
		"This method returns the default maximum path length for the getCurrentWorkingDirectory implementation. MacOS default PATH_MAX is 1024.  PATH_MAX is needed to avoid buffer overflow. In case PATH_MAX is not sufficient the method currentWorkingDirectoryWithBufferSize: can be used to give desired buffer size."
	 ^1024

]

{ #category : 'accessing' }
MacOSPlatform_x64 >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	^MacOSStore
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> family [
	^#MacOS
]

{ #category : 'initialization' }
MacOSPlatform_x64 >> initializeLibc [

	libcDirent := LibcDirent_macOS new.
	libcFcntl := LibcFcntl_macOS new.
	libcUnistd := LibcUnistd_macOS new.
	libcStat := LibcStat_macOS new.
	libcStdio := LibcStdio_macOS new
]

{ #category : 'testing' }
MacOSPlatform_x64 >> isMacOS [
	^ true
]

{ #category : 'testing' }
MacOSPlatform_x64 >> isMacOSX [
	^ true
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcDirentClass [

	^LibcDirent_macOS
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcFcntlClass [

	^LibcFcntl_macOS
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcStatClass [

	^LibcStat_macOS
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcStdioClass [

	^LibcStdio_macOS
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> libcUnistdClass [

	^LibcUnistd_macOS
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> lineEnding [

	^ String lf
]

{ #category : 'accessing' }
MacOSPlatform_x64 >> platformResolverClass [
	"Returns the PlatformResolver subclass which should be used for this Platform."

	^MacOSResolver
]
