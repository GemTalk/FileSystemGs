Class {
	#name : 'UnixFileDescriptor',
	#superclass : 'Object',
	#instVars : [
		'id'
	],
	#category : 'FileDescriptor'
}

{ #category : 'Instance Creation' }
UnixFileDescriptor class >> forStdout [
	^ self basicNew
		beForStdout;
		yourself
]

{ #category : 'Instance non-creation' }
UnixFileDescriptor class >> new [
	self shouldNotImplement: #new
]

{ #category : 'private' }
UnixFileDescriptor >> beForStdout [
	self id: 1
]

{ #category : 'accessing' }
UnixFileDescriptor >> id [
	^ id
]

{ #category : 'private' }
UnixFileDescriptor >> id: anInteger [
	id = nil
		ifFalse: [ ^ self error: 'Cannot set file descriptor ID more than once.' ].
	id := anInteger
]
