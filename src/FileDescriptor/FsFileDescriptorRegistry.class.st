"
Part of FileSystem

=========

FsFileDescriptorRegistry holds onto FsFileDescriptor instances indirectly via an Ephemeron. When the Ephemeron is mourned, the OS file descriptor will be closed (if necessary). The Ephemeron will also be removed from the Registry.

The registry is a singleton and the instance is accessible via `FsFileDescriptorRegistry current`.
"
Class {
	#name : 'FsFileDescriptorRegistry',
	#superclass : 'Object',
	#instVars : [
		'freeHead',
		'list'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileDescriptor'
}

{ #category : 'private' }
FsFileDescriptorRegistry class >> cacheKey [
	^ #'GsFsFileDescriptorRegistrySingleton'
]

{ #category : 'accessing' }
FsFileDescriptorRegistry class >> current [
	"The Singleton is lazily initialized. There is an unlikely scenario where
	a Process swap occurs during this initialization causing it to happen
	multiple times. This could cause N-1 file descriptor leaks where N
	is the number of concurrent initializations. At this time it isn't worth
	preventing this very unlikely potential. A leak would also require that
	a user of the file dscriptor does not close it as part of its usage."

	^SessionTemps current
		at: self cacheKey
		ifAbsentPut: [super new initialize]
]

{ #category : 'instance creation' }
FsFileDescriptorRegistry class >> new [
	"Not allowed. Use #current."

	self shouldNotImplement: #new
]

{ #category : 'instance creation' }
FsFileDescriptorRegistry class >> resetCurrent [
	"Destroy the current registry allowing another to be created.
	This should not be used outside of debugging and development
	purposes."

	SessionTemps current
		removeKey: self cacheKey
		ifAbsent: []
]

{ #category : 'mourning' }
FsFileDescriptorRegistry >> deregisterAt: index [
	"Removing an Ephemeron from the Registry requires the same
	consideration at registering an element. This method is written
	in a manner that avoids interrupt windows. This is a requirement
	as the Registry is a lock-free datastructure.
	SPECIAL NOTE ABOUT DEBUGGERS:
		Stepping through the designated critical section in a debugger could cause
		leaked file descriptors. The problem is unlikely to happen but remains 
		possible in the context of a debugger.
		DO NOT step through this method without considering the risk."

	"CRITICAL SECTION"
	list
		at: index
		put: freeHead.
	freeHead := index
	"END CRITICAL SECTION"
]

{ #category : 'accessing' }
FsFileDescriptorRegistry >> elementClass [

	^FsFileDescriptorEphemeron
]

{ #category : 'initialization' }
FsFileDescriptorRegistry >> initialize [
	"Initialize the list of Ephemerons"

	list := NonPersistentArray new.
	freeHead := 0
]

{ #category : 'registration' }
FsFileDescriptorRegistry >> register: aFileDescriptor [
	"Adding a FileDescriptor to the Registry is a seemingly easy process but it
	requires considerable care. The Registry is written in a lock-free manner
	to avoid the overhead and problems using a lock would entail. Ephemeron
	mourning happens in the current active Process. A lock-free datastructure
	avoids any concern about deadlocks while maintaining correctness (outside
	of the unlikely debugger case.)
	SPECIAL NOTE ABOUT DEBUGGERS:
		Stepping through the designated critical section in a debugger could cause
		leaked file descriptors. The problem is unlikely to happen but remains 
		possible in the context of a debugger.
		Stepping outside the critical sections does not carry risk.
		DO NOT step through this method without considering the risk."

	| ephemeron index |
	"CRITICIAL SECTION"
	freeHead = 0
		ifTrue: [index := list size + 1]
		ifFalse:
			[index := freeHead.
			freeHead := list at: index].
	"END CRITICAL SECTION"
	ephemeron := self elementClass
		fileDescriptor: aFileDescriptor
		registry: self
		index: index.
	list
		at: index
		put: ephemeron.
	^ephemeron
]
