"
FsPrimitive provides an interface to the FileSystemGs C library. Primitive actions are made available via this class.
"
Class {
	#name : 'FsUnixPrimitive',
	#superclass : 'Object',
	#instVars : [
		'library',
		'opendir',
		'closedir',
		'readdir',
		'open',
		'chmod',
		'fstat',
		'stat',
		'lstat',
		'mkdir',
		'rename',
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
		'pread',
		'symlink'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'instance creation' }
FsUnixPrimitive class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> chdir: pathString [

	| errnoHolder result |
	chdir == nil
		ifTrue:
			[chdir := CCallout
				library: library
				name: 'gs_fs_chdir'
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

{ #category : 'interface-fcntl' }
FsUnixPrimitive >> chmod: pathString
mode: mode [

	| errnoHolder result |
	chmod == nil
		ifTrue: [chmod := CCallout
			library: library
			name: 'gs_fs_chmod'
			result: #'int32'
			args: #(#'const char*' #'uint32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := chmod
		callWith: { pathString encodeAsUTF8. mode }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> chown: pathString
uid: uidInteger
gid: gidInteger [

	| errnoHolder result |
	chown == nil
		ifTrue:
			[chown := CCallout
				library: library
				name: 'gs_fs_chown'
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

{ #category : 'interface-unistd' }
FsUnixPrimitive >> close: fdInteger [

	| errnoHolder result |
	close == nil
		ifTrue:
			[close := CCallout
				library: library
				name: 'gs_fs_close'
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

{ #category : 'interface-dirent' }
FsUnixPrimitive >> closeDirectoryStream: dirPtr [

	| errnoHolder result |
	closedir == nil
		ifTrue:
			[closedir := CCallout
				library: library
				name: 'gs_fs_closedir'
				result: #'int32'
				args: #(#'ptr')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := closedir
		callWith: { dirPtr }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-stat' }
FsUnixPrimitive >> fstat: fd [

	| statStruct errnoHolder status |
	fstat == nil
		ifTrue:
			[fstat := CCallout
				library: library
				name: 'gs_fs_fstat'
				result: #'int32'
				args: #(#'int32' #'ptr')
				varArgsAfter: -1].
	statStruct := self statStructClass new.
	errnoHolder := { 0 }.
	status := fstat
		callWith: { fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> ftruncate: fileDescriptor
to: length [

	| errnoHolder result |
	ftruncate == nil
		ifTrue:
			[ftruncate := CCallout
				library: library
				name: 'gs_fs_ftruncate'
				result: #'int32' "Should this be int64?"
				args: #(#'int32' #'int64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := ftruncate
		callWith: { fileDescriptor. length }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> getcwd [
	"Possible exceptions:
	EACCESS  if the user doesn't have read or search permission on a component of the path
	ENOENT if the current working directory has been unlinked
	ENOMEM if the attempt to malloc the string fails"

	| errnoHolder result |
	getcwd == nil
		ifTrue:
			[getcwd := CCallout
				library: library
				name: 'gs_fs_getcwd'
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

{ #category : 'error handling' }
FsUnixPrimitive >> handleErrno: errorNumber [
	" Default handling of system errors: just signal the default exception class for the error.
	Subclasses may override this method for specific errors that need other handling."

	| errorClass |
	errorClass := FsUnixError errorClassForErrorNumber: errorNumber.
	^ errorClass signal
]

{ #category : 'initialization' }
FsUnixPrimitive >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
FsUnixPrimitive >> libraryName [
	"Returns the name or path to the library that should be loaded."

	^'libFileSystemGs.so'
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> lseek: descriptor
offset: offset
whence: whence [

	| errnoHolder result |
	lseek == nil
		ifTrue:
			[lseek := CCallout
				library: library
				name: 'gs_fs_lseek'
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

{ #category : 'interface-stat' }
FsUnixPrimitive >> lstat: pathString [

	| statStruct errnoHolder status |
	lstat == nil
		ifTrue:
			[lstat := CCallout
				library: library
				name: 'gs_fs_lstat'
				result: #'int32'
				args: #(#'const char*' #'ptr')
				varArgsAfter: -1].
	statStruct := self statStructClass new.
	errnoHolder := { 0 }.
	status := lstat
		callWith: { pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'interface-stat' }
FsUnixPrimitive >> mkdir: pathString [

	| errnoHolder status |
	mkdir == nil
		ifTrue:
			[mkdir := CCallout
				library: library
				name: 'gs_fs_mkdir'
				result: #'int32'
				args: #(#'const char*' #'uint32')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := mkdir
		callWith: { pathString encodeAsUTF8. 8r0777. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]

{ #category : 'interface-fcntl' }
FsUnixPrimitive >> open: pathString flags: flagsInteger mode: modeInteger [

	| errnoHolder result |
	open == nil
		ifTrue: [open := CCallout
			library: library
			name: 'gs_fs_open'
			result: #'int32'
			args: #(#'const char*' #'int32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := open
		callWith: { pathString encodeAsUTF8. flagsInteger. #'int32'. modeInteger. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-dirent' }
FsUnixPrimitive >> openDirectoryStreamWithPath: pathString [
	"This result is not automatically freed.
	The caller is expected to ensure
	#closeDirectoryStream: is always called."

	| result errnoHolder |
	opendir == nil
		ifTrue:
			[opendir := CCallout
				library: library
				name: 'gs_fs_opendir'
				result: #'ptr'
				args: #(#'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := opendir
		callWith: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result isNull
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> pread: fd
into: buf
count: bytes
startingAt: offset [

	| errnoHolder result |
	pread == nil
		ifTrue:
			[pread := CCallout
				library: library
				name: 'gs_fs_pread'
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

{ #category : 'interface-unistd' }
FsUnixPrimitive >> read: fd into: buf count: bytes [

	| errnoHolder result |
	read == nil
		ifTrue:
			[read := CCallout
				library: library
				name: 'gs_fs_read'
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

{ #category : 'interface-dirent' }
FsUnixPrimitive >> readFromDirectoryStream: dirPointer [
	"Answers a DirentStruct. It will answer true to #isNull if we've reached
	the end of the directory stream. Should probably raise an end of stream
	at this point instead."

	| errnoHolder direntPtr isNull errno |
	readdir == nil
		ifTrue:
			[readdir := CCallout
				library: library
				name: 'gs_fs_readdir'
				result: #'ptr'
				args: #(#'ptr')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	direntPtr := readdir
		callWith: { dirPointer }
		errno: errnoHolder.
	isNull := direntPtr isNull.
	errno := errnoHolder first.
	isNull & (errno ~~ 0)
		ifTrue: [self handleErrno: errno].
	^isNull
		ifTrue: [nil]
		ifFalse: [FsDirentStruct_Linux forBytes: (CByteArray fromCPointer: direntPtr numBytes: FsDirentStruct_Linux structSize)]
]

{ #category : 'interface-stdio' }
FsUnixPrimitive >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	rename == nil
		ifTrue:
			[rename := CCallout
				library: library
				name: 'gs_fs_rename'
				result: #'int32'
				args: #(#'const char*' #'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := rename
		callWith: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> rmdir: pathString [

	| errnoHolder result |
	rmdir == nil
		ifTrue:
			[rmdir := CCallout
				library: library
				name: 'gs_fs_rmdir'
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

{ #category : 'interface-stat' }
FsUnixPrimitive >> stat: pathString [

	| statStruct errnoHolder status |
	stat == nil
		ifTrue:
			[stat := CCallout
				library: library
				name: 'gs_fs_stat'
				result: #'int32'
				args: #(#'const char*' #'ptr')
				varArgsAfter: -1].
	statStruct := self statStructClass new.
	errnoHolder := { 0 }.
	status := stat
		callWith: { pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'interface-stat' }
FsUnixPrimitive >> statStructClass [
	"Temporary"

	^FsStatStruct_Linux_x64
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> symlink: linkPathString
toTarget: targetPathString [
	"Create a symlink from linkPathString to targetPathString."

	| errnoHolder result |
	symlink == nil
		ifTrue:
			[symlink := CCallout
				library: library
				name: 'gs_fs_symlink'
				result: #'int32'
				args: #(#'const char*' #'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := symlink
		callWith: { targetPathString encodeAsUTF8. linkPathString encodeAsUTF8. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'interface-unistd' }
FsUnixPrimitive >> unlinkPath: pathString [

	| errnoHolder result |
	unlink == nil
		ifTrue:
			[unlink := CCallout
				library: library
				name: 'gs_fs_unlink'
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

{ #category : 'interface-unistd' }
FsUnixPrimitive >> write: fd from: buf count: bytes [

	| errnoHolder result |
	write == nil
		ifTrue:
			[write := CCallout
				library: library
				name: 'gs_fs_write'
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
