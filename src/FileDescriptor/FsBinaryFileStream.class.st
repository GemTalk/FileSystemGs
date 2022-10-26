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

	^ByteArray
		streamContents:
			[:stream | | bytes |
			[bytes := descriptor read: 4096.
			stream nextPutAll: bytes.
			bytes size == 4096] whileTrue]
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

	^(self next: 1) at: 1
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

{ #category : 'positioning' }
FsBinaryFileStream >> position [

	^descriptor position
]

{ #category : 'positioning' }
FsBinaryFileStream >> setToEnd [

  ^descriptor setToEnd
]

{ #category : 'accessing' }
FsBinaryFileStream >> size [

	^descriptor size
]

{ #category : 'writing' }
FsBinaryFileStream >> truncate [
	"Truncate the file to the current position."

	descriptor truncateTo: self position
]

{ #category : 'accessing' }
FsBinaryFileStream >> wrappedStreamName [
  "Note: This should be updated to return the actual file path."

  ^''
]