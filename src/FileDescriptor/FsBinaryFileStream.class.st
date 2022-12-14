"
Part of FileSystem

=========

FsBinaryFileStream is the base stream used by FileSystem. It interfaces with an FsFileDescriptor and performs the conversion from stream methods to file descriptor methods.
"
Class {
	#name : 'FsBinaryFileStream',
	#superclass : 'Object',
	#instVars : [
		'descriptor'
	],
	#gs_options : [
		'dbTransient'
	],
	#category : 'FileDescriptor'
}

{ #category : 'instance creation' }
FsBinaryFileStream class >> on: aFileDescriptor [

	^super new initialize
		descriptor: aFileDescriptor;
		yourself
]

{ #category : 'testing' }
FsBinaryFileStream >> atEnd [

	^self size == self position
]

{ #category : 'opening-closing' }
FsBinaryFileStream >> close [

	descriptor close
]

{ #category : 'testing' }
FsBinaryFileStream >> closed [

	^descriptor closed
]

{ #category : 'accessing' }
FsBinaryFileStream >> contents [
	"Return the full contents of the file."

	descriptor position: 0.
	^self upToEnd
]

{ #category : 'accessing' }
FsBinaryFileStream >> descriptor [

	^descriptor
]

{ #category : 'accessing' }
FsBinaryFileStream >> descriptor: aFileDescriptor [

	descriptor := aFileDescriptor
]

{ #category : 'writing' }
FsBinaryFileStream >> flush [
	"NOP"

	self truncate
]

{ #category : 'testing' }
FsBinaryFileStream >> isBinary [

	^true
]

{ #category : 'reading' }
FsBinaryFileStream >> next [
	"Return the next byte"

	| bytes |
	bytes := self next: 1.
	^bytes size == 0
		ifTrue: [nil]
		ifFalse: [bytes at: 1]
]

{ #category : 'reading' }
FsBinaryFileStream >> next: count [

	^descriptor read: count
]

{ #category : 'writing' }
FsBinaryFileStream >> nextPut: aByte [

	self nextPutAll: (ByteArray with: aByte)
]

{ #category : 'writing' }
FsBinaryFileStream >> nextPutAll: aByteArray [

	descriptor write: aByteArray
]

{ #category : 'reading' }
FsBinaryFileStream >> peek [
	"Return the byte at the current position."

	^descriptor peek
]

{ #category : 'positioning' }
FsBinaryFileStream >> position [

	^descriptor position
]

{ #category : 'positioning' }
FsBinaryFileStream >> position: aPosition [ 

	^descriptor position: aPosition 
]

{ #category : 'reading' }
FsBinaryFileStream >> readInto: aCollection startingAt: startIndex count: n [
	"Read n objects into the given collection. 
	Return number of elements that have been read."

	| max |
	max := (self size - self position) min: n.
	aCollection 
		replaceFrom: startIndex 
		to: startIndex + max - 1
		with: (self next: max)
		startingAt: 1.
	^ max
]

{ #category : 'positioning' }
FsBinaryFileStream >> setToEnd [

  ^descriptor setToEnd
]

{ #category : 'accessing' }
FsBinaryFileStream >> size [

	^descriptor size
]

{ #category : 'positioning' }
FsBinaryFileStream >> skip: anInteger [
	"Adjust my position by <anInteger>."

	descriptor position: descriptor position + anInteger
]

{ #category : 'writing' }
FsBinaryFileStream >> truncate [
	"Truncate the file to the current position."

	descriptor truncateTo: self position
]

{ #category : 'reading' }
FsBinaryFileStream >> upToEnd [
	"Return all bytes from the current position until the end of the file."

	^ByteArray
		new: descriptor size - self position
		streamContents:
			[:stream | | bytes |
			[bytes := descriptor read: 16384.
			stream nextPutAll: bytes.
			bytes size > 0] whileTrue]
]

{ #category : 'accessing' }
FsBinaryFileStream >> wrappedStreamName [
  "Note: This should be updated to return the actual file path."

  ^''
]
