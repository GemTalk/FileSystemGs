Class {
	#name : 'LibcUnistd',
	#superclass : 'LibcWrapper',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd >> closeFd: fdInteger [
	| result errno |
	CCallout errno: 0.
	result := library close_: fdInteger.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcUnistd >> getCurrentDirName [
	"This function mallocs the string, it's up to the sender to free it when done.
	Possible exceptions:
	EACCESS  if the user doesn't have read or search permission on a component of the path
	ENOENT if the current working directory has been unlinked
	ENOMEM if the attempt to malloc the string fails"

	| result errno |
	CCallout errno: 0.
	result := library get_current_dir_name.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcUnistd >> readFromFileDescriptor: fd toBuffer: buf count: bytes [
	| result errno |
	CCallout errno: 0.
	result := library read_: fd _: buf _: bytes.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'functions' }
LibcUnistd >> unlinkPath: pathString [
	| result errno |
	CCallout errno: 0.
	result := library unlink_: pathString.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]

{ #category : 'accessing' }
LibcUnistd >> wrappedClass [
	^ _libcUnistd
]

{ #category : 'functions' }
LibcUnistd >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [
	| result errno |
	CCallout errno: 0.
	result := library write_: fd _: buf _: bytes.
	errno := CCallout errno.

	errno ~~ 0
		ifTrue: [ self handleErrno: errno ].
	^ result
]
