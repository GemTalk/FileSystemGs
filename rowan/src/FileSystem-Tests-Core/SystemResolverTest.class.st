"
SUnit tests for SystemResolver
"
Class {
	#name : 'SystemResolverTest',
	#superclass : 'FileSystemResolverTest',
	#category : 'FileSystem-Tests-Core-Resolver'
}

{ #category : 'running' }
SystemResolverTest >> createResolver [
	^ SystemResolver new
]

{ #category : 'testing' }
SystemResolverTest >> testDbfScratchDir [
	self assertOriginResolves: #dbfScratchDir
]

{ #category : 'testing' }
SystemResolverTest >> testExtent1 [
	self assertOriginResolves: #extent1
]

{ #category : 'testing' }
SystemResolverTest >> testTranlog [
	self assertOriginResolves: #tranlog
]
