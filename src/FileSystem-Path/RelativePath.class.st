"
Part of FileSystem

=========

RelativePath is part of FileSystem, and represents a path relative to the current working directory. Instance creation is normally done by sending messages to Path, the superclass. RelativePath instance creation is based on the argument, so instance creation methods sent to this class specifying an absolute path will return an instance of AbsolutePath.

See Path class comment for more information on kinds of Path.
"
Class {
	#name : 'RelativePath',
	#superclass : 'Path',
	#category : 'FileSystem-Path'
}

{ #category : 'accessing' }
RelativePath >> emptyPathString [
	"Answer the string representing an empty (size = 0) instance of the receiver.
	For a relative path, this is the current directory"

	^'.'
]

{ #category : 'testing' }
RelativePath >> isAbsolute [
	^ false
]

{ #category : 'testing' }
RelativePath >> isRoot [
	^ false
]

{ #category : 'printing' }
RelativePath >> printOn: aStream [
	aStream nextPutAll: 'Path '.
	self isWorkingDirectory
		ifTrue: [aStream nextPutAll: 'workingDirectory']
		ifFalse: 
			[aStream 
				nextPutAll: '* ''';
				nextPutAll: (self at: 1) asString;
				nextPut: $'.
			2 to: self size do:
				[:i |
				aStream
					nextPutAll: ' / ''';
					nextPutAll: (self at: i);
					nextPut: $']]
					
			
]

{ #category : 'printing' }
RelativePath >> printOn: aStream delimiter: aCharacter [
	self isWorkingDirectory ifTrue: [aStream nextPut: $.. ^ self].
	super printOn: aStream delimiter: aCharacter
]
