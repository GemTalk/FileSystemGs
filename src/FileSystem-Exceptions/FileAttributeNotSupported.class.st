"
This Error is signaled when an attempting to access an attribute which is unsupported by the underlying FileSystem.
"
Class {
	#name : 'FileAttributeNotSupported',
	#superclass : 'Error',
	#instVars : [
		'attribute'
	],
	#category : 'FileSystem-Exceptions'
}

{ #category : 'signaling' }
FileAttributeNotSupported class >> signalWith: anAttributeName [

	^self new
		attribute: anAttributeName;
		signal
]

{ #category : 'accessing' }
FileAttributeNotSupported >> attribute [
	"Returns the name of an unsupported Attribute.
	Example: #creationTime"

	^attribute
]

{ #category : 'accessing' }
FileAttributeNotSupported >> attribute: anAttributeName [
	"Sets the name of the unsupported attribute"

	attribute := anAttributeName
]

{ #category : 'accessing' }
FileAttributeNotSupported >> messageText [

	^messageText ifNil: [self class name printString, ' does not support ', self attribute printString]
]
