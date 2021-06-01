Class {
	#name : 'LibcUnistd',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd >> closeFd: fdInteger [

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
LibcUnistd >> getCurrentDirName [
	"Possible exceptions:
	EACCESS  if the user doesn't have read or search permission on a component of the path
	ENOENT if the current working directory has been unlinked
	ENOMEM if the attempt to malloc the string fails"

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		getcwd: { CPointer newNull. 0 } "Dynamically allocate a buffer for the full path."
		errno: errnoHolder.
	result == nil "The FFI will return nil for NULL char* return values."
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd >> readFromFileDescriptor: fd toBuffer: buf count: bytes [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		read: { fd. buf. bytes. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd >> rmdir: pathString [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		rmdir: { pathString }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'functions' }
LibcUnistd >> unlinkPath: pathString [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		unlink: { pathString }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
LibcUnistd >> wrappedClass [
	^ _libcUnistd
]

{ #category : 'functions' }
LibcUnistd >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [

	| errnoHolder result |
	errnoHolder := { 0 }.
	result := library
		write: { fd. buf. bytes. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]
