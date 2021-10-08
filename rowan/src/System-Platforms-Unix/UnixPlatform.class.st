"
I am a an object representing a Unix platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'UnixPlatform',
	#superclass : 'OSPlatform',
	#instVars : [
		'libcDirent',
		'libcFcntl',
		'libcUnistd',
		'libcStat',
		'libcStdio'
	],
	#category : 'System-Platforms-Unix'
}

{ #category : 'accessing' }
UnixPlatform >> currentWorkingDirectoryPath [
	"I don't catch any of the low-level errors here.
	There's not much sensible I can do with them at this level."

	^libcUnistd getCurrentDirName
]

{ #category : 'accessing' }
UnixPlatform >> defaultMaximumPathLength [
	"This method returns the default maximum path length for the getCurrentWorkingDirectory implementation. 
Unix default PATH_MAX is 4096.  PATH_MAX is needed to avoid buffer overflow. In case PATH_MAX is not sufficient the method  currentWorkingDirectoryWithBufferSize: can be used to give desired buffer size."
	^4096

]

{ #category : 'accessing' }
UnixPlatform >> family [
	^#Unix
]

{ #category : 'initialization' }
UnixPlatform >> initialize [

	libcDirent := LibcDirent new.
	libcFcntl := LibcFcntl new.
	libcUnistd := LibcUnistd new.
	libcStat := LibcStat new.
	libcStdio := LibcStdio new
]

{ #category : 'testing' }
UnixPlatform >> isUnix [
	^ true
]

{ #category : 'accessing' }
UnixPlatform >> libcDirent [
	^libcDirent
]

{ #category : 'accessing' }
UnixPlatform >> libcFcntl [
	^libcFcntl
]

{ #category : 'accessing' }
UnixPlatform >> libcStat [

	^libcStat
]

{ #category : 'accessing' }
UnixPlatform >> libcStdio [

	^libcStdio
]

{ #category : 'accessing' }
UnixPlatform >> libcUnistd [
	^libcUnistd
]

{ #category : 'accessing' }
UnixPlatform >> lineEnding [

	^ String lf
]
