"
Part of FileSystem

=========

Abstract superclass for platform-/architecture-specific option classes. Subclasses differ due the difference in values and options provided by different environments.
"
Class {
	#name : 'FsFileOpeningOptions',
	#superclass : 'Object',
	#category : 'FileDescriptor'
}

{ #category : 'private' }
FsFileOpeningOptions class >> new [
	"Private -- use one of the access mode messages to create instances."

	^ super new initialize
]

{ #category : 'instance creation' }
FsFileOpeningOptions class >> readOnly [
	^ self new readOnly
]

{ #category : 'instance creation' }
FsFileOpeningOptions class >> readWrite [
	^ self new readWrite
]

{ #category : 'instance creation' }
FsFileOpeningOptions class >> writeOnly [
	^ self new writeOnly
]

{ #category : 'private' }
FsFileOpeningOptions >> improperOperationExceptionClass [
	"GemStone-specific; will need factoring to platform-specific package upon first port."

	^ImproperOperation
]

{ #category : 'signaling' }
FsFileOpeningOptions >> signalImproperOperation: messageText [

	^self improperOperationExceptionClass signal: messageText
]

{ #category : 'private' }
FsFileOpeningOptions >> signalLateAccessChange [

	self signalImproperOperation: 'Access mode must be set before adding any other options.'
]
