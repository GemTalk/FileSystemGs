"
Part of FileSystem

=========

SUnit tests for PlatformResolver
"
Class {
	#name : 'PlatformResolverTest',
	#superclass : 'FileSystemResolverTest',
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'running' }
PlatformResolverTest >> createResolver [

	^PlatformResolver forCurrentPlatform
]

{ #category : 'tests' }
PlatformResolverTest >> testCache [
	| cache |
	cache := self assertOriginResolves: #cache
]

{ #category : 'tests' }
PlatformResolverTest >> testCorrectClass [

	| expectedClass |
	expectedClass := (System gemVersionAt: 'osName') = 'Darwin'
		ifTrue: [MacOSResolver]
		ifFalse: [UnixResolver].
	self
		assert: resolver class
		equals: expectedClass
]

{ #category : 'tests' }
PlatformResolverTest >> testHome [
	| home |
	home := self assertOriginResolves: #home.
	self assert: home isDirectory
]
