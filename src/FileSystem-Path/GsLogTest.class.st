Class {
	#name : 'GsLogTest',
	#superclass : 'GsTestCase',
	#instVars : [
		'references',
		'logs'
	],
	#category : 'FileSystem-Path'
}

{ #category : 'accessing' }
GsLogTest >> newLog: aFileReference [
	"Create a new log that is automatically closed after the test run."

	| log |
	log := GsLog fileReference: aFileReference.
	logs add: log.
	^log
]

{ #category : 'accessing' }
GsLogTest >> newReference: pathString [
	"Create a new FileReference that is automatically deleted after the test run."

	| ref |
	ref := pathString asFileReference.
	references add: ref.
	^ref
]

{ #category : 'lifecyle' }
GsLogTest >> setUp [

	super setUp.
	logs := Array new.
	references := Array new.
]

{ #category : 'lifecyle' }
GsLogTest >> tearDown [

	logs do: [:each | each close].
	references do: [:each | each ensureDelete].
	super tearDown
]

{ #category : 'running' }
GsLogTest >> testCreatingLogCreatesFile [
	"A file should not have to exist before a log is created."

	| ref log |
	ref := self newReference: './testCreatingLogCreatesFile.log'.
	self deny: ref exists.
	log := GsLog fileReference: ref.
	self assert: ref exists.
]

{ #category : 'running' }
GsLogTest >> testLogAppendsToExistingFile [
	"A file should not have to exist before a log is created."

	| ref log |
	ref := self newReference: './testCreatingLogCreatesFile.log'.
	ref writeStreamDo: [:stream | stream nextPutAll: 'Before log opened'; lf].
	log := self newLog: ref.
	log write: 'First log entry'.
	self
		assert: ref contents
		equals: 'Before log opened', Character lf asString, 'First log entry', Character lf asString
]

{ #category : 'running' }
GsLogTest >> testLogContents [
	"Ensure the log contents match the expectation."

	| ref log |
	ref := self newReference: './testLogContents.log'.
	log := self newLog: ref.
	log
		write: 'Message 1';
		write: 'Message 2'.
	self
		assert: ref contents
		equals: 'Message 1', Character lf asString, 'Message 2', Character lf asString.
]

{ #category : 'running' }
GsLogTest >> testLogRotate [
	"Ensure rotating the log results in subsequent writes going to new file
	at the original location."

	| logRef moveRef log |
	logRef := self newReference: './testLogRotate.log'.
	moveRef := self newReference: './testLogRotate.log.1'.
	log := self newLog: logRef.
	log write: 'Initial log'.
	logRef copy renameTo: moveRef basename. "Copy to avoid logRef from pointing to the new name."
	log write: 'After move'.
	log rotate.
	log write: 'After rotate'.
	self
		assert: moveRef contents
		equals: 'Initial log', Character lf asString, 'After move', Character lf asString.
	self
		assert: logRef contents
		equals: 'After rotate', Character lf asString
]

{ #category : 'running' }
GsLogTest >> testLogRotateApendsToExistingFile [
	"Ensure rotating the log results in subsequent writes going to new file
	at the original location."

	| logRef log |
	logRef := self newReference: './testLogRotate.log'.
	log := self newLog: logRef.
	log write: 'Initial log'.
	log rotate.
	log write: 'After rotate'.
	self
		assert: logRef contents
		equals: 'Initial log', Character lf asString,  'After rotate', Character lf asString
]
