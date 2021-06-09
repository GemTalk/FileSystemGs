Class {
	#name : 'FileAttributeNotSupported',
	#superclass : 'Error',
	#instVars : [
		'attribute'
	],
	#category : 'FileSystem-Exceptions'
}

{ #category : 'signaling' }
FileAttributeNotSupported class >> signalAttribute: anAttributeName [

	^self new
		attribute: anAttributeName;
		signal
]

{ #category : 'accessing' }
FileAttributeNotSupported >> attribute [

	^attribute
]

{ #category : 'accessing' }
FileAttributeNotSupported >> attribute: anAttributeName [

	attribute := anAttributeName.
	messageText := '', anAttributeName, ' is not supported by this FileSystem.'
]

{ #category : 'testing' }
FileAttributeNotSupported >> isResumable [

	^true
]
