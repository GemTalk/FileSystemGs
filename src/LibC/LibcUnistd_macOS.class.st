Class {
	#name : 'LibcUnistd_macOS',
	#superclass : 'LibcUnistd',
	#instVars : [
		'close',
		'getcwd',
		'lseek',
		'read',
		'rmdir',
		'ftruncate',
		'unlink',
		'write'
	],
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd_macOS >> closeFd: fdInteger [

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
LibcUnistd_macOS >> getCurrentDirName [
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

{ #category : 'initialization' }
LibcUnistd_macOS >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
LibcUnistd_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
LibcUnistd_macOS >> lseek: descriptor
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
LibcUnistd_macOS >> readFromFileDescriptor: fd toBuffer: buf count: bytes [

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
LibcUnistd_macOS >> rmdir: pathString [

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
LibcUnistd_macOS >> truncate: fileDescriptor
to: length [

	| errnoHolder result |
	ftruncate == nil
		ifTrue:
			[ftruncate := CCallout
				library: library
				name: 'ftruncate'
				result: #'int64'
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

{ #category : 'functions' }
LibcUnistd_macOS >> unlinkPath: pathString [

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

{ #category : 'accessing' }
LibcUnistd_macOS >> wrappedClass [

	^_libc_unistd_macOS
]

{ #category : 'functions' }
LibcUnistd_macOS >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [

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
