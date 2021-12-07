"
This Error is signaled when an attempting to access an attribute which is unsupported by the underlying FileSystem.
"
Class {
	#name : 'UnsupportedFileReferenceAttribute',
	#superclass : 'Error',
	#instVars : [
		'attribute'
	],
	#category : 'FileSystem-Exceptions'
}

{ #category : 'signaling' }
UnsupportedFileReferenceAttribute class >> signalWith: anAttributeName [

	^self new
		attribute: anAttributeName;
		signal
]

{ #category : 'accessing' }
UnsupportedFileReferenceAttribute >> attribute [
	"Returns the name of an unsupported Attribute.
	Example: #creationTime"

	^attribute
]

{ #category : 'accessing' }
UnsupportedFileReferenceAttribute >> attribute: anAttributeName [
	"Sets the name of the unsupported attribute"

	attribute := anAttributeName
]

{ #category : 'accessing' }
UnsupportedFileReferenceAttribute >> messageText [

	^messageText ifNil: [self class name printString, ' does not support ', self attribute printString]
]
