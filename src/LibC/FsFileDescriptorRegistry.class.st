"
Part of FileSystem

=========

Registers FileDescriptors. Send each one #free if it is not referenced from anywhere other than the registry.
Each object should be registered in only one registry! Otherwise double frees could occur.

In most circumstances, the one global transient registry should be used, accessed 
by ""FsFileDescriptorRegistry current.""
"
Class {
	#name : 'FsFileDescriptorRegistry',
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
FsFileDescriptorRegistry class >> cacheKey [
	^ #'GsExternalObjectRegistry'
]

{ #category : 'accessing' }
FsFileDescriptorRegistry class >> current [
	| cached |
	(cached := SessionTemps current at: self cacheKey ifAbsent: [  ])
		ifNil: [ 
			cached := self new.
			SessionTemps current at: self cacheKey put: cached ].
	^ cached
]

{ #category : 'instance creation' }
FsFileDescriptorRegistry class >> new [

	^self new: 1
]

{ #category : 'instance creation' }
FsFileDescriptorRegistry class >> new: capacity [

	^(super new)
		initializeForCapacity: capacity;
		yourself
]

{ #category : 'accessing' }
FsFileDescriptorRegistry >> capacity [

	^list size
]

{ #category : 'accessing' }
FsFileDescriptorRegistry >> elementClass [

	^FsFileDescriptorEmphemeron
]

{ #category : 'private' }
FsFileDescriptorRegistry >> grow [

	| capacity |
	capacity := list size.
	list at: capacity + 1 put: 0.
	freeHead := capacity + 1
]

{ #category : 'initialization' }
FsFileDescriptorRegistry >> initialize [

	tally := 0.
	self threadFreeList
]

{ #category : 'initialization' }
FsFileDescriptorRegistry >> initializeForCapacity: capacity [

	tally := 0.
	list := Array new: capacity.
	self threadFreeList
]

{ #category : 'mourning' }
FsFileDescriptorRegistry >> mournAt: index [

	tally := tally - 1.
	list at: index put: freeHead.
	freeHead := index
]

{ #category : 'registration' }
FsFileDescriptorRegistry >> register: anObject [
	"Add an entry for transient object anObject. It will be sent #free when it is not strongly referenced.
	Answer a registry entry object. The registered object anObject is expected to send this registry entry
	object the message #deregister when it should no longer be kept track of. This is most often part of 
	its #free action, but can be done earlier, later, or not at all."

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
	tally := tally + 1.
	^newElement
]

{ #category : 'accessing' }
FsFileDescriptorRegistry >> size [

	^tally
]

{ #category : 'private' }
FsFileDescriptorRegistry >> threadFreeList [

	| capacity |
	capacity := list size.
	1 to: capacity - 1 do: [:i | list at: i put: i + 1].
	list at: capacity put: 0.
	freeHead := 1
]