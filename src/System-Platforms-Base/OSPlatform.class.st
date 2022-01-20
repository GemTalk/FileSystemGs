"
An OSPlatform is an abstract representation of a 'OS platform'.
Platforms can be hierarchical, e.g., a ""general"" platform as superclass and more specific platforms as subclasses as long as the subclasses provide sufficient means to identify themselves.
The original implementation was for Tweak.

Current		holds the current OSPlatform subclass

Architectural considerations:
most platform specific methods that need to be added to the platform class should be in the form of extensions rather then adding them directly to this package. Otherwise the platform class will degenerate very quickly into a dependence hub for all kinds of sub systems.
"
Class {
	#name : 'OSPlatform',
	#superclass : 'Object',
	#category : 'System-Platforms-Base'
}

{ #category : 'private' }
OSPlatform class >> cacheKey [
	^ #'GsCurrentPlatform'
]

{ #category : 'accessing' }
OSPlatform class >> current [
	"Answer the instance for the currently executing OS platform."

	^SessionTemps current
		at: self cacheKey
		ifAbsent: [self initializeCurrent]
]

{ #category : 'private' }
OSPlatform class >> determineActivePlatform [
	"Look for the matching platform class"
	^ self allSubclasses 
		detect: [ :any | any isActivePlatform ].

]

{ #category : 'accessing' }
OSPlatform class >> initializeCurrent [
	"initialize the current singleton"

	| cached |
	cached := self determineActivePlatform new initialize.
	SessionTemps current at: self cacheKey put: cached.
	^cached
]

{ #category : 'private' }
OSPlatform class >> isActivePlatform [
	"Answer whether the receiver is the active platform"
	^false
]

{ #category : 'system attributes' }
OSPlatform class >> platformArchitecture [
	"Return the platform architecture we're running on"

	^System gemVersionAt: 'cpuArchitecture'
]

{ #category : 'system attributes' }
OSPlatform class >> platformName [
	"Return the name of the platform we're running on"

	^System gemVersionAt: 'osName'
]

{ #category : 'accessing' }
OSPlatform >> current [
	^ self
]

{ #category : 'accessing' }
OSPlatform >> currentWorkingDirectoryPath [
	"This method calls the method getPwdViaFFI with arugement of a buffer size. By default it uses the defaultMaximumPathLength of each subclass as the buffer size."

	self subclassResponsibility
]

{ #category : 'accessing' }
OSPlatform >> defaultMaximumPathLength [
	"This method returns the default maximum path length for the getCurrentWorkingDirectory implementation"
	 ^self subclassResponsibility 

]

{ #category : 'accessing' }
OSPlatform >> diskStoreClass [
	"Returns the DiskStore subclass associated w/ this platform."

	self subclassResponsibility
]

{ #category : 'accessing' }
OSPlatform >> family [
	"Returns a symbol specific to the platform family (MacOSX, Windows, Unix, RiscOS).
	This may need to be extended if there are new platforms added or significant differences within a platform family arise (as was the case between MacOS 9 and X)."

	self subclassResponsibility
]

{ #category : 'testing' }
OSPlatform >> isLinux64 [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isMacOS [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isMacOSX [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isUnix [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isUnix32 [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isWin32 [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isWin64 [
	^ false
]

{ #category : 'testing' }
OSPlatform >> isWindows [
	^ false
]

{ #category : 'accessing' }
OSPlatform >> lineEnding [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
OSPlatform >> name [
	"Return the name of the platform we're running on"

	^ self class platformName
]

{ #category : 'compatbility' }
OSPlatform >> platformFamily [
	^ self family
]

{ #category : 'compatbility' }
OSPlatform >> platformName [
	^ self name
]

{ #category : 'accessing' }
OSPlatform >> platformResolverClass [
	"Returns the PlatformResolver subclass which should be used for this Platform."

	^self subclassResponsibility
]
