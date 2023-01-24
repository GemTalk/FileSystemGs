"
Part of FileSystem

=========

Provide finalization to FileDescriptor. Stored in FileDescriptorRegistry.
"
Class {
	#name : 'FsFileDescriptorEphemeron',
	#superclass : 'Object',
	#instVars : [
		'fileDescriptor',
		'registry',
		'index'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileDescriptor'
}

{ #category : 'Instance creation' }
FsFileDescriptorEphemeron class >> fileDescriptor: aFileDescriptor
registry: aRegistry
index: anIndex [

	^self new
		fileDescriptor: aFileDescriptor;
		registry: aRegistry;
		index: anIndex;
		yourself
]

{ #category : 'private-testing' }
FsFileDescriptorEphemeron >> _private_test_only_fileDescriptor [

	^fileDescriptor
]

{ #category : 'private-testing' }
FsFileDescriptorEphemeron >> _private_test_only_index [

	^index
]

{ #category : 'public' }
FsFileDescriptorEphemeron >> deregister [
	"When a FileDescriptor is closed, it is expected to send this message."

	| tReg tIndex |
	tReg := registry.
	tIndex := index.
	registry := index := fileDescriptor := nil.
	(tReg notNil & tIndex notNil)
		ifTrue: [tReg deregisterAt: tIndex]
]

{ #category : 'accessing' }
FsFileDescriptorEphemeron >> fileDescriptor: aFileDescriptor [

	fileDescriptor := aFileDescriptor.
	self beEphemeron: true.
	fileDescriptor _ephemeron: self
]

{ #category : 'accessing' }
FsFileDescriptorEphemeron >> index: anInteger [

	index := anInteger
]

{ #category : 'mourning' }
FsFileDescriptorEphemeron >> mourn [
	"Close the fileDescriptor. When closed, the FileDescriptor
	if requried to send #deregister to its ephemeron. This
	ensures the Ephemeron is cleaned up."

	fileDescriptor ifNotNil: [:fs | fs close]
]

{ #category : 'accessing' }
FsFileDescriptorEphemeron >> registry: aFileDescriptorRegistry [

	registry := aFileDescriptorRegistry
]
