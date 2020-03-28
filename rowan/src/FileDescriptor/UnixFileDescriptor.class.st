"
Each of my instances represents an open Unix file descriptor and allows operations on it.

FileDescriptors are dbTransient. Thus, they can be committed but their contents will be nil upon re-fault. This is to allow them to be committed as part of a continuation, rather than failing the commit as would be done with #instancesNonPersistent.

Some of the behavior that results, and how it's implemented:

* If re-faulted in another session the FileDescriptor will be invalid. Methods detect nil contents and react appropriately.

* If the FileDescriptor is not committed, it is automatically closed and freed if dereferenced. To implement this, it is always referenced from a RegistryEphemeron.

* If the FileDescriptor is committed, it will stay open until the end of the session unless sent #close. This is because it might be referenced from a committed object that has dropped from memory, but we cannot allow the FileDescriptor to lose its state during the session while its underlying OS descriptor is live. This is implemented by checking to for committed state in UnixFileDescriptor>>free.

* In order to keep the FileDescriptor from dropping out of memory even if it's committed, the RegistryEphemeron must never be committed, or allowed to be stubbed as a transient object. This is accomplished by setting RegistryEphemeron to be #instancesNonPersistent and, when available, #noAggressiveStubbing. Being #instancesNonPersistent assures that there is an unbroken chain of transient objects from session state to the RegistryEphemeron, so it cannot itself drop out of memory. #noAggressiveStubbing ensures that the RegistryEphemeron's state must remain a direct memory reference, and not be replaced with an oop reference. An oop reference could allow the FileDescriptor to drop from memory if committed.
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
