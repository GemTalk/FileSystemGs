"
Register objects. Send each one #free if it is not referenced from anywhere other than the registry.
Each object should be registered in only one registry! Otherwise double frees could occur.

In most circumstances, the one global transient registry should be used, accessed 
by ""ExternalObjectRegistry current.""
"
Class {
	#name : 'ExternalObjectRegistry',
	#superclass : 'Object',
	#instVars : [
		'tally',
		'freeHead',
		'list'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'LibC'
}

{ #category : 'private' }
ExternalObjectRegistry class >> cacheKey [
	^ #'GsExternalObjectRegistry'
]

{ #category : 'accessing' }
ExternalObjectRegistry class >> current [
	| cached |
	(cached := SessionTemps current at: self cacheKey ifAbsent: [  ])
		ifNil: [ 
			cached := self new.
			SessionTemps current at: self cacheKey put: cached ].
	^ cached
]

{ #category : 'instance creation' }
ExternalObjectRegistry class >> new [

	^self new: 1
]

{ #category : 'instance creation' }
ExternalObjectRegistry class >> new: capacity [

	^(super new)
		initializeForCapacity: capacity;
		yourself
]

{ #category : 'accessing' }
ExternalObjectRegistry >> capacity [

	^list size
]

{ #category : 'accessing' }
ExternalObjectRegistry >> elementClass [

	^RegistryEphemeron
]

{ #category : 'registration' }
ExternalObjectRegistry >> grow [

	| capacity |
	capacity := list size.
	list at: capacity + 1 put: 0.
	freeHead := capacity + 1
]

{ #category : 'initialization' }
ExternalObjectRegistry >> initialize [

	tally := 0.
	self threadFreeList
]

{ #category : 'initialization' }
ExternalObjectRegistry >> initializeForCapacity: capacity [

	tally := 0.
	list := Array new: capacity.
	self threadFreeList
]

{ #category : 'mourning' }
ExternalObjectRegistry >> mournAt: index [

	tally := tally - 1.
	list at: index put: freeHead.
	freeHead := index
]

{ #category : 'registration' }
ExternalObjectRegistry >> register: anObject [
	"Add an entry for transient object anObject. It will be sent #free when it is not strongly referenced."

	| newElement newElementIndex newFreeHead |
	freeHead = 0 ifTrue: [self grow].
	newElementIndex := freeHead.
	newFreeHead := list at: freeHead.
	newFreeHead _isSmallInteger ifFalse: [self halt: 'FreeHead problem'].
	freeHead := newFreeHead.
	newElement := self elementClass
				object: anObject
				registry: self
				index: newElementIndex.
	list at: newElementIndex put: newElement.
	tally := tally + 1
]

{ #category : 'accessing' }
ExternalObjectRegistry >> size [

	^tally
]

{ #category : 'initialization' }
ExternalObjectRegistry >> threadFreeList [

	| capacity |
	capacity := list size.
	1 to: capacity - 1 do: [:i | list at: i put: i + 1].
	list at: capacity put: 0.
	freeHead := 1
]
