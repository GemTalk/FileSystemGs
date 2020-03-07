"
Each RegistryEphemeron registers one object for the ExternalObjectRegistry.

"
Class {
	#name : 'RegistryEphemeron',
	#superclass : 'Object',
	#instVars : [
		'object',
		'registry',
		'index'
	],
	#gs_options : [
		'instancesNonPersistent'
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

{ #category : 'public' }
RegistryEphemeron >> deregister [
	"The object is expected to send this message to me
	after I send it #free, unless it wants me to keep a strong
	transient reference to it longer than that."

	registry mournAt: index.
	object := nil
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
	"Unless the object wants to be kept alive after freeing,
	it is expected to send #deregister to me as part of its
	freeing action."

	object free
]

{ #category : 'accessing' }
RegistryEphemeron >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
RegistryEphemeron >> registry: anExternalObjectRegistry [

	registry := anExternalObjectRegistry
]
