"
Part of FileSystem

=========

Provide finalization to FileDescriptor. Stored in FileDescriptorRegistry.
"
Class {
	#name : 'FsFileDescriptorEmphemeron',
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
FsFileDescriptorEmphemeron class >> new [

	^super new initialize
]

{ #category : 'Instance creation' }
FsFileDescriptorEmphemeron class >> object: anObject registry: anExternalObjectRegistry index: indexInRegistry [

	^(self new)
		object: anObject;
		registry: anExternalObjectRegistry;
		index: indexInRegistry;
		yourself
]

{ #category : 'public' }
FsFileDescriptorEmphemeron >> deregister [
	"The object is expected to send this message to me
	after I send it #free, unless it wants me to keep a strong
	transient reference to it longer than that."

	registry mournAt: index.
	object := nil
]

{ #category : 'accessing' }
FsFileDescriptorEmphemeron >> index: anInteger [

	index := anInteger
]

{ #category : 'initialization' }
FsFileDescriptorEmphemeron >> initialize [

	self beEphemeron: true
]

{ #category : 'mourning' }
FsFileDescriptorEmphemeron >> mourn [
	"Unless the object wants to be kept alive after freeing,
	it is expected to send #deregister to me as part of its
	freeing action."

	object free
]

{ #category : 'accessing' }
FsFileDescriptorEmphemeron >> object: anObject [

	object := anObject
]

{ #category : 'accessing' }
FsFileDescriptorEmphemeron >> registry: anExternalObjectRegistry [

	registry := anExternalObjectRegistry
]
