"
Part of FileSystem

=========

Each of my instances represents an open Unix file descriptor and allows operations on it.

FileDescriptors are dbTransient. Thus, they can be committed but their contents will be nil upon re-fault. This is to allow them to be committed as part of a continuation, rather than failing the commit as would be done with #instancesNonPersistent.

Some of the behavior that results, and how it's implemented:

* If re-faulted in another session the FileDescriptor will be invalid. Methods detect nil contents and react appropriately.

* If the FileDescriptor is not committed, it is automatically closed and freed if dereferenced. To implement this, it is always referenced from a RegistryEphemeron.

* If the FileDescriptor is committed, it will stay open until the end of the session unless sent #close. This is because it might be referenced from a committed object that has dropped from memory, but we cannot allow the FileDescriptor to lose its state during the session while its underlying OS descriptor is live. This is implemented by checking to for committed state in UnixFileDescriptor>>free.

* In order to keep the FileDescriptor from dropping out of memory even if it's committed, the RegistryEphemeron must never be committed, or allowed to be stubbed as a transient object. This is accomplished by setting RegistryEphemeron to be #instancesNonPersistent and, when available, #noAggressiveStubbing. Being #instancesNonPersistent assures that there is an unbroken chain of transient objects from session state to the RegistryEphemeron, so it cannot itself drop out of memory. #noAggressiveStubbing ensures that the RegistryEphemeron's state must remain a direct memory reference, and not be replaced with an oop reference. An oop reference could allow the FileDescriptor to drop from memory if committed.
"
Class {
	#name : 'FsFileDescriptor',
	#superclass : 'Object',
	#instVars : [
		'fd',
		'ephemeron',
		'libcUnistd'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileDescriptor'
}

{ #category : 'Instance Creation' }
FsFileDescriptor class >> fd: fileDescriptorInteger [

	^super new initialize
		fd: fileDescriptorInteger;
		yourself
]

{ #category : 'Instance non-creation' }
FsFileDescriptor class >> new [
	self shouldNotImplement: #new
]

{ #category : 'Instance Creation' }
FsFileDescriptor class >> stderr [

	^super new initialize
		becomeStderr;
		yourself
]

{ #category : 'Instance Creation' }
FsFileDescriptor class >> stdin [

	^super new initialize
		becomeStdin;
		yourself
]

{ #category : 'Instance Creation' }
FsFileDescriptor class >> stdout [

	^super new initialize
		becomeStdout;
		yourself
]

{ #category : 'private' }
FsFileDescriptor >> _close [
	"Close the file. Fsync it first so we are notified of any errors during the flush.
	Report some errors when flushing (I/O error, out-of-space, quota exceeded)
	Ignore FsEBADF, which indicates that my descriptor is already somehow closed,
	so we silently succeed.
	Other errors on fsync must be ignored (EROFS, EINVAL) since they just say 
	that fsync isn't supported on this kind of fd.
	FsEINTR is, according to some references, never returned on Linux. But if it is, 
	it should be ignored, since the file descriptor has already been freed."

	| fdToClose |
	fd ifNil: [ ^ self ].
	fdToClose := fd.
	fd := nil.
	[ libcUnistd closeFd: fdToClose ]
		on: FsEBADF , FsEINTR
		do: [ :ex | ex return ]
]

{ #category : 'private' }
FsFileDescriptor >> _ephemeron: anEphemeron [

	ephemeron := anEphemeron
]

{ #category : 'private' }
FsFileDescriptor >> _fd [
	"This is provided purely for testing purposes. You should never use this."

	^fd
]

{ #category : 'private' }
FsFileDescriptor >> _fd: aFileDescriptorInteger [
	
	self assertUninitialized.
	fd := aFileDescriptorInteger
]

{ #category : 'asserting' }
FsFileDescriptor >> assertUninitialized [

	fd ifNotNil: [FsFileDescriptorAlreadyInitialized signal]
]

{ #category : 'private' }
FsFileDescriptor >> becomeStderr [
	"Assume stderr is already open, and don't register me with the ExternalObjectRegistry,
	since we don't want to close stderr when I'm garbage collected."

	self _fd: 2
]

{ #category : 'private' }
FsFileDescriptor >> becomeStdin [
	"Assume stdin is already open, and don't register me with the ExternalObjectRegistry,
	since we don't want to close stdin when I'm garbage collected."

	self _fd: 0
]

{ #category : 'private' }
FsFileDescriptor >> becomeStdout [
	"Assume stdout is already open, and don't register me with the ExternalObjectRegistry,
	since we don't want to close stdout when I'm garbage collected."

	self _fd: 1
]

{ #category : 'accessing' }
FsFileDescriptor >> binaryReadStream [

	^FsBinaryFileStream on: self
]

{ #category : 'accessing' }
FsFileDescriptor >> binaryWriteStream [

	^FsBinaryFileStream on: self
]

{ #category : 'public' }
FsFileDescriptor >> close [
	"Esure the receiver is closed.
	This selector can be repeatedly sent."

	self _close.
	ephemeron ifNotNil:
			[:eph |
			ephemeron := nil.
			eph deregister]
]

{ #category : 'testing' }
FsFileDescriptor >> closed [
	"Returns true if the receiver has been closed."

	^self isOpen not
]

{ #category : 'public' }
FsFileDescriptor >> ensureClosed [
	"Closing should silently succeed even if I'm invalid,
	since I don't represent anything open."

	self close
]

{ #category : 'private' }
FsFileDescriptor >> fd: aFileDescriptorInteger [
	
	self _fd: aFileDescriptorInteger.
	FsFileDescriptorRegistry current register: self
]

{ #category : 'initialization' }
FsFileDescriptor >> initialize [

	libcUnistd := DiskStore current libcUnistd
]

{ #category : 'testing' }
FsFileDescriptor >> isOpen [
	"Returns true if the receiver is open."

	^fd notNil
]

{ #category : 'positioning' }
FsFileDescriptor >> position [

	| library |
	library := DiskStore current libcUnistd.
	^library
		lseek: fd
		offset: 0
		whence: 8r1. "SEEK_CUR"
]

{ #category : 'private' }
FsFileDescriptor >> read: count [
	"Read up to <count> number of bytes from
	the backing file descriptor."

	| buffer numBytesRead |
	buffer := CByteArray gcMalloc: count.
	numBytesRead := libcUnistd
		readFromFileDescriptor: fd
		toBuffer: buffer
		count: buffer size.
  numBytesRead == 0
    ifTrue: [^#[]].
	^buffer
		byteArrayFrom: 0
		to: numBytesRead - 1
]

{ #category : 'positioning' }
FsFileDescriptor >> setToEnd [

	| library |
	library := DiskStore current libcUnistd.
	^library
		lseek: fd
		offset: 0
		whence: 8r2. "SEEK_END"
]

{ #category : 'accessing' }
FsFileDescriptor >> size [

	^self stat size
]

{ #category : 'private' }
FsFileDescriptor >> stat [

	^DiskStore current libcStat fstat: fd
]

{ #category : 'Instance Creation' }
FsFileDescriptor >> stdin [

	^super new initialize
		becomeStdin;
		yourself
]

{ #category : 'public' }
FsFileDescriptor >> truncateTo: length [
	"Truncate the open file to the specified length."

	| library |
	library := DiskStore current libcUnistd.
	^library
		truncate: fd
		to: length
]

{ #category : 'private' }
FsFileDescriptor >> write: aByteArray [
	"Write the provided bytes to the file descriptor.
	Returns the number of bytes actually written to
	the file descriptor."

	| buffer |
	aByteArray _validateInstanceOf: ByteArray.
	buffer := CByteArray withAll: aByteArray nullTerminate: false.
	^libcUnistd
		writeToFileDescriptor: fd
		fromBuffer: buffer
		count: buffer size
]
