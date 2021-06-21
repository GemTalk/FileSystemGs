Class {
	#name : 'FileOpeningOptions',
	#superclass : 'Object',
	#category : 'FileDescriptor'
}

{ #category : 'private' }
FileOpeningOptions class >> new [
	"Private -- use one of the access mode messages to create instances."

	^ super new initialize
]

{ #category : 'instance creation' }
FileOpeningOptions class >> readOnly [
	^ self new readOnly
]

{ #category : 'instance creation' }
FileOpeningOptions class >> readWrite [
	^ self new readWrite
]

{ #category : 'instance creation' }
FileOpeningOptions class >> writeOnly [
	^ self new writeOnly
]

{ #category : 'private' }
FileOpeningOptions >> improperOperationExceptionClass [

	"GemStone-specific; will need factoring to platform-specific package upon first port."
	^ ImproperOperation
]

{ #category : 'private' }
FileOpeningOptions >> signalLateAccessChange [
	self improperOperationExceptionClass
		signal: 'Access mode must be set before adding any other options.'
]
