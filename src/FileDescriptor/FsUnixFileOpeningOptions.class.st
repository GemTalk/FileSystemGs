"
Part of FileSystem

=========

Provides an abstraction for Unix options.
"
Class {
	#name : 'FsUnixFileOpeningOptions',
	#superclass : 'FsFileOpeningOptions',
	#instVars : [
		'accessModeSet',
		'flags',
		'mode'
	],
	#category : 'FileDescriptor'
}

{ #category : 'private-accessing' }
FsUnixFileOpeningOptions >> _accessMode: accessMode [

	accessModeSet
		ifTrue: [self signalImproperOperation: 'Access mode must be set before adding any other options.'].
	accessModeSet := true.
	flags := flags bitOr: accessMode
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> allowsRead [
	"Returns whether these options allow reading."

	^self isReadable
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> allowsWrite [
	"Returns whether these options allow reading."

	^self isWritable
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> append [

	flags := flags bitOr: self O_APPEND
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> closeOnExec [

	flags := flags bitOr: self O_CLOEXEC
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> create [

	flags := flags bitOr: self O_CREAT
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> dataSync [

	flags := flags bitOr: self O_DSYNC
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> directory [

	flags := flags bitOr: self O_DIRECTORY
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> exclusive [

	flags := flags bitOr: self O_EXCL
]

{ #category : 'accessing' }
FsUnixFileOpeningOptions >> flags [

	^flags
]

{ #category : 'initialization' }
FsUnixFileOpeningOptions >> initialize [

	flags := 0.
	accessModeSet := false
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isAppend [
	^ (flags bitAnd: self O_APPEND) = self O_APPEND
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isCloseOnExec [
	^ (flags bitAnd: self O_CLOEXEC) = self O_CLOEXEC
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isCreate [
	^ (flags bitAnd: self O_CREAT) = self O_CREAT
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isDataSync [
	^ (flags bitAnd: self O_DSYNC) = self O_DSYNC
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isDirectory [
	^ (flags bitAnd: self O_DIRECTORY) = self O_DIRECTORY
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isExclusive [
	^ (flags bitAnd: self O_EXCL) = self O_EXCL
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isNoFollow [
	^ (flags bitAnd: self O_NOFOLLOW) = self O_NOFOLLOW
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isReadable [

	^self isReadOnly or: [self isReadWrite]
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isReadOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDONLY
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isReadWrite [
	^ (flags bitAnd: self O_ACCMODE) = self O_RDWR
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isSync [
	^ (flags bitAnd: self O_SYNC) = self O_SYNC
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isTruncate [
	^ (flags bitAnd: self O_TRUNC) = self O_TRUNC
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isWritable [

	^self isWriteOnly or: [self isReadWrite]
]

{ #category : 'testing' }
FsUnixFileOpeningOptions >> isWriteOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_WRONLY
]

{ #category : 'accessing' }
FsUnixFileOpeningOptions >> mode [

	^mode
]

{ #category : 'accessing' }
FsUnixFileOpeningOptions >> modeBits [
	"If mode has not been explicitly set, answer all read and write. 
	This will be modified by the user's umask when creating a file."

	^mode ifNotNil: [mode modeBits] ifNil: [8r666]
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> noFollow [

	flags := flags bitOr: self O_NOFOLLOW
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> nonBlocking [
	"We do not current support the O_NONBLOCK option.
	Support may be added in the future."

	self signalImproperOperation: 'Non-blocking file opening is not supported.'
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_ACCMODE [
	"Access mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_APPEND [
	"Append to the file"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_CLOEXEC [
	"Close file descriptor when calling any exec family function"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_CREAT [
	"Create file if it does not exist"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_DIRECTORY [
	"Fail opening a non-directory file."

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_DSYNC [
	"Synchronized writes"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_EXCL [
	"Exclusive use flag"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_NOCTTY [
	"Don't assign a controlling terminal"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_NOFOLLOW [
	"Don't follow symlinks"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_NONBLOCK [
	"Non-blocking mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_RDONLY [
	"Read-only mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_RDWR [
	"Read-write mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_SYNC [
	"Synchronized writes"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_TRUNC [
	"Truncate the file"

	self subclassResponsibility
]

{ #category : 'private-constants' }
FsUnixFileOpeningOptions >> O_WRONLY [
	"Write-only mode"

	self subclassResponsibility
]

{ #category : 'access modes' }
FsUnixFileOpeningOptions >> readOnly [
	"Set the access mode to read-only"

	self _accessMode: self O_RDONLY
]

{ #category : 'access modes' }
FsUnixFileOpeningOptions >> readWrite [
	"Set the access mode to read-write mode"

	self _accessMode: self O_RDWR
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> sync [

	flags := flags bitOr: self O_SYNC
]

{ #category : 'options' }
FsUnixFileOpeningOptions >> truncate [

	self isReadOnly
		ifTrue: [self signalImproperOperation: 'Specifying truncate and readOnly is undefined behavior'].
	flags := flags bitOr: self O_TRUNC
]

{ #category : 'access modes' }
FsUnixFileOpeningOptions >> writeOnly [
	"Set the access mode to write-only mode"

	self _accessMode: self O_WRONLY
]
