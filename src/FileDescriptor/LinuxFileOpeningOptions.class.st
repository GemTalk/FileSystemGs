"
Represents the flags and mode arguments to the Unix open() call.
See 'man 2 open' for documentation of the various options.

flags is an integer, all the O_* options ORed together.

mode is an instance of UnixFileMode. It is ignored on open unless #create or #tmpfile is specified.

Instances are created by sending the class one of the messages 
  #readOnly
  #writeOnly
  #readWrite

Other options are set by sending messages to the resulting instance.

API is provided for setting bits in flags, and setting the mode.
No API is provided for clearing bits in flags -- a new instance starts with them all cleared,
you should set only the ones you want set.
"
Class {
	#name : 'LinuxFileOpeningOptions',
	#superclass : 'UnixFileOpeningOptions',
	#category : 'FileDescriptor'
}

{ #category : 'testing' }
LinuxFileOpeningOptions >> allowsRead [
	"Returns whether these options allow reading."

	^self isReadable
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> allowsWrite [
	"Returns whether these options allow reading."

	^self isWritable
]

{ #category : 'options' }
LinuxFileOpeningOptions >> append [
	self denyPath.
	flags := flags bitOr: self O_APPEND
]

{ #category : 'options' }
LinuxFileOpeningOptions >> closeOnExec [
	flags := flags bitOr: self O_CLOEXEC
]

{ #category : 'options' }
LinuxFileOpeningOptions >> create [
	self denyPath.
	flags := flags bitOr: self O_CREAT
]

{ #category : 'options' }
LinuxFileOpeningOptions >> dataSync [
	self denyPath.
	flags := flags bitOr: self O_DSYNC
]

{ #category : 'private' }
LinuxFileOpeningOptions >> denyPath [
	self isPath
		ifTrue: [ 
			self improperOperationExceptionClass
				signal: 'Cannot combine #path with this option.' ]
]

{ #category : 'options' }
LinuxFileOpeningOptions >> direct [
	self denyPath.
	flags := flags bitOr: self O_DIRECT
]

{ #category : 'options' }
LinuxFileOpeningOptions >> directory [
	flags := flags bitOr: self O_DIRECTORY
]

{ #category : 'options' }
LinuxFileOpeningOptions >> exclusive [
	self denyPath.
	flags := flags bitOr: self O_EXCL
]

{ #category : 'accessing' }
LinuxFileOpeningOptions >> flags [
	^ flags
]

{ #category : 'initialization' }
LinuxFileOpeningOptions >> initialize [
	flags := self initialValue
]

{ #category : 'private' }
LinuxFileOpeningOptions >> initialValue [
	"Must be non-zero, and have enough low 0 bits that we can detect any out-of-order setting of access mode."
	^ 16r800000000000
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isAppend [
	^ (flags bitAnd: self O_APPEND) = self O_APPEND
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isCloseOnExec [
	^ (flags bitAnd: self O_CLOEXEC) = self O_CLOEXEC
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isCreate [
	^ (flags bitAnd: self O_CREAT) = self O_CREAT
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isDataSync [
	^ (flags bitAnd: self O_DSYNC) = self O_DSYNC
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isDirect [
	^ (flags bitAnd: self O_DIRECT) = self O_DIRECT
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isDirectory [
	^ (flags bitAnd: self O_DIRECTORY) = self O_DIRECTORY
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isExclusive [
	^ (flags bitAnd: self O_EXCL) = self O_EXCL
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isNoAccessTime [
	^ (flags bitAnd: self O_NOATIME) = self O_NOATIME
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isNoFollow [
	^ (flags bitAnd: self O_NOFOLLOW) = self O_NOFOLLOW
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isPath [
	^ (flags bitAnd: self O_PATH) = self O_PATH
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isReadable [

	^self isReadOnly or: [self isReadWrite]
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isReadOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDONLY
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isReadWrite [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDWR
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isSync [
	^ (flags bitAnd: self O_SYNC) = self O_SYNC
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isTmpFile [
	^ (flags bitAnd: self O_TMPFILE) = self O_TMPFILE
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isTruncate [
	^ (flags bitAnd: self O_TRUNC) = self O_TRUNC
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isWritable [

	^self isWriteOnly or: [self isReadWrite]
]

{ #category : 'testing' }
LinuxFileOpeningOptions >> isWriteOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_WRONLY
]

{ #category : 'accessing' }
LinuxFileOpeningOptions >> mode [
	^ mode
]

{ #category : 'accessing' }
LinuxFileOpeningOptions >> modeBits [
	"If mode has not been explicitly set, answer all read and write. 
	This will be modified by the user's umask when creating a file."

	^ mode ifNotNil: [ mode modeBits ] ifNil: [ 8r666 ]
]

{ #category : 'options' }
LinuxFileOpeningOptions >> noAccessTime [
	self denyPath.
	flags := flags bitOr: self O_NOATIME
]

{ #category : 'options' }
LinuxFileOpeningOptions >> noFollow [
	flags := flags bitOr: self O_NOFOLLOW
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_ACCMODE [
	^ 8r3
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_APPEND [
	^ 8r2000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_ASYNC [
	^ 8r20000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_CLOEXEC [
	^ 8r2000000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_CREAT [
	^ 8r100
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_DIRECT [
	^ 8r40000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_DIRECTORY [
	^ 8r200000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_DSYNC [
	^ 8r10000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_EXCL [
	^ 8r200
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_NOATIME [
	^ 8r1000000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_NOCTTY [
	^ 8r400
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_NOFOLLOW [
	^ 8r400000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_NONBLOCK [
	^ 8r4000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_PATH [
	^ 8r10000000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_RDONLY [
	^ 8r0
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_RDWR [
	^ 8r2
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_SYNC [
	^ 8r4010000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_TMPFILE [
	^ 8r20200000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_TRUNC [
	^ 8r1000
]

{ #category : 'private constants' }
LinuxFileOpeningOptions >> O_WRONLY [
	^ 8r1
]

{ #category : 'options' }
LinuxFileOpeningOptions >> path [
	"Path can only be combined with these options."

	| allowed |
	allowed := self O_PATH.
	allowed := allowed bitOr: self O_CLOEXEC.
	allowed := allowed bitOr: self O_DIRECTORY.
	allowed := allowed bitOr: self O_NOFOLLOW.
	(flags bitInvert bitOr: allowed) = -1
		ifFalse: [ 
			self improperOperationExceptionClass
				signal: 'Attempt to combine #path with one or more incompatible options.' ].
	flags := flags bitOr: self O_PATH
]

{ #category : 'private access modes' }
LinuxFileOpeningOptions >> readOnly [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := 0
]

{ #category : 'private access modes' }
LinuxFileOpeningOptions >> readWrite [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_RDWR
]

{ #category : 'options' }
LinuxFileOpeningOptions >> sync [
	self denyPath.
	flags := flags bitOr: self O_SYNC
]

{ #category : 'options' }
LinuxFileOpeningOptions >> tmpFile [
	self allowsWrite
		ifFalse: [ 
			self improperOperationExceptionClass
				signal: 'Cannot specify #tmpFile and readOnly together.' ].
	self denyPath.
	flags := flags bitOr: self O_TMPFILE
]

{ #category : 'options' }
LinuxFileOpeningOptions >> truncate [
	self isReadOnly
		ifTrue: [ 
			self improperOperationExceptionClass
				signal: 'Truncate and readOnly cannot be specified together.' ].
	self denyPath.
	flags := flags bitOr: self O_TRUNC
]

{ #category : 'private access modes' }
LinuxFileOpeningOptions >> writeOnly [
	flags = self initialValue
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_WRONLY
]
