Class {
	#name : 'BinaryFileStream',
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
BinaryFileStream class >> on: aFileDescriptor [

	^super new initialize
		descriptor: aFileDescriptor;
		yourself
]

{ #category : 'testing' }
BinaryFileStream >> atEnd [

	^self size == self position
]

{ #category : 'opening-closing' }
BinaryFileStream >> close [

	descriptor close
]

{ #category : 'testing' }
BinaryFileStream >> closed [

	^descriptor closed
]

{ #category : 'accessing' }
BinaryFileStream >> contents [

	^ByteArray
		streamContents:
			[:stream | | bytes |
			[bytes := descriptor read: 4096.
			stream nextPutAll: bytes.
			bytes size == 4096] whileTrue]
]

{ #category : 'accessing' }
BinaryFileStream >> descriptor [

	^descriptor
]

{ #category : 'accessing' }
BinaryFileStream >> descriptor: aFileDescriptor [

	descriptor := aFileDescriptor
]

{ #category : 'writing' }
BinaryFileStream >> flush [
	"NOP"

	self truncate
]

{ #category : 'testing' }
BinaryFileStream >> isBinary [

	^true
]

{ #category : 'reading' }
BinaryFileStream >> next: count [

	^descriptor read: count
]

{ #category : 'writing' }
BinaryFileStream >> nextPut: aByte [

	self nextPutAll: (ByteArray with: aByte)
]

{ #category : 'writing' }
BinaryFileStream >> nextPutAll: aByteArray [

	descriptor write: aByteArray
]

{ #category : 'positioning' }
BinaryFileStream >> position [

	^descriptor position
]

{ #category : 'positioning' }
BinaryFileStream >> setToEnd [

  ^descriptor setToEnd
]

{ #category : 'accessing' }
BinaryFileStream >> size [

	^descriptor size
]

{ #category : 'writing' }
BinaryFileStream >> truncate [
	"Truncate the file to the current position."

	descriptor truncateTo: self position
]

{ #category : 'accessing' }
BinaryFileStream >> wrappedStreamName [
  "Note: This should be updated to return the actual file path."

  ^''
]
