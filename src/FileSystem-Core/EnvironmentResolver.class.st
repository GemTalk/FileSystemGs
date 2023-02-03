"
Part of FileSystem

=========

I resolve origins which are Environment variables. I ensure the environment variable value refers to an actual path in the file system.
"
Class {
	#name : 'EnvironmentResolver',
	#superclass : 'FileSystemResolver',
	#category : 'FileSystem-Core'
}

{ #category : 'resolving' }
EnvironmentResolver >> canResolve: aSymbol [

	self
		resolve: aSymbol
		ifUnknown: [^false].
	^true
]

{ #category : 'resolving' }
EnvironmentResolver >> resolve: aSymbol [

	^self
		resolve: aSymbol
		ifUnknown: [self unknownOrigin: aSymbol]
]

{ #category : 'resolving' }
EnvironmentResolver >> resolve: aSymbol
ifUnknown: aBlock [

	| envVar ref |
	envVar := System gemEnvironmentVariable: aSymbol.
	envVar == nil
		ifTrue: [^aBlock value].
	ref := self resolveString: envVar.
	ref exists
		ifFalse: [^aBlock value].
	^ref
]
