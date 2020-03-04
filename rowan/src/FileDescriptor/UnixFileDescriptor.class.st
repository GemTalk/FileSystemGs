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
	"Assume stdout is already open, and don't register me with the ExternalObjectRegistry,
	since we don't want to close stdout when I'm garbage collected."

	self id: 1
]

{ #category : 'finalization' }
UnixFileDescriptor >> free [
	"Sent by the ExternalObjectRegistry before I'm garbage collected."
	self close
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
