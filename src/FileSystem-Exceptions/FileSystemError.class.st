"
Part of FileSystem

=========

I am an abstract superclass for errors that may occur during filesystem operations.
"
Class {
	#name : 'FileSystemError',
	#superclass : 'FsError',
	#instVars : [
		'reference'
	],
	#category : 'FileSystem-Exceptions'
}

{ #category : 'instance creation' }
FileSystemError class >> reference: aReference [
	^ self new initializeWithReference: aReference
]

{ #category : 'instance creation' }
FileSystemError class >> signalWith: aReference [
	^ (self reference: aReference) signal
]

{ #category : 'initialize-release' }
FileSystemError >> initializeWithReference: aReference [
	reference := aReference.
	messageText := 'a', self class name , ' occurred, ', aReference printString
]

{ #category : 'Instance initialization' }
FileSystemError >> initialize [
  super initialize .
  gsNumber := ERR_FileSystemError .

]

{ #category : 'testing' }
FileSystemError >> isResumable [
	^ true
]

{ #category : 'accessing' }
FileSystemError >> reference [
	^ reference
]
