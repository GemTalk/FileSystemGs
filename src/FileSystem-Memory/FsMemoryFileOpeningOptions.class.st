"
Part of FileSystem

=========

Provides support for In-memory FileSystem implementation.
"
Class {
	#name : 'FsMemoryFileOpeningOptions',
	#superclass : 'FsFileOpeningOptions',
	#instVars : [
		'wasConfigured',
		'readable',
		'writable'
	],
	#category : 'FileSystem-Memory'
}

{ #category : 'asserting' }
FsMemoryFileOpeningOptions >> assertUnconfigured [
	"Assert that the access mode has not yet been configured."

	wasConfigured
		ifTrue: [self signalImproperOperation: 'Access mode must be set before adding any other options.']
]

{ #category : 'private access modes' }
FsMemoryFileOpeningOptions >> create [
	"NOP. Files are automatically created in a In-Memory FileSystem when writting.
	This method enables default options to be specified in FileReference rather than in
	the FileSystem Store."
]

{ #category : 'initializing' }
FsMemoryFileOpeningOptions >> initialize [

	super initialize.
	wasConfigured := readable := writable := false
]

{ #category : 'testing' }
FsMemoryFileOpeningOptions >> isReadable [
	"Returns true is reading should be supported."

	^readable
]

{ #category : 'testing' }
FsMemoryFileOpeningOptions >> isReadOnly [
	"Returns true if only reading should be supported."

	^self isReadable and: [self isWritable not]
]

{ #category : 'testing' }
FsMemoryFileOpeningOptions >> isReadWrite [
	"Returns true if reading and writing should be supported."

	^self isReadable and: [self isWritable]
]

{ #category : 'testing' }
FsMemoryFileOpeningOptions >> isWritable [
	"Returns true is writing should be supported."

	^writable
]

{ #category : 'testing' }
FsMemoryFileOpeningOptions >> isWriteOnly [
	"Returns true if only writing should be supported."

	^self isReadable not and: [self isWritable]
]

{ #category : 'private access modes' }
FsMemoryFileOpeningOptions >> readOnly [
	"Allow reading only"

	self assertUnconfigured.
	readable := true.
	wasConfigured := true
]

{ #category : 'private access modes' }
FsMemoryFileOpeningOptions >> readWrite [
	"Allow both reading and writing"

	self assertUnconfigured.
	writable := true.
	readable := true.
	wasConfigured := true
]

{ #category : 'private access modes' }
FsMemoryFileOpeningOptions >> writeOnly [
	"Allow writing only"

	self assertUnconfigured.
	writable := true.
	wasConfigured := true
]
