"
Part of FileSystem

=========

Users of FileOpeningOptions should use the interface as defined in FsFileOpeningOptions, FsMemoryFileOpeningOptions, and FsUnixFileOpeningOptions. All subclasses of these classes are implementation-defined and subject to change at anytime.

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
	#name : 'FsFileOpeningOptions_Linux',
	#superclass : 'FsUnixFileOpeningOptions',
	#category : 'FileSystem-FileDescriptor'
}

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_ACCMODE [
	"Access mode"

	^8r000000003
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_APPEND [
	"Append to the file"

	^8r000002000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_CLOEXEC [
	"Close file descriptor when calling any exec family function"

	^8r002000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_CREAT [
	"Create file if it does not exist"

	^8r000000100
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_DIRECTORY [
	"Fail opening a non-directory file."

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_DSYNC [
	"Synchronized writes"

	^8r000010000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_EXCL [
	"Exclusive use flag"

	^8r000000200
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_NOCTTY [
	"Don't assign a controlling terminal"

	^8r000000400
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_NOFOLLOW [
	"Don't follow symlinks"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_NONBLOCK [
	"Non-blocking mode"

	^8r000004000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_RDONLY [
	"Read-only mode"

	^8r000000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_RDWR [
	"Read-write mode"

	^8r000000002
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_SYNC [
	"Synchronized writes"

	^8r004010000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_TRUNC [
	"Truncate the file"

	^8r000001000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux >> O_WRONLY [
	"Write-only mode"

	^8r000000001
]
