Class {
	#name : 'MacOSFileOpeningOptions',
	#superclass : 'UnixFileOpeningOptions',
	#category : 'FileDescriptor'
}

{ #category : 'testing' }
MacOSFileOpeningOptions >> allowsRead [
	"Returns whether these options allow reading."

	^self isReadable
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> allowsWrite [
	"Returns whether these options allow reading."

	^self isWritable
]

{ #category : 'options' }
MacOSFileOpeningOptions >> append [

	flags := flags bitOr: self O_APPEND
]

{ #category : 'options' }
MacOSFileOpeningOptions >> closeOnExec [
	flags := flags bitOr: self O_CLOEXEC
]

{ #category : 'options' }
MacOSFileOpeningOptions >> create [

	flags := flags bitOr: self O_CREAT
]

{ #category : 'options' }
MacOSFileOpeningOptions >> dataSync [

	flags := flags bitOr: self O_DSYNC
]

{ #category : 'options' }
MacOSFileOpeningOptions >> directory [
	flags := flags bitOr: self O_DIRECTORY
]

{ #category : 'options' }
MacOSFileOpeningOptions >> exclusive [

	flags := flags bitOr: self O_EXCL
]

{ #category : 'accessing' }
MacOSFileOpeningOptions >> flags [
	^ flags
]

{ #category : 'initialization' }
MacOSFileOpeningOptions >> initialize [
	flags := self initialValue
]

{ #category : 'private' }
MacOSFileOpeningOptions >> initialValue [
	"Must be non-zero, and have enough low 0 bits that we can detect any out-of-order setting of access mode."
	^ 16r800000000000
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isAppend [
	^ (flags bitAnd: self O_APPEND) = self O_APPEND
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isCloseOnExec [
	^ (flags bitAnd: self O_CLOEXEC) = self O_CLOEXEC
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isCreate [
	^ (flags bitAnd: self O_CREAT) = self O_CREAT
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isDataSync [
	^ (flags bitAnd: self O_DSYNC) = self O_DSYNC
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isDirectory [
	^ (flags bitAnd: self O_DIRECTORY) = self O_DIRECTORY
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isExclusive [
	^ (flags bitAnd: self O_EXCL) = self O_EXCL
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isNoFollow [
	^ (flags bitAnd: self O_NOFOLLOW) = self O_NOFOLLOW
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isReadable [

	^self isReadOnly or: [self isReadWrite]
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isReadOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDONLY
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isReadWrite [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDWR
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isSync [
	^ (flags bitAnd: self O_SYNC) = self O_SYNC
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isTruncate [
	^ (flags bitAnd: self O_TRUNC) = self O_TRUNC
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isWritable [

	^self isWriteOnly or: [self isReadWrite]
]

{ #category : 'testing' }
MacOSFileOpeningOptions >> isWriteOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_WRONLY
]

{ #category : 'accessing' }
MacOSFileOpeningOptions >> mode [
	^ mode
]

{ #category : 'accessing' }
MacOSFileOpeningOptions >> modeBits [
	"If mode has not been explicitly set, answer all read and write. 
	This will be modified by the user's umask when creating a file."

	^ mode ifNotNil: [ mode modeBits ] ifNil: [ 8r666 ]
]

{ #category : 'options' }
MacOSFileOpeningOptions >> noFollow [
	flags := flags bitOr: self O_NOFOLLOW
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_ACCMODE [
	^ 8r3
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_APPEND [

	^8r10
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_ASYNC [

	^8r100
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_CLOEXEC [

	^8r100000000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_CREAT [

	^8r1000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_DIRECTORY [

	^8r4000000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_DSYNC [

	^8r20000000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_EXCL [

	^8r4000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_NOCTTY [

	^8r400000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_NOFOLLOW [

	^8r400
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_NONBLOCK [

	^8r4
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_RDONLY [

	^8r0
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_RDWR [

	^8r2
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_SYNC [

	^8r200
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_TRUNC [

	^8r2000
]

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_WRONLY [

	^8r1
]

{ #category : 'private access modes' }
MacOSFileOpeningOptions >> readOnly [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := 0
]

{ #category : 'private access modes' }
MacOSFileOpeningOptions >> readWrite [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_RDWR
]

{ #category : 'options' }
MacOSFileOpeningOptions >> sync [

	flags := flags bitOr: self O_SYNC
]

{ #category : 'options' }
MacOSFileOpeningOptions >> truncate [

	self isReadOnly
		ifTrue: [self signalImproperOperation: 'Truncate and readOnly cannot be specified together.'].
	flags := flags bitOr: self O_TRUNC
]

{ #category : 'private access modes' }
MacOSFileOpeningOptions >> writeOnly [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_WRONLY
]
