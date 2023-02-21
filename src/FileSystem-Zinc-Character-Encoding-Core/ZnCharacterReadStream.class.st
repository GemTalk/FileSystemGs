"
Part of FileSystem

=========

I am ZnCharacterReadStream.
I wrap another binary ReadStream and use a ZnCharacerEncoder to allow Characters to be read.

I am not positionable, but I do allow a one character peek using a one character internal buffer.

Part of Zinc HTTP Components.
"
Class {
	#name : 'ZnCharacterReadStream',
	#superclass : 'ZnEncodedReadStream',
	#instVars : [
		'stringClass'
	],
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'instance creation' }
ZnCharacterReadStream class >> on: wrappedStream encoding: encoding stringClass: stringClass [
	^ self new
		on: wrappedStream;
		encoding: encoding;
		stringClass: stringClass;
		yourself
]

{ #category : 'accessing' }
ZnCharacterReadStream >> collectionSpecies [
	^ self stringClass
]

{ #category : 'accessing' }
ZnCharacterReadStream >> encoder [
	^ encoder ifNil: [ encoder := super encoder stringClass: self stringClass ]
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
	"Answer next line (may be empty) without line end delimiters, or nil if at end.
		Leave the stream positioned after the line delimiter(s).
		Handle a zoo of line delimiters CR, LF, or CR-LF pair"

	| cr lf chrcls result ch |
	self atEnd
		ifTrue: [ ^ nil ].
	cr := (chrcls := Character) cr.
	lf := chrcls lf.
	result := self collectionSpecies new.
	[ 
	ch := self next.
	(ch == cr or: [ ch == lf ])
		ifTrue: [ 
			ch == cr
				ifTrue: [ self peekFor: lf ].
			^ result ].
	result add: ch.
	self atEnd ] whileFalse.
	^ result
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
ZnCharacterReadStream >> stringClass [
	^ stringClass ifNil: [ stringClass := String ]
]

{ #category : 'accessing' }
ZnCharacterReadStream >> stringClass: object [
	stringClass := object
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
