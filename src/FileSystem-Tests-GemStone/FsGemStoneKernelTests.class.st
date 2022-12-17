"
Part of FileSystem

=========

Test cases against various GemStone behaviors.
"
Class {
	#name : 'FsGemStoneKernelTests',
	#superclass : 'FsTestCase',
	#category : 'FileSystem-Tests-GemStone'
}

{ #category : 'private' }
FsGemStoneKernelTests >> collectionMoreThan1NoDuplicates [

	^self collectionWithoutEqualElements
]

{ #category : 'private' }
FsGemStoneKernelTests >> collectionWithoutEqualElements [

	^ {1.1. 4.4. 6.5. 2.4. 3.1.}
]

{ #category : 'private' }
FsGemStoneKernelTests >> collectionWithSameAtEndAndBegining [

	^ {1.5. 5.5. 1.5 copy}.
]

{ #category : 'private' }
FsGemStoneKernelTests >> elementNotInForIndexAccessing [

	^ 9
]

{ #category : 'private' }
FsGemStoneKernelTests >> empty [

	^ #().
]

{ #category : 'private' }
FsGemStoneKernelTests >> indexInForCollectionWithoutDuplicates [
	^ 2.
]

{ #category : 'private' }
FsGemStoneKernelTests >> indexInNonEmpty [
	"Return an index between bounds of 'nonEmpty'"
	
	^ 2
]

{ #category : 'private' }
FsGemStoneKernelTests >> moreThan3Elements [

	^ #(1 2 3 4 5) copy.
]

{ #category : 'private' }
FsGemStoneKernelTests >> nonEmpty [

	^ self moreThan3Elements
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testAllButFirst [

	| abf col |
	col := self moreThan3Elements.
	abf := col allButFirst.
	self deny: abf first = col first.
	self assert: abf size + 1 = col size
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testAllButFirstNElements [

	| allButFirst collection |
	collection := self moreThan3Elements.
	allButFirst := collection allButFirst: 2.
	allButFirst withIndexDo: 
		 [:el :i | self assert: el equals: (collection at: i + 2) ].
	self assert: allButFirst size + 2 equals: collection size
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testCopyAfterLast [

	| result index collection |
	collection := self collectionWithoutEqualElements .
	index:= self indexInForCollectionWithoutDuplicates .
	result := collection copyAfterLast: (collection  at:index ).
	
	"Verify content"
	result withIndexDo: 
		[:el :i | self assert: (collection at: (i + index )) equals: (result at: i)].

	"Verify size"
	self assert: result size equals: (collection size - index)
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testCopyUpToLast [

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
FsGemStoneKernelTests >> testCopyWithFirst [

	| index element result |
	index:= self indexInNonEmpty .
	element:= self nonEmpty at: index.
	
	result := self nonEmpty copyWithFirst: element.	
	
	self assert: result size = (self nonEmpty size + 1).
	self assert: result first = element .
	
	2 to: result size do:
	[ :i |
	self assert: (result at: i) = ( self nonEmpty at: ( i - 1 ))].
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testDifference [
	"Answer the set theoretic difference of two collections."
	
	| difference |
	self assert: (self collectionWithoutEqualElements difference: self collectionWithoutEqualElements) isEmpty.
	self assert: (self empty difference: self collectionWithoutEqualElements) isEmpty.
	difference := (self collectionWithoutEqualElements difference: self empty).
	self assert: difference size = self collectionWithoutEqualElements size.
	self collectionWithoutEqualElements do: [ :each |
		self assert: (difference includes: each) ].
]

{ #category : 'tests' }
FsGemStoneKernelTests >> testLastIndexOfIfAbsent [

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
FsGemStoneKernelTests >> testLastIndexOfIfAbsentDuplicate [

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
FsGemStoneKernelTests >> testLastIndexOfStartingAt [

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
FsGemStoneKernelTests >> testLastIndexOfStartingAtDuplicate [

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
