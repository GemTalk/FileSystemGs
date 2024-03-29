"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

The libc dirent structure, as returned by the libc call readdir().
"
Class {
	#name : 'FsDirentStruct',
	#superclass : 'FsCStructure',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsDirentStruct >> basename [

	^self d_name decodeFromUTF8ToString
]

{ #category : 'private-accessing' }
FsDirentStruct >> d_name [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsDirentStruct >> d_type [

	self subclassResponsibility
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_blk [
	"Block Device"

	^6
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_chr [
	"Character device"

	^2
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_dir [
	"Directory"

	^4
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_fifo [
	"Named pipe"

	^1
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_lnk [
	"Symbolic Link"

	^10
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_reg [
	"regular file"

	^8
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_sock [
	"Unix domain socket"

	^12
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_unknown [
	"The file type could not be determined."

	^0
]

{ #category : 'private-masks' }
FsDirentStruct >> dt_what [
	"Whiteout entry in a union filesystem."

	^14
]

{ #category : 'testing' }
FsDirentStruct >> isDirectory [
	"Does this struct represent a directory?"

	^self d_type == self dt_dir
]

{ #category : 'testing' }
FsDirentStruct >> isFile [
	"Does this struct represent a file?"

	^self d_type == self dt_reg
]

{ #category : 'testing' }
FsDirentStruct >> isUnknown [
	"Is the type of this entry unknown?"

	^self d_type == self dt_unknown
]
