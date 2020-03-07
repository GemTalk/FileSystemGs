"
Each of my instances represents an open Unix file descriptor and allows operations on it.

I'm dbTransient. Normally, instances are transient object, but if one *is* committed, and then faulted into another session, its instance variables will be nil. Therefore, some care is needed to check for nil where operations should succeed after being faulted in.
"
Class {
	#name : 'UnixFileDescriptor',
	#superclass : 'Object',
	#instVars : [
		'id',
		'registryEntry'
	],
	#gs_options : [
		'dbTransient'
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

{ #category : 'public' }
UnixFileDescriptor >> close [
	"Closing should silently succeed even if I'm invalid,
	since I don't represent anything open."

	id ifNotNil: [ self privateClose: id ].
	registryEntry ifNotNil: [ registryEntry deregister ]
]

{ #category : 'finalization' }
UnixFileDescriptor >> free [
	"Sent by the ExternalObjectRegistry when there are no other
	references to me.
	If I'm committed, I may be referenced by a committed object
	that has dropped from memory. In that case, should stay open
	and be kept alive by the registry until the session logs out."

	self isCommitted
		ifFalse: [ self close ]
]

{ #category : 'private' }
UnixFileDescriptor >> id [
	id
		ifNil: [ 
			ImproperOperation
				signal: 'Attempt to use a closed or otherwise invalid file descriptor' ].
	^ id
]

{ #category : 'private' }
UnixFileDescriptor >> id: anInteger [
	id = nil
		ifFalse: [ ^ self error: 'Cannot set file descriptor ID more than once.' ].
	id := anInteger
]
