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
	#name : 'UnixFileOpeningOptions',
	#superclass : 'FileOpeningOptions',
	#instVars : [
		'flags',
		'mode'
	],
	#category : 'FileDescriptor'
}

{ #category : 'instance creation' }
UnixFileOpeningOptions class >> new [
	^ super new initialize
]

{ #category : 'instance creation' }
UnixFileOpeningOptions class >> readOnly [
	^ self new readOnly
]

{ #category : 'instance creation' }
UnixFileOpeningOptions class >> readWrite [
	^ self new readWrite
]

{ #category : 'instance creation' }
UnixFileOpeningOptions class >> writeOnly [
	^ self new writeOnly
]

{ #category : 'testing' }
UnixFileOpeningOptions >> allowsRead [
	^ (flags bitAnd: self O_ACCMODE) even
]

{ #category : 'testing' }
UnixFileOpeningOptions >> allowsWrite [
	^ (flags bitAnd: self O_ACCMODE) > self O_RDONLY
]

{ #category : 'options' }
UnixFileOpeningOptions >> append [
	flags := flags bitOr: self O_APPEND
]

{ #category : 'options' }
UnixFileOpeningOptions >> closeOnExec [
	flags := flags bitOr: self O_CLOEXEC
]

{ #category : 'options' }
UnixFileOpeningOptions >> create [
	flags := flags bitOr: self O_CREAT
]

{ #category : 'options' }
UnixFileOpeningOptions >> dataSync [
	flags := flags bitOr: self O_DSYNC
]

{ #category : 'options' }
UnixFileOpeningOptions >> direct [
	flags := flags bitOr: self O_DIRECT
]

{ #category : 'options' }
UnixFileOpeningOptions >> directory [
	flags := flags bitOr: self O_DIRECTORY
]

{ #category : 'options' }
UnixFileOpeningOptions >> exclusive [
	flags := flags bitOr: self O_EXCL
]

{ #category : 'accessing' }
UnixFileOpeningOptions >> flags [
	^ flags
]

{ #category : 'initialization' }
UnixFileOpeningOptions >> initialize [
	flags := 0
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isAppend [
	^ (flags bitAnd: self O_APPEND) = self O_APPEND
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isCloseOnExec [
	^ (flags bitAnd: self O_CLOEXEC) = self O_CLOEXEC
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isCreate [
	^ (flags bitAnd: self O_CREAT) = self O_CREAT
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isDataSync [
	^ (flags bitAnd: self O_DSYNC) = self O_DSYNC
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isDirect [
	^ (flags bitAnd: self O_DIRECT) = self O_DIRECT
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isDirectory [
	^ (flags bitAnd: self O_DIRECTORY) = self O_DIRECTORY
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isExclusive [
	^ (flags bitAnd: self O_EXCL) = self O_EXCL
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isNoAccessTime [
	^ (flags bitAnd: self O_NOATIME) = self O_NOATIME
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isNoFollow [
	^ (flags bitAnd: self O_NOFOLLOW) = self O_NOFOLLOW
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isPath [
	^ (flags bitAnd: self O_PATH) = self O_PATH
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isReadOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDONLY
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isReadWrite [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDWR
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isSync [
	^ (flags bitAnd: self O_SYNC) = self O_SYNC
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isTmpFile [
	^ (flags bitAnd: self O_TMPFILE) = self O_TMPFILE
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isTruncate [
	^ (flags bitAnd: self O_TRUNC) = self O_TRUNC
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isWriteOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_WRONLY
]

{ #category : 'options' }
UnixFileOpeningOptions >> noAccessTime [
	flags := flags bitOr: self O_NOATIME
]

{ #category : 'options' }
UnixFileOpeningOptions >> noFollow [
	flags := flags bitOr: self O_NOFOLLOW
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_ACCMODE [
	^ 8r3
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_APPEND [
	^ 8r2000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_ASYNC [
	^ 8r20000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_CLOEXEC [
	^ 8r2000000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_CREAT [
	^ 8r100
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_DIRECT [
	^ 8r40000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_DIRECTORY [
	^ 8r200000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_DSYNC [
	^ 8r10000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_EXCL [
	^ 8r200
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_NOATIME [
	^ 8r1000000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_NOCTTY [
	^ 8r400
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_NOFOLLOW [
	^ 8r400000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_NONBLOCK [
	^ 8r4000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_PATH [
	^ 8r10000000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_RDONLY [
	^ 8r0
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_RDWR [
	^ 8r2
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_SYNC [
	^ 8r4010000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_TMPFILE [
	^ 8r20200000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_TRUNC [
	^ 8r1000
]

{ #category : 'private constants' }
UnixFileOpeningOptions >> O_WRONLY [
	^ 8r1
]

{ #category : 'options' }
UnixFileOpeningOptions >> path [
	flags := flags bitOr: self O_PATH
]

{ #category : 'private access modes' }
UnixFileOpeningOptions >> readOnly [
	flags = 0
		ifFalse: [ self signalLateAccessChange ]
]

{ #category : 'private access modes' }
UnixFileOpeningOptions >> readWrite [
	flags = 0
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_RDWR
]

{ #category : 'options' }
UnixFileOpeningOptions >> sync [
	flags := flags bitOr: self O_SYNC
]

{ #category : 'options' }
UnixFileOpeningOptions >> tmpFile [
	flags := flags bitOr: self O_TMPFILE
]

{ #category : 'options' }
UnixFileOpeningOptions >> truncate [
	flags := flags bitOr: self O_TRUNC
]

{ #category : 'private access modes' }
UnixFileOpeningOptions >> writeOnly [
	flags = 0
		ifFalse: [ self signalLateAccessChange ].
	flags := self O_WRONLY
]
