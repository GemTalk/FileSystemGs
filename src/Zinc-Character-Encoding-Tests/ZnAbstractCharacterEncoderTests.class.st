"
Part of FileSystem

=========

Test cases for character encoding
"
Class {
	#name : 'ZnAbstractCharacterEncoderTests',
	#superclass : 'TestCase',
	#category : 'Zinc-Character-Encoding-Tests'
}

{ #category : 'accessing' }
ZnAbstractCharacterEncoderTests class >> asciiCharacterSource [
	^ ($A to: $Z), ($a to: $z), ($0 to: $9), '.-_/*+=|,;?!$&<>^%#', '    '
]

{ #category : 'Testing' }
ZnAbstractCharacterEncoderTests class >> isAbstract [
  "Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

  ^ self sunitName = #'ZnAbstractCharacterEncoderTests'
]

{ #category : 'accessing' }
ZnAbstractCharacterEncoderTests class >> latin1CharacterSource [
	^ ($A to: $Z), ($a to: $z), ($0 to: $9), '.-_/*+=|,;?!$&<>^%#', '       ', 'éèçüäßñ'
]

{ #category : 'accessing' }
ZnAbstractCharacterEncoderTests class >> stringOfSize: size fromSource: source [
	"self stringOfSize: 1024 fromSource: self unicodeCharacterSource"
	
	^ String new: size streamContents: [ :out | 
		size timesRepeat: [ out nextPut: source atRandom ] ]
]

{ #category : 'accessing' }
ZnAbstractCharacterEncoderTests class >> unicodeCharacterSource [
	^ ($A to: $Z), ($a to: $z), ($0 to: $9), '.-_/*+=|,;?!$&<>^%#', '         ', 'éèçüäßñα', '€∏'
]

{ #category : 'private' }
ZnAbstractCharacterEncoderTests >> _encoderId [
		self subclassResponsibility
]

{ #category : 'private' }
ZnAbstractCharacterEncoderTests >> _sourceClass [
	^ String isInUnicodeComparisonMode
		ifTrue: [ Unicode7 ]
		ifFalse: [ String ]
]

{ #category : 'public' }
ZnAbstractCharacterEncoderTests >> assert: anObject unicodeEquals: otherObj [
	"allow comparison of unicode and legacy strings"

	self
		assert: (anObject _unicodeEqual: otherObj)
		description: anObject printString , ' is not equal to ' , otherObj printString.	
]

{ #category : 'public' }
ZnAbstractCharacterEncoderTests >> assertCharacterCollection: anObject equals: otherObj [
	"allow comparison between unitcode and legacy strings in legacy mode"

	self
		assert: (anObject isEquivalent: otherObj)
		description: anObject printString , ' is not equal to ' , otherObj printString.
]

{ #category : 'private' }
ZnAbstractCharacterEncoderTests >> decodeBytes: bytes with: encoder [
	self subclassResponsibility
]

{ #category : 'private' }
ZnAbstractCharacterEncoderTests >> encodeString: string with: encoder [
"
	^ ByteArray streamContents: [ :stream |
		stream nextPutAll: string encodeAsUTF8 ]
"

	^ ByteArray streamContents: [ :stream |
		string do: [ :each |
			encoder nextPut: each toStream: stream ] ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testCodePointEncodingDecoding [
	| encoder input output |
	input := {}.
	'Düsseldorf Königsallee' do: [:each | input add: each codePoint ].
	self assert: input isCollection.
	self assert: (input allSatisfy: [:each | each _isInteger ]).
	#(utf8 ) do: [ :each |
		encoder := each asZnCharacterEncoder.
		output := encoder encodeCodePoints: input.
		self assert: output isCollection.
		self assert: (output allSatisfy: [ :e | e _isInteger and: [ e between: 0 and: 255 ] ] ).
		self assert: (encoder encodedByteCountForCodePoints: input) equals: output size.
		self assert: (encoder decodeAsCodePoints: output) equals: input ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testConvencienceMethods [
	| encoder string |
	encoder := ZnUTF8Encoder new.
	string := 'élève en Français'.
	self assertCharacterCollection: (encoder decodeBytes: (encoder encodeString: string)) equals: string.
	self assert: (encoder encodedByteCountForString: string) = 20.
	
	#( 'ccc' 'ççç' 'c' 'ç' 'çc' 'cç' ) do: [ :each |
		self assertCharacterCollection: (encoder decodeBytes: (encoder encodeString: each)) equals: each ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testKnownEncodingIdentifiers [
	| all minimal asciiString |
	all := ZnCharacterEncoder knownEncodingIdentifiers asSet.
	minimal := #(utf8) asSet.
	"make sure at least a minimal set is present"
	self assert: (all  select: [ :each | minimal includes: each ]) equals: minimal.
	asciiString := String withAll: ((($a asciiValue to: $z asciiValue) , 
		($A asciiValue to: $Z asciiValue) , ($0 asciiValue to: $9 asciiValue)) collect: [:each | Character codePoint: each ]).
	"make sure that each identifier can be used to instanciate a decoder,
	and that those decoders at least work on a ASCII string in both directions"
	all do: [ :each |
		| encoder bytes |
		encoder := ZnCharacterEncoder newForEncoding: each.
		bytes := encoder encodeString: asciiString.
		self assert: ((encoder decodeBytes: bytes) isEquivalent: asciiString) ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testNextPutAllStartingAtToStream [
	| encoder |
	encoder := ZnUTF8Encoder new.
	#( 'ccc' 'ççç' 'c' 'ç' 'çc' 'cç' 'çç' ) do: [ :each |
		#( ( '' '' ) ( 'ABC' '' ) ( '' 'ABC' ) ( 'ABC' 'ABC' ) 
			( 'AéC' '' ) ( '' 'AèC' ) ( 'AéC' 'AèC' ) 
			( 'AXC' 'AèC' ) ( 'AéC' 'AXC' ) 
			( 'PRE' 'ç' ) ) do: [ :extra |
				| prefix postfix string bytes |
				prefix := extra first.
				postfix := extra last.
				string := prefix, each, postfix.
				bytes := ByteArray streamContents: [ :out |
					encoder next: each size putAll: string startingAt: prefix size + 1 toStream: out ].
				self assertCharacterCollection: (encoder decodeBytes: bytes) equals: each ] ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testReadIntoStartingAtCountFromStream [
	| encoder |
	encoder := ZnUTF8Encoder new.
	#( 'ccc' 'ççç' 'c' 'ç' 'çc' 'cç' 'çç' ) do: [ :each |
		#( ( '' '' ) ( 'ABC' '' ) ( '' 'ABC' ) ( 'ABC' 'ABC' ) 
			( 'AéC' '' ) ( '' 'AèC' ) ( 'AéC' 'AèC' ) 
			( 'AXC' 'AèC' ) ( 'AéC' 'AXC' ) 
			( 'PRE' 'ç' ) ) do: [ :extra |
				| prefix postfix string bytes buffer read |
				prefix := extra first.
				postfix := extra last.
				string := prefix, each.
				bytes := encoder encodeString: string, postfix.
				buffer := String new: string size.
				read := encoder readInto: buffer startingAt: 1 count: string size fromStream: bytes readStream.
				self assert: buffer equals: string.
				self assert: read equals: string size ] ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testReadIntoStartingAtCountFromStreamAtEnd [
	| input encoder bytes readStream string read |
	encoder := ZnUTF8Encoder new.
	input := 'élève'.
	bytes := encoder encodeString: input.
	readStream := bytes readStream.
	string := (String new: 5) atAllPut: $_; yourself.
	read := encoder readInto: string startingAt: 1 count: 10 fromStream: readStream.
	self assert: string equals: input.
	self assert: read equals: 5
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testReadIntoStartingAtCountFromStreamWithOffset [
	| input encoder bytes readStream string read |
	encoder := ZnUTF8Encoder new.
	input := '_élève_'.
	bytes := encoder encodeString: input.
	readStream := bytes readStream.
	readStream next.
	string := (String new: 7) atAllPut: $_; yourself.
	read := encoder readInto: string startingAt: 2 count: 5 fromStream: readStream.
	self assertCharacterCollection: string equals: input.
	self assert: read equals: 5.
	input := '_Français_'.
	bytes := encoder encodeString: input.
	readStream := bytes readStream.
	readStream next.
	string := (String new: 10) atAllPut: $_; yourself.
	read := encoder readInto: string startingAt: 2 count: 8 fromStream: readStream.
	self assert: string equals: input.
	self assert: read equals: 8
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testStringEncoding [
	| encoder string |
	encoder := ZnUTF8Encoder new.
	string := 'élève en Français'.
	self assert: (string encodeWith: encoder) equals: (encoder encodeString: string).
	self assert: (string encodeWith: #utf8) equals: (encoder encodeString: string).
	self assert: string encodeAsUTF8 asByteArray equals: (encoder encodeString: string)

]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8Back [
	| encoder stream |
	encoder := ZnUTF8Encoder new.
	stream := (encoder encodeString: 'Les élèves Françaises') readStream.
	self should: [ encoder backOnStream: stream ] raise: Error.
	4 timesRepeat: [ encoder nextFromStream: stream ].
	self assert: (encoder nextFromStream: stream) equals: $é.
	encoder backOnStream: stream.
	self assert: (encoder nextFromStream: stream) equals: $é.
	10 timesRepeat: [ encoder nextFromStream: stream ].
	13 timesRepeat: [ encoder backOnStream: stream ].
	self assert: (encoder nextFromStream: stream) equals: $s
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8Boundaries [
	"Test encoding and decoding of the characters at the boundaries between 1, 2, 3, and 4 multi-byte sequences.
	Values taken from http://en.wikipedia.org/wiki/Utf8#Description with the new RFC 3629 limit"
	
	| utf8Encoder string encoded |
	utf8Encoder := ZnUTF8Encoder new.
	#( (0 16r7f) 
		(16r80 16r07FF) 
		(16r0800 16rFFFF) 
		(16r10000 16r10FFFF) 
	) doWithIndex: [ :boundaries :byteCount |
		boundaries do: [ :each |
			string := String with: each asCharacter.
			encoded := utf8Encoder encodeString: string. 
			self assertCharacterCollection: (utf8Encoder decodeBytes: encoded) equals: string.
			self assert: encoded size equals: byteCount ] ]
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8Encoder [
	"The examples are taken from http://en.wikipedia.org/wiki/UTF-8#Description"
	
	| encoder inputBytes outputBytes inputString outputString |
	encoder := ZnUTF8Encoder new.
	inputString := String with: $$ with: (16r00A2 asCharacter) with: (16r20AC asCharacter) with: (16r024B62 asCharacter).
	inputBytes := #(16r24 16rC2 16rA2 16rE2 16r82 16rAC 16rF0 16rA4 16rAD 16rA2) asByteArray.
	outputBytes := self encodeString: inputString with: encoder.
	self assert: outputBytes = inputBytes.
	outputString := self decodeBytes: inputBytes with: encoder.
	self assertCharacterCollection: outputString equals: inputString
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8EncoderAuto [
	| encoder inputString bytes outputString |
	encoder := ZnUTF8Encoder new.
	inputString := String withAll: ((1 to: 3072) collect: [ :each | Character codePoint: each ]).
	bytes := self encodeString: inputString with: encoder. 
	outputString := self decodeBytes: bytes with: encoder.
	self assertCharacterCollection: inputString equals: outputString
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8EncoderByteCount [	
	| encoder |
	encoder := ZnUTF8Encoder new.
	self assert: (encoder encodedByteCountFor: $$) = 1.
	self assert: (encoder encodedByteCountFor: (16r00A2 asCharacter)) = 2.
	self assert: (encoder encodedByteCountFor: (16r20AC asCharacter)) = 3.
	self assert: (encoder encodedByteCountFor: (16r024B62 asCharacter)) = 4
]

{ #category : 'testing' }
ZnAbstractCharacterEncoderTests >> testUTF8EncoderWide [
	| encoder |
	encoder := ZnUTF8Encoder new.
	{ 'abc'. 'élève en Français'. 'Pra-ská' copy at: 4 put: (Character codePoint: 382); yourself. '' }
		do: [ :each | | bytes |
			bytes := self encodeString: each with: encoder. 
			self assertCharacterCollection: (encoder decodeBytes: bytes) equals: each ]
]
