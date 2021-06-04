"
Common superclass for tests of guidance through the filesystem
"
Class {
	#name : 'GuideTest',
	#superclass : 'SingleTreeTest',
	#instVars : [
		'guide',
		'visited'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'testing' }
GuideTest class >> isAbstract [
	^ self name = #GuideTest
]

{ #category : 'asserting' }
GuideTest >> assertVisitedIs: anArray [

	self
		assert: visited size
		equals: anArray size.
	visited do: [:each | self assert: (anArray includes: each reference basename)]
]

{ #category : 'running' }
GuideTest >> setUp [
	super setUp.
	visited := OrderedCollection new.
	filesystem := FileSystem memory.
	self setUpGreek
]

{ #category : 'visitor' }
GuideTest >> visitDirectory: aReference [
	visited add: aReference.
]

{ #category : 'visitor' }
GuideTest >> visitFile: aReference [
	visited add: aReference.
]
