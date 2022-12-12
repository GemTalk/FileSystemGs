"
Part of FileSystem

=========

Test cases for ZnCharacterStream
"
Class {
	#name : 'ZnAbstractCharacterStreamTests',
	#superclass : 'TestCase',
	#category : 'Zinc-Character-Encoding-Tests'
}

{ #category : 'Testing' }
ZnAbstractCharacterStreamTests class >> isAbstract [
  "Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

  ^ self sunitName = #'ZnAbstractCharacterStreamTests'
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> assertUpTo: theArray [
	| array encodingStream |
	array := self convertStringsToStringClass: theArray.
	self assert: (array first readStream upTo: array second) equals: array third.
	encodingStream := self eightBitReadStreamOn: array first.
	self assert: (encodingStream upTo: array second) equals: array third.
	encodingStream := self utf8ReadStreamOn: array first.
	self assert: (encodingStream upTo: array second) equals: array third
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> assertUpToAll: theArray [
	| array encodingStream |
	array := self convertStringsToStringClass: theArray.
	self assert: (array first readStream upToAll: array second) equals: array third.
	encodingStream := self eightBitReadStreamOn: array first.
	self assert: (encodingStream upToAll: array second) equals: array third.
	encodingStream := self utf8ReadStreamOn: array first .
	self assert: (encodingStream upToAll: array second) equals: array third.
]

{ #category : 'private' }
ZnAbstractCharacterStreamTests >> convertStringsToStringClass: theArray [
	| literalSringClass |
	literalSringClass := '' class.
	^ theArray
		collect: [ :str | 
			str class == Character
				ifTrue: [ str ]
				ifFalse: [ 
					literalSringClass == self stringClass
						ifTrue: [ str ]
						ifFalse: [ 
							self stringClass == Unicode7
								ifTrue: [ str decodeFromUTF8 ]
								ifFalse: [ str asString ] ] ] ]
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> eightBitReadStreamOn: string [
	| bytes stream |
	bytes := Zn8BITEncoder new encodeString: string.
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream
		on: bytes readStreamPortable
		encoding: #'8bit').
	stream sizeBuffer: string size.
	^stream
]

{ #category : 'private' }
ZnAbstractCharacterStreamTests >> stringClass [
	^ self subclassResponsibility
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> test8BitEncodingStreamPosition [
	| string bytes stream res |
	string := 'eiSendeSe'.
	bytes := Zn8BITEncoder new encodeString: string.
	stream := (ZnCharacterReadStream on: bytes readStreamPortable).
	res := stream next; next; next.
	self assert: res equals: $S.
	self assert: stream position equals: 3.
	
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testNextLine [
	| stream |
	stream := ZnCharacterReadStream on: 'abc' asByteArray readStreamPortable.
	self assert: stream nextLine equals: 'abc'.
	self assert: stream nextLine  equals: nil.
	stream := ZnCharacterReadStream on: '' asByteArray readStreamPortable.
	self assert: stream nextLine equals: nil.
	stream := ZnCharacterReadStream on: (String withAll: { 
		$a. Character cr. 
		$b. Character lf. 
		$c }) asByteArray readStreamPortable.
	self assert: stream nextLine equals: 'a'.
	self assert: stream nextLine equals: 'b'.
	self assert: stream nextLine equals: 'c'.
	self assert: stream nextLine equals: nil.
	stream := ZnCharacterReadStream on: (String withAll:{ 
		$a. Character cr. Character lf.  
		$b. Character cr. Character lf. 
		$c. Character cr. Character lf }) asByteArray readStreamPortable.
	self assert: stream nextLine equals: 'a'.
	self assert: stream nextLine equals: 'b'.
	self assert: stream nextLine equals: 'c'.
	self assert: stream nextLine equals: nil.
	stream := ZnCharacterReadStream on: (String withAll: { 
		$a. Character cr. Character lf.  
		Character cr. Character lf. 
		$c. Character cr. Character lf }) asByteArray readStreamPortable.
	self assert: stream nextLine equals: 'a'.
	self assert: stream nextLine equals: ''.
	self assert: stream nextLine equals: 'c'.
	self assert: stream nextLine equals: nil.
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testPeek [
	| string bytes readStream |
	string := 'élève en Français'.
	bytes := ZnUTF8Encoder new encodeString: string.
	readStream := ZnBufferedReadStream on: (ZnCharacterReadStream on: bytes readStreamPortable).
	self assert: readStream peek equals: 'é' first.
	self assert: readStream peek equals: 'é' first.
	self assert: readStream next equals: 'é' first.
	readStream skip: 'lève ' size.
	self assert: readStream peek equals: $e.
	self assert: (readStream next: 'en Français' size) equals: 'en Français'
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testReadStream [
	| stream |
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream on: 'ABC' asByteArray readStreamPortable).
	stream sizeBuffer: 3.
	self deny: stream atEnd.
	self deny: stream isBinary.
	self assert: stream next = $A.
	self deny: stream atEnd.
	self assert: stream peek = $B.
	self deny: stream atEnd.
	self assert: stream peek = $B.
	self deny: stream atEnd.
	self assert: stream next = $B.
	self deny: stream atEnd.
	self assert: stream next = $C.
	self assert: stream atEnd.
	self assert: stream next isNil.
	self assert: stream peek isNil
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testReadUpTo [
	| string |
	string := '0123456789'.
	{(self eightBitReadStreamOn: string).
	(self utf8ReadStreamOn: string)}
		do: [ :stream | 
			self assert: (stream upTo: $5) equals: '01234'.
			self assert: stream upToEnd equals: '6789'.
			self assert: stream atEnd ]
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testSimpleUTF8ReadStream [
	| string bytes stream |
	string := 'élève en Français'.
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream on: bytes readStreamPortable).
	stream sizeBuffer: string size.
	self 
		assert:stream upToEnd
		equals: string
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testSimpleUTF8WriteStream [
	| string bytes stream |
	string := 'élève en Français'.
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := (ZnCharacterWriteStream on: ByteArray new writeStreamPortable).
	stream nextPutAll: string.
	self 
		assert: stream wrappedStream contents
		equals: bytes asByteArray
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testUpTo [
	| char1 char2 string1 string2 |
  char1 := (Character codePoint: 257). 
	string1 := '', char1. "DoubleByteString"
	char2 := (Character codePoint:16rffff1).
	string2 :=  '', char2. "QuadByteString"
	{
		"extended ASCII String"
		{''     . $ß . ''   } .
		{'ß'    . $ß . ''   } .
		{'ße'   . $ß . ''   } .
		{'ß'    . $e . 'ß'  } .
		{'ße'   . $e . 'ß'  } .
		{'ßen'  . $e . 'ß'  } .
		{'ißen' . $e . 'iß' } .
		{'iß'   . $ß . 'i'  } .
		{'iße'  . $ß . 'i'  } .

		"DoubleByteString"
		{''                 . char1 . ''           } .
		{string1            . char1 . ''           } .
		{(string1, 'e')     . char1 . ''           } .
		{string1            . $e    . string1      } .
		{(string1, 'e')     . $e    . string1      } .
		{(string1, 'en')    . $e    . string1      } .
		{'i', string1, 'en' . $e    . 'i', string1 } .
		{'i', string1       . char1 . 'i'          } .
		{'i', string1, 'e'  . char1 . 'i'          } .

		"QuadByteString"
		{''                 . char2 . ''           } .
		{string2            . char2 . ''           } .
		{(string2, 'e')     . char2 . ''           } .
		{string2            . $e    . string2      } .
		{(string2, 'e')     . $e    . string2      } .
		{(string2, 'en')    . $e    . string2      } .
		{'i', string2, 'en' . $e    . 'i', string2 }.
		{'i', string2       . char2 . 'i'          } .
		{'i', string2, 'e'  . char2 . 'i'          } .

		"ASCII String"
		{'a'   . $a . ''    } .
		{'a'   . $b . 'a'   } .
		{'ab'  . $a . ''    } .
		{'ab'  . $b . 'a'   } .
		{'ab'  . $c . 'ab'  } .
		{'abc' . $a . ''    } .
		{'abc' . $b . 'a'   } .
		{'abc' . $c . 'ab'  } .
		{'abc' . $d . 'abc' } .
	} do: [ :array | self assertUpTo: array ]
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testUpToAll [
	#(
		('' '' '')
		('a' '' '')
		('a' 'a' '')
		('a' 'b' 'a')
		('ab' '' '')
		('ab' 'a' '')
		('ab' 'b' 'a')
		('ab' 'c' 'ab')
		('ab' 'ab' '')
		('abc' '' '')
		('abc' 'a' '')
		('abc' 'b' 'a')
		('abc' 'c' 'ab')
		('abc' 'd' 'abc')
		('abc' 'ab' '')
		('abc' 'bc' 'a')
		('abc' 'cd' 'abc')
		('' 'ß' '')
		('' 'ße' '')
		('ß' '' '')
		('ße' '' '')
		('ß' 'ß' '')
		('ße' 'ß' '')
		('ß' 'ße' 'ß')
		('ß' 'e' 'ß')
		('ße' 'e' 'ß')
		('ßen' 'e' 'ß')
		('ßen' 'en' 'ß')
		('ßend' 'en' 'ß')
		('iße' 'e' 'iß')
		('ißen' 'e' 'iß')
		('ißen' 'en' 'iß')
		('ißend' 'en' 'iß')
		('iß' 'ß' 'i')
		('iße' 'ß' 'i')
		('eißen' 'ße' 'ei')
		('eißen' 'ßend' 'eißen')
		('eißendeße' 'ße' 'ei')
		('abcdefgh' 'cd' 'ab')
	) do: [ :array | self assertUpToAll: array ]
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testUpToAllTwice [
	| string utf8Stream stream eightBitStream a b |

	string := 'eißendeße'.
	stream :=  string readStreamPortable.
	eightBitStream := self eightBitReadStreamOn: string.
	utf8Stream := self utf8ReadStreamOn: string.

	self assert: (stream upToAll: 'ße') equals: 'ei'.
	self assert: (eightBitStream upToAll: 'ße') equals: 'ei'.
	self assert: (utf8Stream upToAll: 'ße') equals: 'ei'.

	self assert: (stream upToAll: 'ße') equals: 'nde'.
	self assert: (eightBitStream upToAll: 'ße') equals: 'nde'.
	self assert: (utf8Stream upToAll: 'ße') equals: 'nde'.

	a := 'ABC', (Character codePoint: 128), (Character codePoint: 255).
	b := '', (Character codePoint: 150), (Character codePoint: 192), (Character codePoint: 224).
	eightBitStream := self eightBitReadStreamOn: ( a, '123', b, '123').
	self assert: (eightBitStream upToAll: '123') equals: a.
	self assert: (eightBitStream upToAll: '123') equals: b

]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testUtf8EncodingStreamPosition [
	| string bytes stream res |
	string := 'eißendeße'.
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := (ZnCharacterReadStream on: bytes readStreamPortable).
	res := stream next; next; next.
	self assert: res equals: $ß.
	self assert: stream position equals: 3.
	
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> testUTF8ReadStreamReadInto [
	| string bytes stream buffer |
	string := 'élève en Français'.
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream on: bytes readStreamPortable).
	stream sizeBuffer: string size.
	buffer := String new: string size.
	stream next: string size into: buffer. 
	self assert: buffer equals: string.
	self assert: stream atEnd.
	string := 'Czech in Czech is ', 269 asCharacter asString ,'e', 353 asCharacter asString , 'tina.'.
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream on: bytes readStreamPortable).
	stream sizeBuffer: string size.
	buffer := String new: string size.
	stream next: string size into: buffer. 
	self assert: buffer equals: string.
	self assert: stream atEnd
]

{ #category : 'testing' }
ZnAbstractCharacterStreamTests >> utf8ReadStreamOn: string [
	| bytes stream |
	bytes := ZnUTF8Encoder new encodeString: string.
	stream := ZnBufferedReadStream on: (ZnCharacterReadStream
		on: bytes readStreamPortable
		encoding: #utf8
		stringClass: self stringClass).
	stream sizeBuffer: string size.
	^stream
]
