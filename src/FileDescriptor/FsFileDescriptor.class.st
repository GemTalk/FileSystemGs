"
Part of FileSystem

=========

FsFileDescriptor serves as a wrapper for an OS file descriptor. It provides a reasonable Smalltalk interface for used functions.

Instances are instancesNonPersistent as they cannot be committed to the database. A closely related class, FsBinaryFileStream is dbTransient. Referenced instances of FsFileDescriptor are kept alive indirectly (via a chain of instancesNonPersistent objects) which start at SessionTemps and terminates with FsFileDescriptorEphemeron.

When the last reference to an FsFileDescriptorInstance is released, the associated Ephemeron will be mourned. Mourning will properly close the file descriptor (if it hasn't been already) and removed the FsFileDescriptor instance the associated FsFileDescriptorRegistry. Users should ensure they maintain a direct and transient reference a FsFileDescriptor instance to ensure it isn't garbage collected and closed prematurely.

In many cases, the only reference to the underlying FsFileDescriptor will be the FsBinaryFileStream instance. Avoid committing associated streams unless you hold a transient reference to the FsFileDescriptor instance elsewhere.
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
	"_fd: bypassess the Registry and ensures we don't close stderr unexpectedly."

	^super new initialize
		_fd: 2;
		yourself
]

{ #category : 'Instance Creation' }
FsFileDescriptor class >> stdin [
	"_fd: bypassess the Registry and ensures we don't close stdin unexpectedly."

	^super new initialize
		_fd: 0;
		yourself
]

{ #category : 'Instance Creation' }
FsFileDescriptor class >> stdout [
	"_fd: bypassess the Registry and ensures we don't close stdout unexpectedly."

	^super new initialize
		_fd: 1;
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
		onException: { FsEBADF. FsEINTR}
		do: {[ :ex | ex return ]. [:ex | ex retry]}
]

{ #category : 'private' }
FsFileDescriptor >> _ephemeron: anEphemeron [

	ephemeron := anEphemeron
]

{ #category : 'private' }
FsFileDescriptor >> _fd [
	"This is provided purely for testing purposes. You should never use this."

	^fd ifNil: [self invalidException signal]
]

{ #category : 'private' }
FsFileDescriptor >> _fd: aFileDescriptorInteger [

	fd := aFileDescriptorInteger
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

{ #category : 'accessing' }
FsFileDescriptor >> invalidException [
	"Returns a FsFileDescriptorInvalid exception"

	^FsFileDescriptorInvalid fileDescriptor: self
]

{ #category : 'testing' }
FsFileDescriptor >> isOpen [
	"Returns true if the receiver is open."

	^fd notNil
]

{ #category : 'positioning' }
FsFileDescriptor >> position [
	"Returns the current position in the file."

	^[libcUnistd
		lseek: self _fd
		offset: 0
		whence: 8r1. "SEEK_CUR"]
		on: FsEBADF
		do: [:ex | ex resignalAs: self invalidException]
]

{ #category : 'positioning' }
FsFileDescriptor >> position: newPosition [
	"Returns the current position in the file."

	^[libcUnistd
		lseek: self _fd
		offset: newPosition
		whence: 8r0. "SEEK_SET"]
		onException: {FsEBADF. FsEINVAL}
		do: {[:ex | ex resignalAs: self invalidException]. [:ex | ex resignalAs: (OutOfRange new name: 'position' min: 0 max: (self size - 2) actual: newPosition; yourself)]}
]

{ #category : 'private' }
FsFileDescriptor >> read: count [
	"Read up to <count> number of bytes from
	the backing file descriptor."

	| buffer numBytesRead |
	buffer := CByteArray gcMalloc: count.
	numBytesRead := [libcUnistd
		readFromFileDescriptor: self _fd
		toBuffer: buffer
		count: buffer size]
		onException: {FsEBADF. FsEINTR}
		do: {[:ex | ex resignalAs: self invalidException]. [:ex | ex retry]}.
  numBytesRead == 0
    ifTrue: [^#[]].
	^buffer
		byteArrayFrom: 0
		to: numBytesRead - 1
]

{ #category : 'positioning' }
FsFileDescriptor >> setToEnd [

	^[libcUnistd
		lseek: self _fd
		offset: 0
		whence: 8r2. "SEEK_END"]
		on: FsEBADF
		do: [:ex | ex resignalAs: self invalidException]
]

{ #category : 'accessing' }
FsFileDescriptor >> size [

	^self stat size
]

{ #category : 'private' }
FsFileDescriptor >> stat [

	^[DiskStore current libcStat fstat: self _fd]
		on: FsEBADF
		do: [:ex | ex resignalAs: self invalidException]
]

{ #category : 'public' }
FsFileDescriptor >> truncateTo: length [
	"Truncate the open file to the specified length."

	^[libcUnistd
		ftruncate: self _fd
		to: length]
		on: FsEBADF
		do: [:ex | ex resignalAs: self invalidException]
]

{ #category : 'private' }
FsFileDescriptor >> write: aByteArray [
	"Write the provided bytes to the file descriptor.
	Returns the number of bytes actually written to
	the file descriptor."

	| buffer |
	aByteArray _validateInstanceOf: ByteArray.
	buffer := CByteArray withAll: aByteArray nullTerminate: false.
	^[libcUnistd
		writeToFileDescriptor: self _fd
		fromBuffer: buffer
		count: buffer size]
		onException: {FsEBADF. FsEINTR}
		do: {[:ex | ex resignalAs: self invalidException]. [:ex | ex retry]}
]
