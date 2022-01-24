Class {
	#name : 'MacOSPlatform',
	#superclass : 'UnixPlatform',
	#category : 'System-Platforms-Unix'
}

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

{ #category : 'testing' }
MacOSPlatform >> isMacOS [
	^ true
]

{ #category : 'testing' }
MacOSPlatform >> isMacOSX [
	^ true
]

{ #category : 'accessing' }
MacOSPlatform >> libcFcntlClass [

	^LibcFcntl_macOS
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

	^String lf
]

{ #category : 'accessing' }
MacOSPlatform >> platformResolverClass [
	"Returns the PlatformResolver subclass which should be used for this Platform."

	^MacOSResolver
]
