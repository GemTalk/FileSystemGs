"
Part of FileSystem

=========

SUnit tests for FileSystemResolver
"
Class {
	#name : 'FileSystemResolverTest',
	#superclass : 'FsTestCase',
	#instVars : [
		'resolver'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'testing' }
FileSystemResolverTest class >> isAbstract [
	^ self name = #FileSystemResolverTest
]

{ #category : 'asserting' }
FileSystemResolverTest >> assertOriginResolves: aSymbol [
	| reference |
	reference := resolver resolve: aSymbol.
	self assert: (reference isKindOf: FileReference).
	self assert: reference exists.
	self assert: reference isAbsolute.
	^ reference
]

{ #category : 'running' }
FileSystemResolverTest >> createResolver [
	self subclassResponsibility 
]

{ #category : 'asserting' }
FileSystemResolverTest >> denyOriginResolves: aSymbol [

	| reference |
	reference := resolver resolve: aSymbol.
	self
		assert: reference
		equals: nil
]

{ #category : 'running' }
FileSystemResolverTest >> setUp [
	super setUp.
	resolver := self createResolver.
]
