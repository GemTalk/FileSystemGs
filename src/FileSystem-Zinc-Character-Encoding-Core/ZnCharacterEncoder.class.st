"
Part of FileSystem

=========

I am ZnCharacterEncoder, I encode and decode Character objects to and from a binary stream.
I am an abstract class with following protocol:

#nextFromStream:
#nextPut:toStream:
#encodedByteCountFor:
#backOnStream:

I add some convenience methods:

#encodeString:
#decodeBytes:
#encodedByteCountForString:

I also implement optimized bulk operations:

#next:putAll:startingAt:toStream:
#readInto:startingAt:count:fromStream:

Additionally, I can encode Integer code points to a binary stream as well as read Integer code points from a binary stream. This is in a sense a more fundamental operation that avoids instantiating Character objects.

#nextCodePointFromStream:
#nextPutCodePoint:toStream:
#encodedByteCountForCodePoint:

#decodeAsCodePoints:
#encodeCodePoints:
#encodedByteCountForCodePoints:

Part of Zinc HTTP Components.
"
Class {
	#name : 'ZnCharacterEncoder',
	#superclass : 'Object',
	#instVars : [
		'stringClass'
	],
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'accessing' }
ZnCharacterEncoder class >> canonicalEncodingIdentifier: string [
	^ (string select: [ :each | each isAlphaNumeric ]) asLowercase
]

{ #category : 'accessing' }
ZnCharacterEncoder class >> handlesEncoding: string [
	"Return true when my instances handle the encoding described by string"
	
	self subclassResponsibility: #handlesEncoding:
]

{ #category : 'accessing' }
ZnCharacterEncoder class >> knownEncodingIdentifiers [
	"Return a collection of all known encoding identifiers in the system"
	
	self = ZnCharacterEncoder ifFalse: [ ^ #() ].
	^ Array streamContents: [ :all |
		self allSubclasses do: [ :subClass |
			all nextPutAll: subClass knownEncodingIdentifiers ] ]
]

{ #category : 'instance creation' }
ZnCharacterEncoder class >> newForEncoding: string [
	"Return a new character encoder object for an encoding described by string.
	Search for a subclass that handles it and delegate (subclassResponsibility)."

	^ self
		newForEncoding: string
		stringClass:
			(String isInUnicodeComparisonMode
				ifTrue: [ Unicode7 ]
				ifFalse: [ String ])
]

{ #category : 'instance creation' }
ZnCharacterEncoder class >> newForEncoding: string stringClass: stringClass [
	"Return a new character encoder object for an encoding described by string.
	Search for a subclass that handles it and delegate (subclassResponsibility)."
	
	| concreteSubclass |
	concreteSubclass := self allSubclasses 
		detect: [ :each | each handlesEncoding: string ] 
		ifNone: [ ^ self error: 'The ', string printString, ' is not currently supported.' ].
	^ concreteSubclass newForEncoding: string stringClass: stringClass
]

{ #category : 'comparing' }
ZnCharacterEncoder >> = anEncoder [

	^self class == anEncoder class and: [self stringClass == anEncoder stringClass]
]

{ #category : 'converting' }
ZnCharacterEncoder >> asZnCharacterEncoder [
	^ self
]

{ #category : 'converting' }
ZnCharacterEncoder >> backOnStream: stream [
	"Move back one character on stream, assuming stream understands #back"
	
	self subclassResponsibility: #backOnStream:
]

{ #category : 'convenience' }
ZnCharacterEncoder >> decodeAsCodePoints: bytes [
	"Decode bytes and return the resulting code points"
	
	self subclassResponsibility: #decodeAsCodePoints:
]

{ #category : 'convenience' }
ZnCharacterEncoder >> decodeBytes: bytes [
	"Decode bytes and return the resulting string"

	| byteStream |
	byteStream := bytes readStream.
	^ String
		streamContents: [ :stream | 
			[ byteStream atEnd ]
				whileFalse: [ stream nextPut: (self nextFromStream: byteStream) ] ]
]

{ #category : 'convenience' }
ZnCharacterEncoder >> encodeCodePoints: codePoints [
	"Encode codePoints and return the resulting byte array"
	
	^ self subclassResponsibility: #encodeCodePoints:
]

{ #category : 'converting' }
ZnCharacterEncoder >> encodedByteCountFor: character [
	"Return how many bytes are needed to encode character"
	
	"We should use #codePoint but #asInteger is faster"
	
	^ self encodedByteCountForCodePoint: character asInteger
]

{ #category : 'convenience' }
ZnCharacterEncoder >> encodedByteCountForCodePoint: codePoint [
	"Return the exact number of bytes it would take to encode codePoint as a byte array"

	self subclassResponsibility
]

{ #category : 'convenience' }
ZnCharacterEncoder >> encodedByteCountForCodePoints: codePoints [
	"Return the exact number of bytes it would take to encode codePoints as a byte array"

	^ codePoints 
		inject: 0 
		into: [ :sum :each |
			sum + (self encodedByteCountForCodePoint: each) ]
]

{ #category : 'convenience' }
ZnCharacterEncoder >> encodedByteCountForString: string [
	"Return the exact number of bytes it would take to encode string as a byte array"

	^self subclassResponsibility: #encodedByteCountForCodePoints:
]

{ #category : 'handling errors' }
ZnCharacterEncoder >> error: messageString [
	"Raises an error.  This method is intended for use in raising
 application-defined or user-defined errors. Returns the receiver."

	^ ZnCharacterEncodingError signal: messageString
]

{ #category : 'handling errors' }
ZnCharacterEncoder >> errorOutsideRange [

	^ self error: 'Character code point outside encoder range'
]

{ #category : 'hashing' }
ZnCharacterEncoder >> hash [

	^self class hash bitXor: stringClass hash
]

{ #category : 'accessing' }
ZnCharacterEncoder >> maximumUTFCode [
	^ 16r10FFFF
]

{ #category : 'convenience' }
ZnCharacterEncoder >> next: count putAll: string startingAt: offset toStream: stream [
	"Write count characters from string starting at offset to stream."
	
	offset to: offset + count - 1 do: [ :index | 
		self nextPut: (string at: index) toStream: stream ]
]

{ #category : 'converting' }
ZnCharacterEncoder >> nextCodePointFromStream: stream [
	"Read and return the next integer code point from stream"
	
	self subclassResponsibility: #nextCodePointFromStream:
]

{ #category : 'converting' }
ZnCharacterEncoder >> nextFromStream: stream [
	"Read and return the next character from stream"
	
	^ Character codePoint: (self nextCodePointFromStream: stream)
]

{ #category : 'converting' }
ZnCharacterEncoder >> nextPut: character toStream: stream [
	"Write the encoding for character to stream"
	
	"We should use #codePoint but #asInteger is faster"
	
	self nextPutCodePoint: character asInteger toStream: stream
]

{ #category : 'accessing' }
ZnCharacterEncoder >> stringClass [
	^ stringClass
		ifNil: [ 
			stringClass := String isInUnicodeComparisonMode
				ifTrue: [ Unicode7 ]
				ifFalse: [ String ] ]
]

{ #category : 'accessing' }
ZnCharacterEncoder >> stringClass: object [
	stringClass := object
]
