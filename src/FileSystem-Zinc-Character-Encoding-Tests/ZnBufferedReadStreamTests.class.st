"
Part of FileSystem

=========

I am ZnBufferedReadStreamTests.
"
Class {
	#name : 'ZnBufferedReadStreamTests',
	#superclass : 'FsTestCase',
	#category : 'FileSystem-Zinc-Character-Encoding-Tests'
}

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testBuffering [
	| stream |
	stream := ZnBufferedReadStream on: '01234567890123456789' readStreamPortable.
	stream sizeBuffer: 8.
	self deny: stream atEnd.
	self assert: (stream next: 10) equals: '0123456789'.
	self deny: stream atEnd.
	self assert: (stream next: 10) equals: '0123456789'.
	self assert: stream atEnd	

]

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testPeek [
	| stream |
	stream := ZnBufferedReadStream on: '0123456789' readStreamPortable.
	stream sizeBuffer: 8.
	'0123456789' do: [ :each |
		self deny: stream atEnd.
		self assert: stream peek equals: each.
		self assert: stream next equals: each ].
	self assert: stream atEnd.
	self assert: stream peek isNil.
	self assert: stream next isNil

]

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testReadInto [
	| stream buffer count |
	stream := ZnBufferedReadStream on: '0123456789' readStreamPortable.
	stream sizeBuffer: 8.
	buffer := (String new: 6) atAllPut: Character space; yourself.
	stream skip: 1.
	stream readInto: buffer startingAt: 4 count: 3.
	self assert: buffer equals: '   123'.
	stream readInto: buffer startingAt: 1 count: 3.
	self assert: buffer equals: '456123'.
	count := stream readInto: buffer startingAt: 1 count: 100.
	self assert: count equals: 3.
	self assert: buffer equals: '789123'	 

]

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testReadIntoLarger [
	| stream buffer count |
	stream := ZnBufferedReadStream on: '0123456789' readStreamPortable.
	stream sizeBuffer: 4.
	buffer := String new: 10.
	count := stream readInto: buffer startingAt: 1 count: 10.
	self assert: count equals: 10.
	self assert: buffer equals: '0123456789'	 

]

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testReadUpTo [
	| stream |
	stream := ZnBufferedReadStream on: '0123456789' readStreamPortable.
	stream sizeBuffer: 8.
	self assert: (stream upTo: $5) equals: '01234'.
	self assert: stream upToEnd equals: '6789'.
	self assert: stream atEnd

]

{ #category : 'testing' }
ZnBufferedReadStreamTests >> testReadUpToEnd [
	| stream |
	stream := ZnBufferedReadStream on: '0123456789' readStreamPortable.
	stream sizeBuffer: 4.
	stream next: 2.
	self assert: stream upToEnd equals: '23456789'.
	self assert: stream atEnd

]
