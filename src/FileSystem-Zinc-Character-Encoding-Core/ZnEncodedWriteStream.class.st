"
Part of FileSystem

=========

I am ZnEncodedWriteStream, an abstract support class for write streams on a binary encoded wrapped stream.

Part of Zinc HTTP Components
"
Class {
	#name : 'ZnEncodedWriteStream',
	#superclass : 'ZnEncodedStream',
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'writing' }
ZnEncodedWriteStream >> << collection [
	^ self nextPutAll: collection
]

{ #category : 'closing' }
ZnEncodedWriteStream >> close [

	self flush.
	^super close
]

{ #category : 'writing' }
ZnEncodedWriteStream >> flush [
	stream flush
]

{ #category : 'testing' }
ZnEncodedWriteStream >> isBinary [
	^ false
]

{ #category : 'writing' }
ZnEncodedWriteStream >> next: count putAll: collection [	
	self 
		next: count 
		putAll: collection 
		startingAt: 1
]

{ #category : 'writing' }
ZnEncodedWriteStream >> next: count putAll: collection startingAt: offset [
	"Write count items from collection starting at offset.
	This is an inefficient abstract implementation writing one by one."
	
	0 to: count - 1 do: [ :each | 
		self nextPut: (collection at: offset + each) ]
]

{ #category : 'writing' }
ZnEncodedWriteStream >> nextPut: anObject [
	self subclassResponsibility
]

{ #category : 'writing' }
ZnEncodedWriteStream >> nextPutAll: collection [

	stream nextPutAll: (self encoder encodeString: collection)
]

{ #category : 'writing' }
ZnEncodedWriteStream >> nextPutAllBytes: aCharacterCollection [

	"See Stream>>#nextPutAllBytes: comment.
	Alias for #nextPutAll:"

	^self nextPutAll: aCharacterCollection
]
