"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Interface to unistd.h
"
Class {
	#name : 'FsLibcUnistd',
	#superclass : 'FsLibcInterface',
	#instVars : [
		'close',
		'getcwd',
		'lseek',
		'read',
		'rmdir',
		'ftruncate',
		'unlink',
		'write',
		'chown',
		'chdir',
		'pread'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcUnistd >> chdir: pathString [

	| errnoHolder result |
	chdir == nil
		ifTrue:
			[chdir := CCallout
				library: library
				name: 'chdir'
				result: #'int32'
				args: #(#'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := chdir
		callWith: { pathString }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> chown: pathString
uid: uidInteger
gid: gidInteger [

	| errnoHolder result |
	chown == nil
		ifTrue:
			[chown := CCallout
				library: library
				name: 'chown'
				result: #'int32'
				args: #(#'const char*' #'uint32' #'uint32')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := chown
		callWith: { pathString. uidInteger. gidInteger }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> close: fdInteger [

	| errnoHolder result |
	close == nil
		ifTrue:
			[close := CCallout
				library: library
				name: 'close'
				result: #'int32'
				args: #(#'int32')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := close
		callWith: { fdInteger }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> ftruncate: fileDescriptor
to: length [

	self subclassResponsibility
]

{ #category : 'functions' }
FsLibcUnistd >> getcwd [
	"Possible exceptions:
	EACCESS  if the user doesn't have read or search permission on a component of the path
	ENOENT if the current working directory has been unlinked
	ENOMEM if the attempt to malloc the string fails"

	| errnoHolder result |
	getcwd == nil
		ifTrue:
			[getcwd := CCallout
				library: library
				name: 'getcwd'
				result: #'char*'
				args: #(#'ptr' #'uint64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := getcwd
		callWith: { nil. 0 } "Dynamically allocate a buffer for the full path."
		errno: errnoHolder.
	result == nil "The FFI will return nil for NULL char* return values."
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> lseek: descriptor
offset: offset
whence: whence [

	| errnoHolder result |
	lseek == nil
		ifTrue:
			[lseek := CCallout
				library: library
				name: 'lseek'
				result: #'int64'
				args: #(#'int32' #'int64' #'int32')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := lseek
		callWith: { descriptor. offset. whence. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> pread: fd
into: buf
count: bytes
startingAt: offset [

	| errnoHolder result |
	pread == nil
		ifTrue:
			[pread := CCallout
				library: library
				name: 'pread'
				result: #'int64'
				args: #(#'int32' #'ptr' #'uint64' #'uint64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := pread
		callWith: { fd. buf. bytes. offset. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> read: fd into: buf count: bytes [

	| errnoHolder result |
	read == nil
		ifTrue:
			[read := CCallout
				library: library
				name: 'read'
				result: #'int64'
				args: #(#'int32' #'ptr' #'uint64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := read
		callWith: { fd. buf. bytes. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> rmdir: pathString [

	| errnoHolder result |
	rmdir == nil
		ifTrue:
			[rmdir := CCallout
				library: library
				name: 'rmdir'
				result: #'int32'
				args: #(#'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := rmdir
		callWith: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> unlinkPath: pathString [

	| errnoHolder result |
	unlink == nil
		ifTrue:
			[unlink := CCallout
				library: library
				name: 'unlink'
				result: #'int32'
				args: #(#'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := unlink
		callWith: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
FsLibcUnistd >> write: fd from: buf count: bytes [

	| errnoHolder result |
	write == nil
		ifTrue:
			[write := CCallout
				library: library
				name: 'write'
				result: #'int64'
				args: #(#'int32' #'ptr' #'uint64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := write
		callWith: { fd. buf. bytes. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]
