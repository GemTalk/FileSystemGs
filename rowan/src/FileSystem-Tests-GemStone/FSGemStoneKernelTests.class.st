Class {
	#name : 'FSGemStoneKernelTests',
	#superclass : 'TestCase',
	#category : 'FileSystem-Tests-GemStone'
}

{ #category : 'private' }
FSGemStoneKernelTests >> collectionMoreThan1NoDuplicates [

	^self collectionWithoutEqualElements
]

{ #category : 'private' }
FSGemStoneKernelTests >> collectionWithoutEqualElements [

	^ {1.1. 4.4. 6.5. 2.4. 3.1.}
]

{ #category : 'private' }
FSGemStoneKernelTests >> collectionWithSameAtEndAndBegining [

	^ {1.5. 5.5. 1.5 copy}.
]

{ #category : 'private' }
FSGemStoneKernelTests >> elementNotInForIndexAccessing [

	^ 9
]

{ #category : 'private' }
FSGemStoneKernelTests >> indexInForCollectionWithoutDuplicates [
	^ 2.
]

{ #category : 'tests' }
FSGemStoneKernelTests >> testCopyUpToLast [

	| result index collection |
	collection := self collectionWithoutEqualElements.
	index:= self indexInForCollectionWithoutDuplicates.
	result := collection copyUpToLast: (collection at:index).
	
	"Verify content"
	result withIndexDo: [:el :i| self assert: (collection at:i) equals: (result at: i)].
	
	"Verify size"
	self assert: result size equals: (index-1)
]

{ #category : 'tests' }
FSGemStoneKernelTests >> testLastIndexOfIfAbsent [

	| element collection |
	collection := self collectionMoreThan1NoDuplicates.
	element := collection first.
	self assert: (collection 
			lastIndexOf: element
			ifAbsent: [ 99 ]) equals: 1.
	self assert: (collection 
			lastIndexOf: self elementNotInForIndexAccessing
			ifAbsent: [ 99 ]) equals: 99
]

{ #category : 'tests' }
FSGemStoneKernelTests >> testLastIndexOfIfAbsentDuplicate [

	| collection element |
	collection := self collectionWithSameAtEndAndBegining.
	element := collection first.

	"floatCollectionWithSameAtEndAndBegining first and last elements are equals 
	'lastIndexOf: should return the position of the last occurrence :'"
	self assert: (collection 
			lastIndexOf: element
			ifAbsent: [ 55 ]) equals: collection size
]

{ #category : 'tests' }
FSGemStoneKernelTests >> testLastIndexOfStartingAt [

	| element collection |
	collection := self collectionMoreThan1NoDuplicates.
	element := collection last.
	self assert: (collection 
			lastIndexOf: element
			startingAt: collection size
			ifAbsent: [ 99 ]) equals: collection size.
	self assert: (collection 
			lastIndexOf: element
			startingAt: collection size - 1
			ifAbsent: [ 99 ]) equals: 99.
	self assert: (collection 
			lastIndexOf: self elementNotInForIndexAccessing
			startingAt: collection size
			ifAbsent: [ 99 ]) equals: 99
]

{ #category : 'tests' }
FSGemStoneKernelTests >> testLastIndexOfStartingAtDuplicate [

	| collection element |
	collection := self collectionWithSameAtEndAndBegining.
	element := collection last.

	" floatCollectionWithSameAtEndAndBegining first and last elements are equals 
	'lastIndexOf:ifAbsent:startingAt: should return the position of the last occurrence :'"
	self assert: (collection 
			lastIndexOf: element
			startingAt: collection size
			ifAbsent: [ 55 ]) equals: collection size.
	self assert: (collection 
			lastIndexOf: element
			startingAt: collection size - 1
			ifAbsent: [ 55 ]) equals: 1
]
