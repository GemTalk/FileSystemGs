Class {
	#name : 'Zn8BITCharacterEncoderTests',
	#superclass : 'ZnAbstractCharacterEncoderTests',
	#category : 'FileSystem-Zinc-Character-Encoding-Tests'
}

{ #category : 'private' }
Zn8BITCharacterEncoderTests >> _encoder [
	^ Zn8BITEncoder new stringClass: self _sourceClass
]

{ #category : 'private' }
Zn8BITCharacterEncoderTests >> _encoderId [
	^ #'8bit'
]

{ #category : 'private' }
Zn8BITCharacterEncoderTests >> decodeBytes: bytes with: encoder [
	| input |
	input := bytes readStream.
	^ String streamContents: [ :stream |
		[ input atEnd ] whileFalse: [ 
			stream nextPut: (encoder nextFromStream: input) ] ]
]

{ #category : 'testing' }
Zn8BITCharacterEncoderTests >> testByteEncoding [
	| encoder bytes string |
	encoder := self _encoder.
	string := '123AbC', (Character codePoint: 128), (Character codePoint: 255), (Character codePoint: 150), (Character codePoint: 192), (Character codePoint: 224).
	bytes := encoder encodeString: string. 
	self assert: (bytes decodeWith: encoder) equals: (encoder decodeBytes: bytes).
	self assert: (bytes decodeWith: self _encoderId) equals: (encoder decodeBytes: bytes).
	self assert: (String withBytes: bytes) equals: string.
	self assert: string asByteArray equals: bytes.
]
