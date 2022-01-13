Class {
	#name : 'UnixFileOpeningOptions',
	#superclass : 'FileOpeningOptions',
	#instVars : [
		'accessModeSet',
		'flags',
		'mode'
	],
	#category : 'FileDescriptor'
}

{ #category : 'private-accessing' }
UnixFileOpeningOptions >> _accessMode: accessMode [

	accessModeSet
		ifTrue: [self signalImproperOperation: 'Access mode must be set before adding any other options.'].
	accessModeSet := true.
	flags := flags bitOr: accessMode
]

{ #category : 'testing' }
UnixFileOpeningOptions >> allowsRead [
	"Returns whether these options allow reading."

	^self isReadable
]

{ #category : 'testing' }
UnixFileOpeningOptions >> allowsWrite [
	"Returns whether these options allow reading."

	^self isWritable
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
UnixFileOpeningOptions >> directory [

	flags := flags bitOr: self O_DIRECTORY
]

{ #category : 'options' }
UnixFileOpeningOptions >> exclusive [

	flags := flags bitOr: self O_EXCL
]

{ #category : 'accessing' }
UnixFileOpeningOptions >> flags [

	^flags
]

{ #category : 'initialization' }
UnixFileOpeningOptions >> initialize [

	flags := 0.
	accessModeSet := false
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
UnixFileOpeningOptions >> isDirectory [
	^ (flags bitAnd: self O_DIRECTORY) = self O_DIRECTORY
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isExclusive [
	^ (flags bitAnd: self O_EXCL) = self O_EXCL
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isNoFollow [
	^ (flags bitAnd: self O_NOFOLLOW) = self O_NOFOLLOW
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isReadable [

	^self isReadOnly or: [self isReadWrite]
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
UnixFileOpeningOptions >> isTruncate [
	^ (flags bitAnd: self O_TRUNC) = self O_TRUNC
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isWritable [

	^self isWriteOnly or: [self isReadWrite]
]

{ #category : 'testing' }
UnixFileOpeningOptions >> isWriteOnly [
	^ (flags bitAnd: self O_ACCMODE) = self O_WRONLY
]

{ #category : 'accessing' }
UnixFileOpeningOptions >> mode [

	^mode
]

{ #category : 'accessing' }
UnixFileOpeningOptions >> modeBits [
	"If mode has not been explicitly set, answer all read and write. 
	This will be modified by the user's umask when creating a file."

	^mode ifNotNil: [mode modeBits] ifNil: [8r666]
]

{ #category : 'options' }
UnixFileOpeningOptions >> noFollow [

	flags := flags bitOr: self O_NOFOLLOW
]

{ #category : 'options' }
UnixFileOpeningOptions >> nonBlocking [
	"We do not current support the O_NONBLOCK option.
	Support may be added in the future."

	self signalImproperOperation: 'Non-blocking file opening is not supported.'
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_ACCMODE [
	"Access mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_APPEND [
	"Append to the file"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_CLOEXEC [
	"Close file descriptor when calling any exec family function"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_CREAT [
	"Create file if it does not exist"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_DIRECTORY [
	"Fail opening a non-directory file."

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_DSYNC [
	"Synchronized writes"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_EXCL [
	"Exclusive use flag"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_NOCTTY [
	"Don't assign a controlling terminal"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_NOFOLLOW [
	"Don't follow symlinks"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_NONBLOCK [
	"Non-blocking mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_RDONLY [
	"Read-only mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_RDWR [
	"Read-write mode"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_SYNC [
	"Synchronized writes"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_TRUNC [
	"Truncate the file"

	self subclassResponsibility
]

{ #category : 'private-constants' }
UnixFileOpeningOptions >> O_WRONLY [
	"Write-only mode"

	self subclassResponsibility
]

{ #category : 'access modes' }
UnixFileOpeningOptions >> readOnly [
	"Set the access mode to read-only"

	self _accessMode: self O_RDONLY
]

{ #category : 'access modes' }
UnixFileOpeningOptions >> readWrite [
	"Set the access mode to read-write mode"

	self _accessMode: self O_RDWR
]

{ #category : 'options' }
UnixFileOpeningOptions >> sync [

	flags := flags bitOr: self O_SYNC
]

{ #category : 'options' }
UnixFileOpeningOptions >> truncate [

	self isReadOnly
		ifTrue: [self signalImproperOperation: 'Specifying truncate and readOnly is undefined behavior'].
	flags := flags bitOr: self O_TRUNC
]

{ #category : 'access modes' }
UnixFileOpeningOptions >> writeOnly [
	"Set the access mode to write-only mode"

	self _accessMode: self O_WRONLY
]
