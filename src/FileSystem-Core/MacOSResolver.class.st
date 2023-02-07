"
Part of FileSystem

=========

I am an expert on Mac OS X filesystem conventions. I resolve origins according to these conventions.
"
Class {
	#name : 'MacOSResolver',
	#superclass : 'PlatformResolver',
	#category : 'FileSystem-Core'
}

{ #category : 'accessing' }
MacOSResolver class >> platformName [
	^  'Mac OS'
]

{ #category : 'origins' }
MacOSResolver >> cache [
	^ self library / 'Caches'
]

{ #category : 'origins' }
MacOSResolver >> home [
	^ self directoryFromEnvVariableNamed: 'HOME'
]

{ #category : 'origins' }
MacOSResolver >> library [
	^ self userLibrary
]

{ #category : 'origins' }
MacOSResolver >> preferences [ 

	^self library / 'Preferences'
]

{ #category : 'resolving' }
MacOSResolver >> supportedOrigins [
	^ super supportedOrigins , #(userApplicationSupport systemApplicationSupport systemLibrary userLibrary)
]

{ #category : 'origins' }
MacOSResolver >> systemApplicationSupport [
	^ self systemLibrary / 'Application Support'
]

{ #category : 'origins' }
MacOSResolver >> systemLibrary [
	^  FileSystem disk root / 'Library'
]

{ #category : 'origins' }
MacOSResolver >> temp [

	| tempPath |
	tempPath := System gemEnvironmentVariable: 'TMPDIR'.
	(tempPath beginsWith: '/private')
		ifFalse: [tempPath := '/private', tempPath]. "Avoid using symlink. /tmp, /var are symlinked to /private/tmp and /private/var."
	^FileSystem disk root resolve: tempPath
]

{ #category : 'origins' }
MacOSResolver >> userApplicationSupport [
	^self userLibrary / 'Application Support'
]

{ #category : 'origins' }
MacOSResolver >> userLibrary [
	^  self home / 'Library'
]
