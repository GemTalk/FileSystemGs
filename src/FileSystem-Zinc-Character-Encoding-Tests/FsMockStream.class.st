"
Part of FileSystem

=========

Mock class used to ensure stream classes are behaving correctly.
"
Class {
	#name : 'FsMockStream',
	#superclass : 'Object',
	#instVars : [
		'actionSequence'
	],
	#category : 'FileSystem-Zinc-Character-Encoding-Tests'
}

{ #category : 'instance creation' }
FsMockStream class >> new [

	^super new initialize
]

{ #category : 'accessing' }
FsMockStream >> actionSequence [
	"Return the sequence of actions performed on the receiver."

	^actionSequence
]

{ #category : 'stream-behavior' }
FsMockStream >> close [
	"Record stream close"

	actionSequence add: {#close}
]

{ #category : 'stream-behavior' }
FsMockStream >> flush [
	"Record stream flush"

	actionSequence add: {#flush}
]

{ #category : 'initialize-release' }
FsMockStream >> initialize [

	super initialize.
	actionSequence := Array new
]

{ #category : 'stream-behavior' }
FsMockStream >> isStream [
	"Record #isStream was asked. Answer true to ensure correct behavior of user."

	actionSequence add: {#isStream}.
	^true
]

{ #category : 'stream-behavior' }
FsMockStream >> nextPut: anElement [
	"Record stream element writting"

	actionSequence add: {#nextPut:. anElement}
]

{ #category : 'stream-behavior' }
FsMockStream >> nextPutAll: elements [
	"Record stream elements writing"

	actionSequence add: {#nextPutAll:. elements}
]
