Class {
	#name : 'MemoryFileOpeningOptions',
	#superclass : 'FileOpeningOptions',
	#instVars : [
		'wasConfigured',
		'readable',
		'writable'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'asserting' }
MemoryFileOpeningOptions >> assertUnconfigured [
	"Assert that the access mode has not yet been configured."

	wasConfigured
		ifTrue: [self signalLateAccessChange]
]

{ #category : 'initializing' }
MemoryFileOpeningOptions >> initialize [

	super initialize.
	wasConfigured := readable := writable := false
]

{ #category : 'testing' }
MemoryFileOpeningOptions >> isReadable [
	"Returns true is reading should be supported."

	^readable
]

{ #category : 'testing' }
MemoryFileOpeningOptions >> isReadOnly [
	"Returns true if only reading should be supported."

	^self isReadable and: [self isWritable not]
]

{ #category : 'testing' }
MemoryFileOpeningOptions >> isReadWrite [
	"Returns true if reading and writing should be supported."

	^self isReadable and: [self isWritable]
]

{ #category : 'testing' }
MemoryFileOpeningOptions >> isWritable [
	"Returns true is writing should be supported."

	^writable
]

{ #category : 'testing' }
MemoryFileOpeningOptions >> isWriteOnly [
	"Returns true if only writing should be supported."

	^self isReadable not and: [self isWritable]
]

{ #category : 'private access modes' }
MemoryFileOpeningOptions >> readOnly [
	"Allow reading only"

	self assertUnconfigured.
	readable := true.
	wasConfigured := true
]

{ #category : 'private access modes' }
MemoryFileOpeningOptions >> readWrite [
	"Allow both reading and writing"

	self assertUnconfigured.
	writable := true.
	readable := true.
	wasConfigured := true
]

{ #category : 'private access modes' }
MemoryFileOpeningOptions >> writeOnly [
	"Allow writing only"

	self assertUnconfigured.
	writable := true.
	wasConfigured := true
]
