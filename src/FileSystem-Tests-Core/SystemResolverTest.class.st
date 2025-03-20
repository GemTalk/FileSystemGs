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
SystemResolverTest >> testGemLogDirectory [

	System gemLogPath = ''
		ifFalse: [self assertOriginResolves: #gemLogDirectory]
]

{ #category : 'testing' }
SystemResolverTest >> testWorkingDirectory [
	self assertOriginResolves: #workingDirectory
]
