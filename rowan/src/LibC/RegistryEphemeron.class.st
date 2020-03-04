"
Each RegistryEphemeron registers one object for the ExternalObjectRegistry.

"
Class {
	#name : 'RegistryEphemeron',
	#superclass : 'Object',
	#instVars : Array [
		'object',
		'registry',
		'index'
	],
	#category : 'LibC'
}

{ #category : 'Instance creation' }
RegistryEphemeron class >> new [

	^super new initialize
]

{ #category : 'Instance creation' }
RegistryEphemeron class >> object: anObject registry: anExternalObjectRegistry index: indexInRegistry [

	^(self new)
		object: anObject;
		registry: anExternalObjectRegistry;
		index: indexInRegistry;
		yourself
]

{ #category : 'accessing' }
RegistryEphemeron >> index: anInteger [

	index := anInteger
]

{ #category : 'initialization' }
RegistryEphemeron >> initialize [

	self beEphemeron: true
]

{ #category : 'mourning' }
RegistryEphemeron >> mourn [

	object free.
	registry mournAt: index.
	object := nil
]

{ #category : 'accessing' }
RegistryEphemeron >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
RegistryEphemeron >> registry: anExternalObjectRegistry [

	registry := anExternalObjectRegistry
]
