"
Part of FileSystem

=========

SUnit tests for SystemResolver
"
Class {
	#name : 'SystemResolverTest',
	#superclass : 'FileSystemResolverTest',
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'running' }
SystemResolverTest >> createResolver [
	^ SystemResolver new
]

{ #category : 'testing' }
SystemResolverTest >> testExtent1 [
	self assertOriginResolves: #extent1
]

{ #category : 'testing' }
SystemResolverTest >> testExtent1Directory [
	self assertOriginResolves: #extent1Directory
]

{ #category : 'testing' }
SystemResolverTest >> testTranlog [
	self assertOriginResolves: #tranlog
]
