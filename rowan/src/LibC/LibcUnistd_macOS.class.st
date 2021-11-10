Class {
	#name : 'LibcUnistd_macOS',
	#superclass : 'LibcUnistd',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd_macOS >> closeFd: fdInteger [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		close: { fdInteger }
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
	errnoHolder := { 0 }.
	result := library
		getcwd: { nil. 0 } "Dynamically allocate a buffer for the full path."
		errno: errnoHolder.
	result == nil "The FFI will return nil for NULL char* return values."
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd_macOS >> lseek: descriptor
offset: offset
whence: whence [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		lseek: { descriptor. offset. whence. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd_macOS >> rmdir: pathString [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		rmdir: { pathString encodeAsUTF8 }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd_macOS >> truncate: fileDescriptor
to: length [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		ftruncate: { fileDescriptor. length }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd_macOS >> unlinkPath: pathString [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		unlink: { pathString encodeAsUTF8 }
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
	errnoHolder := { 0 }.
	result := library
		write: { fd. buf. bytes. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]
