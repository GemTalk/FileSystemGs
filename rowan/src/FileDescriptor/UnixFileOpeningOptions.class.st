"
Represents the flags and mode arguments to the Unix open() call.

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
