"
Part of FileSystem

=========

SUnit tests for random zinc stream integration issues.
"
Class {
	#name : 'FsZincIntegrationTests',
	#superclass : 'TestCase',
	#instVars : [
		'sandbox'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'support' }
FsZincIntegrationTests >> createFile: aString
contents: contentsString [

	| reference |
	reference := sandbox / aString.
	reference parent ensureCreateDirectory.
	reference writeStreamDo: [:stream | stream nextPutAll: contentsString].
	self assert: reference isFile.
	^reference
]

{ #category : 'accessing' }
FsZincIntegrationTests >> sandboxName [
	"name of the sandbox directory"

	^self subclassResponsibility
]

{ #category : 'running' }
FsZincIntegrationTests >> testUTF8EncoderBackOnFileStream [

	| ref stream encoder |
	ref := self
		createFile: 'testUTF8EncoderBackOnFileStream'
		contents: 'Les élèves Françaises'.
	stream := ref binaryReadStream. "Create a file-backed read-stream vs a string-backed stream like in ZnCharacterEncoderTests>>#testUTF8Back."
	encoder := ZnUTF8Encoder new.
	self
		should: [encoder backOnStream: stream]
		raise: Error.
	4 timesRepeat: [ encoder nextFromStream: stream ].
	self
		assert: (encoder nextFromStream: stream)
		equals: $é.
	encoder backOnStream: stream.
	self
		assert: (encoder nextFromStream: stream)
		equals: $é.
	10 timesRepeat: [ encoder nextFromStream: stream ].
	13 timesRepeat: [ encoder backOnStream: stream ].
	self
		assert: (encoder nextFromStream: stream)
		equals: $s
]
