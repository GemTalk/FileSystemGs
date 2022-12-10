Class {
	#name : 'ZnUTF8CharacterEncoderTests',
	#superclass : 'ZnCharacterEncoderTests',
	#category : 'Zinc-Character-Encoding-Tests'
}

{ #category : 'private' }
ZnUTF8CharacterEncoderTests >> _encoder [

	^ ZnUTF8Encoder new
]

{ #category : 'private' }
ZnUTF8CharacterEncoderTests >> _encoderId [
	^ #utf8
]

{ #category : 'private' }
ZnUTF8CharacterEncoderTests >> _sourceClass [
	^ Unicode7
]

{ #category : 'private' }
ZnUTF8CharacterEncoderTests >> decodeBytes: bytes with: encoder [
	| input |
	input := bytes readStream.
	^ String streamContents: [ :stream |
		[ input atEnd ] whileFalse: [ 
			stream nextPut: (encoder nextFromStream: input) ] ]
]
