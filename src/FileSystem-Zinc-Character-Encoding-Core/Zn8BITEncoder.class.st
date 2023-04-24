"
Part of FileSystem

=========

I implement the encoding and decoding of Extended ASCII (8 bit character encoding) that produces instances of class String.

The encoding is consistent with topaz 'fileformat 8BIT' (see 'Handling text outside the ASCII range' in the topaz manual for more details).
"
Class {
	#name : 'Zn8BITEncoder',
	#superclass : 'ZnCharacterEncoder',
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'accessing' }
Zn8BITEncoder class >> default [
	
	^self new
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
Zn8BITEncoder class >> newForEncoding: string stringClass: stringClass [
	"Return a new character encoder object for an encoding described by string.
	Search for a subclass that handles it and delegate (subclassResponsibility)."

	^ self new stringClass: stringClass
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

	^ self stringClass withBytes: bytes
]

{ #category : 'convenience' }
Zn8BITEncoder >> encodedByteCountForCodePoint: codePoint [
	"Return the exact number of bytes it would take to encode codePoint as a byte array"

	^codePoint < 256
		ifTrue: [1]
		ifFalse: [self errorOutsideRange]
]

{ #category : 'convenience' }
Zn8BITEncoder >> encodeString: string [
	"Encode string and return an array of bytes instance"

	({String.
	Unicode7} includes: string class)
		ifFalse: [ 
			self
				error:
					'Can only encode instances of String or Unicode7 ... single byte characters' ].
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
