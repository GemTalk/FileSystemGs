"
The libc dirent structure, as returned by the libc call readdir().
"
Class {
	#name : 'DirentStruct',
	#superclass : 'CStructure',
	#category : 'LibC'
}

{ #category : 'accessing' }
DirentStruct >> basename [

	^self d_name decodeFromUTF8ToString
]

{ #category : 'private-accessing' }
DirentStruct >> d_name [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
DirentStruct >> d_type [

	self subclassResponsibility
]

{ #category : 'private-masks' }
DirentStruct >> dt_blk [
	"Block Device"

	^6
]

{ #category : 'private-masks' }
DirentStruct >> dt_chr [
	"Character device"

	^2
]

{ #category : 'private-masks' }
DirentStruct >> dt_dir [
	"Directory"

	^4
]

{ #category : 'private-masks' }
DirentStruct >> dt_fifo [
	"Named pipe"

	^1
]

{ #category : 'private-masks' }
DirentStruct >> dt_lnk [
	"Symbolic Link"

	^10
]

{ #category : 'private-masks' }
DirentStruct >> dt_reg [
	"regular file"

	^8
]

{ #category : 'private-masks' }
DirentStruct >> dt_sock [
	"Unix domain socket"

	^12
]

{ #category : 'private-masks' }
DirentStruct >> dt_unknown [
	"The file type could not be determined."

	^0
]

{ #category : 'private-masks' }
DirentStruct >> dt_what [
	"Whiteout entry in a union filesystem."

	^14
]

{ #category : 'testing' }
DirentStruct >> isDirectory [
	"Does this struct represent a directory?"

	^self d_type == self dt_dir
]

{ #category : 'testing' }
DirentStruct >> isFile [
	"Does this struct represent a file?"

	^self d_type == self dt_reg
]
