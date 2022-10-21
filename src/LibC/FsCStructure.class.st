"
Part of FileSystem

=========

Abstract superclass for classes representing structures in external memory.
Typically, these are represented in C as struct types. They have named fields of various types.
Subclasses of this class provide the ability to read and write individual fields, and to allocate and free
instances of the structure.

bytes is an instance of CByteArray, and therefore in external memory.
"
Class {
	#name : 'FsCStructure',
	#superclass : 'Object',
	#instVars : [
		'bytes',
		'pointer'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'LibC'
}

{ #category : 'instance creation' }
FsCStructure class >> forBytes: aCByteArray [
	"aCPointer must point at the kind of struct for the receiving class."

	^super new
		bytes: aCByteArray;
		yourself
]

{ #category : 'accessing' }
FsCStructure class >> structSize [
	"Returns the size in bytes of the C struct."

	^self subclassResponsibility
]

{ #category : 'private - accessing' }
FsCStructure >> bytes [
	"This is necessary for library calls which require passing in a structure."

	^bytes
]

{ #category : 'private - accessing' }
FsCStructure >> bytes: aCByteArray [
	"Private"

	bytes := aCByteArray
]

{ #category : 'testing' }
FsCStructure >> isNull [
	"Answer true if my CByteArray is a null pointer."

	^ bytes memoryAddress = 0
]
