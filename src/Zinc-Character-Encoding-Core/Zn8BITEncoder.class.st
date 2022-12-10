"
Part of FileSystem

=========

I implement the encoding and decoding of Extended ASCII (8 bit character encoding) that produces instances of class String.

The encoding is consistent with topaz 'fileformat 8BIT' (see section 1.3 Handling text outside the ASCII range in the topaz manual[1]  for more details).

[1] https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/GS64-Topaz-3.6.htm?https://downloads.gemtalksystems.com/docs/GemStone64/3.6.x/GS64-Topaz-3.6/1-Tutorial.htm#pgfId-1130673
"
Class {
	#name : 'Zn8BITEncoder',
	#superclass : 'ZnCharacterEncoder',
	#classVars : [
		'Default'
	],
	#category : 'Zinc-Character-Encoding-Core'
}

{ #category : 'accessing' }
Zn8BITEncoder class >> default [
	"Return a cached instance of the most commonly used encoder,
	which is faster than going via #newForEncoding: that does a subclass search"
	
	^ Default ifNil: [ Default := self new ]
]

{ #category : 'accessing' }
Zn8BITEncoder class >> handlesEncoding: string [
	"Return true when my instances handle the encoding described by string"
	
	^ (self canonicalEncodingIdentifier: string) = '8bit'
]

{ #category : 'accessing' }
Zn8BITEncoder class >> knownEncodingIdentifiers [
	^ #( #'8bit' )
]

{ #category : 'instance creation' }
Zn8BITEncoder class >> newForEncoding: string [
	"No further parametrization needed"
	
	^ self new
]

{ #category : 'converting' }
Zn8BITEncoder >> backOnStream: stream [
	"Move back one character on stream"

	stream position = 0
		ifTrue: [Error signal: 'Cannot move backward past the start of the stream.'].
	stream skip: -1
]

{ #category : 'convenience' }
Zn8BITEncoder >> decodeAsCodePoints: bytes [
	"Decode bytes and return the resulting code points"

	^ String withBytes: bytes
]

{ #category : 'convenience' }
Zn8BITEncoder >> decodeBytes: bytes [
	"Decode bytes and return the resulting string"

	^ String withBytes: bytes
]

{ #category : 'converting' }
Zn8BITEncoder >> encodedByteCountFor: character [
	"Return how many bytes are needed to encode character"
		
	^ 1
]

{ #category : 'convenience' }
Zn8BITEncoder >> encodeString: string [
	"Encode string and return the resulting Utf8 instance"
	
	^ string asByteArray
]

{ #category : 'accessing' }
Zn8BITEncoder >> identifier [
	^ #'8bit'
]

{ #category : 'converting' }
Zn8BITEncoder >> nextCodePointFromStream: stream [
	"Read and return the next integer code point from stream"

	^ stream next
]

{ #category : 'converting' }
Zn8BITEncoder >> nextFromStream: stream [
	"Read and return the next character from stream"
	
	^ Character codePoint: stream next
]

{ #category : 'converting' }
Zn8BITEncoder >> nextPutCodePoint: codePoint toStream: stream [
	"Write the encoding for Integer code point to stream"

	^ stream nextPut: (Character codePoint: codePoint)
]

{ #category : 'convenience' }
Zn8BITEncoder >> readInto: string startingAt: offset count: requestedCount fromStream: stream [
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd."

	| stringBuffer |
	stringBuffer := string.
	offset to: offset + requestedCount - 1 do: [ :index | 
		stream atEnd ifTrue: [ ^ index - offset ].  
		stringBuffer codePointAt: index put: (self nextCodePointFromStream: stream)].
	^ requestedCount
]