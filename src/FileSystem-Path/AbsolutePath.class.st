"
Part of FileSystem

=========

AbsolutePath is part of FileSystem, and represents an absolute path, starting from the root directory (Path root). Instance creation is normally done by sending messages to Path, the superclass. AbsolutePath instance creation is based on the argument, so instance creation methods sent to this class specifying a relative path will return an instance of RelativePath.

See Path class comment for more information on kinds of Path.
"
Class {
	#name : 'AbsolutePath',
	#superclass : 'Path',
	#category : 'FileSystem-Path'
}

{ #category : 'utilities' }
AbsolutePath class >> addEmptyElementTo: result [
]

{ #category : 'instance creation' }
AbsolutePath class >> from: aString delimiter: aDelimiterCharater [
	aString = '/'
		ifTrue: [ ^ self root ].
		
	^ super from: aString delimiter: aDelimiterCharater
]

{ #category : 'testing' }
AbsolutePath >> isAbsolute [
	^ true
]

{ #category : 'testing' }
AbsolutePath >> isRoot [
	^ self size = 0
]

{ #category : 'printing' }
AbsolutePath >> printOn: aStream [
	aStream nextPutAll: 'Path'.
	self isRoot
		ifTrue: [aStream nextPutAll: ' root']
		ifFalse:
			[1 to: self size do:
				[:i |
				aStream 
					nextPutAll: ' / ''';
				 	nextPutAll: (self at: i);
					nextPut: $']]
]

{ #category : 'printing' }
AbsolutePath >> printPathOn: aStream delimiter: aCharacter [
	"Print the path elements of the receiver, without the 'Path *' part"

	aStream nextPut: aCharacter.
	super printPathOn: aStream delimiter: aCharacter

]

{ #category : 'enumerating' }
AbsolutePath >> withParents [
	^ super withParents addFirst: (Path root); yourself
]
