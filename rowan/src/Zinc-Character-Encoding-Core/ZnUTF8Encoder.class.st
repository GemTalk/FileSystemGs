"
I am the GemStone/S implementation of ZnUTF8Encoder.
I implement the variable length UTF-8 encoding and decoding of Unicode according to RFC 3629.

Wikipedia reference http://en.wikipedia.org/wiki/UTF-8

Part of Zinc HTTP Components.

I use the ICU library to encode strings and decode ByteArray and Utf8 instances ... 
"
Class {
	#name : 'ZnUTF8Encoder',
	#superclass : 'Object',
	#classVars : [
		'Default'
	],
	#category : 'Zinc-Character-Encoding-Core'
}

{ #category : 'accessing' }
ZnUTF8Encoder class >> default [
	"Return a cached instance of the most commonly used encoder,
	which is faster than going via #newForEncoding: that does a subclass search"
	
	^ Default ifNil: [ Default := self new ]
]

{ #category : 'instance creation' }
ZnUTF8Encoder class >> newForEncoding: string [
	"No further parametrization needed"
	
	^ self new
]

{ #category : 'convenience' }
ZnUTF8Encoder >> decodeBytes: bytes [
	"Decode bytes and return the resulting string"

	^ bytes decodeFromUTF8
]

{ #category : 'convenience' }
ZnUTF8Encoder >> encodeString: string [
	"Encode string and return the resulting Utf8 instance"
	
	^ string encodeAsUTF8
]

{ #category : 'accessing' }
ZnUTF8Encoder >> identifier [
	^ #utf8
]
