"
I am ZnCharacterReadStream.
I wrap another binary ReadStream and use a ZnCharacerEncoder to allow Characters to be read.

I am not positionable, but I do allow a one character peek using a one character internal buffer.

Part of Zinc HTTP Components.

"
Class {
	#name : 'ZnCharacterReadStream',
	#superclass : 'ZnEncodedReadStream',
	#category : 'Zinc-Character-Encoding-Core'
}

{ #category : 'accessing' }
ZnCharacterReadStream >> collectionSpecies [
	^ String
]

{ #category : 'accessing' }
ZnCharacterReadStream >> match: subCollection [ 
	"Set the access position of the receiver to be past the next occurrence of the subCollection. Answer whether subCollection is found.  No wildcards, and case does matter."
	| pattern startMatch |
	pattern := subCollection readStream.
	startMatch := nil.
	[ pattern atEnd ] whileFalse: 
		[ self atEnd ifTrue: [ ^ false ].
		self next = pattern next 
			ifTrue: [ pattern position = 1 ifTrue: [ startMatch := self position ] ]
			ifFalse: 
				[ pattern position: 0.
				startMatch ifNotNil: 
					[ self position: startMatch.
					startMatch := nil ] ] ].
	^ true
]

{ #category : 'private' }
ZnCharacterReadStream >> nextElement [
	^ self encoder nextFromStream: stream
]

{ #category : 'accessing' }
ZnCharacterReadStream >> nextLine [
	"Read a CR, LF or CRLF terminated line, returning the contents of the line without the EOL. Return nil when the receiver is #atEnd."
	
	self atEnd ifTrue: [ ^ nil ].
	^ self collectionSpecies streamContents: [ :out |
		out nextPutAll: (self encoder decodeBytes: stream nextLine) ]
]

{ #category : 'accessing' }
ZnCharacterReadStream >> readInto: collection startingAt: offset count: requestedCount [ 
	"Read count elements and place them in collection starting at offset.
	Return the number of elements actually read."
	
	^ peeked 
		ifNil: [ | readCount |
			readCount := self encoder 
					readInto: collection 
					startingAt: offset 
					count: requestedCount 
					fromStream: stream.
			readCount ]
		ifNotNil: [ 
			collection at: offset put: peeked.
			peeked := nil.
			(self 
				readInto: collection 
				startingAt: offset + 1
				count: requestedCount - 1) + 1 ]

]

{ #category : 'accessing' }
ZnCharacterReadStream >> upToAll: aCollection [
	"Answer a subcollection from the current access position to the occurrence (if any, but not inclusive) of aCollection. If aCollection is not in the stream, answer the entire rest of the stream."
	
	^ self collectionSpecies streamContents: [ :out |
		| partialMatch pattern matched |
		partialMatch := (self collectionSpecies new: aCollection size) writeStreamPortable.
		pattern := aCollection readStreamPortable.
		matched := false.
		([ matched or: [ self atEnd or: [ pattern atEnd ] ] ]) whileFalse: [
			| ch |
			(ch := self next) = pattern next
				ifTrue: [
					pattern atEnd
						ifTrue: [ matched := true ]
						ifFalse: [ partialMatch nextPut: ch ] ]
				ifFalse: [
					pattern reset.
					out nextPutAll: partialMatch contents.
					partialMatch reset.
					out nextPut: ch ] ].
		matched ifFalse: [ out nextPutAll: partialMatch contents ] ]
]
