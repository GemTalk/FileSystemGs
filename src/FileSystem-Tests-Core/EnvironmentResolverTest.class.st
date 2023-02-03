Class {
	#name : 'EnvironmentResolverTest',
	#superclass : 'FileSystemResolverTest',
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'utilities' }
EnvironmentResolverTest >> createResolver [

	^EnvironmentResolver new
]

{ #category : 'accessing' }
EnvironmentResolverTest >> envVarName [

	^'GS_ERT_TEST_VALUE'
]

{ #category : 'running' }
EnvironmentResolverTest >> tearDown [

	System
		gemEnvironmentVariable: self envVarName
		put: nil.
	super tearDown
]

{ #category : 'running' }
EnvironmentResolverTest >> testEnvironmentPath [

	| evName evValue |
	evName := 'GS_ERT_TEST_VARIABLE'.
	evValue := '/'.
	self denyOriginResolves: self envVarName.
	System
		gemEnvironmentVariable: self envVarName
		put: evValue.
	self assertOriginResolves: self envVarName
]
