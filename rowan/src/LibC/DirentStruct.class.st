"
The libc dirent structure, as returned by the libc call readdir().
"
Class {
	#name : 'DirentStruct',
	#superclass : 'CStructure',
	#category : 'LibC'
}

{ #category : 'accessing' }
DirentStruct >> d_ino [
	"Inode"

	^ bytes uint64At: 0
]

{ #category : 'accessing' }
DirentStruct >> d_name [
	"Retrieve the name of the entry, as a Smalltalk ByteArray.
	This may need to undergo decoding to make sense 
	in a filesystem that uses, for instance, UTF-8 encoding
	for filenames."

	| startIndex endIndex |
	startIndex := 19.	"Omit the zero termination byte of the name by subtracting one."
	endIndex := self d_reclen - 1.
	^ bytes byteArrayFrom: startIndex to: endIndex
]

{ #category : 'accessing' }
DirentStruct >> d_off [
	"Not really an offset. 
     An opaque indicator of the position in the directory stream."

	^ bytes int64At: 8
]

{ #category : 'accessing' }
DirentStruct >> d_reclen [
	"Size in bytes of the structure, which will vary based on the size of the name field."

	^ bytes uint16At: 16
]

{ #category : 'accessing' }
DirentStruct >> d_type [
	"Integer containing type of the entry. One of:
	0  DT_UNKNOWN  The file type could not be determined. Some filesystem types will always give this value.
	1  DT_FIFO     This is a named pipe (FIFO).
	2  DT_CHR      This is a character device.
	4  DT_DIR      This is a directory.
	6  DT_BLK      This is a block device.
	8  DT_REG      This is a regular file.
	10 DT_LNK      This is a symbolic link.
	12 DT_SOCK     This is a UNIX domain socket.
	14 DT_WHAT     A Whiteout entry in a union filesystem.
"

	^ bytes uint8At: 18
]
