"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Linux variant of the struct dirent
"
Class {
	#name : 'FsDirentStruct_Linux',
	#superclass : 'FsDirentStruct',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsDirentStruct_Linux class >> structSize [
	"Returns the size in bytes of the C struct."

	^275
]

{ #category : 'accessing' }
FsDirentStruct_Linux >> d_ino [
	"Inode"

	^ bytes uint64At: 0
]

{ #category : 'accessing' }
FsDirentStruct_Linux >> d_name [
	"Retrieve the name of the entry, as a Smalltalk ByteArray.
	This may need to undergo decoding to make sense 
	in a filesystem that uses, for instance, UTF-8 encoding
	for filenames."

	| startIndex recordLength endIndex lastWord firstZeroIndex |
	startIndex := 19.	"Offset of start of name string."
	recordLength := self d_reclen.
	recordLength \\ 8 = 0
		ifFalse: [ self error: 'Record not an integral number of 64-bit words.' ].
	recordLength <= 24
		ifTrue: [ 
			"20 is index of 0 byte for a one-character filename."
			lastWord := bytes byteArrayFrom: 20 to: recordLength - 1.
			firstZeroIndex := lastWord indexOf: 0.
			firstZeroIndex = 0
				ifTrue: [ self error: 'Failed to find zero byte terminating filename.' ].	
			"Subtracting one to not include the zero"
			endIndex := startIndex + firstZeroIndex - 1 ]
		ifFalse: [ 
			lastWord := bytes byteArrayFrom: recordLength - 8 to: recordLength - 1.
			firstZeroIndex := lastWord indexOf: 0.
			firstZeroIndex = 0
				ifTrue: [ self error: 'Failed to find zero byte terminating filename' ].	
	"(recordLength - 10) is the penultimate byte in the penultimate word (if any).
	Adding the index of the first zero in the ultimate word will yield the index of the last
	non-zero byte before the first zero."
			endIndex := recordLength - 10 + firstZeroIndex ].
	^ bytes byteArrayFrom: startIndex to: endIndex
]

{ #category : 'accessing' }
FsDirentStruct_Linux >> d_off [
	"Not really an offset. 
     An opaque indicator of the position in the directory stream."

	^ bytes int64At: 8
]

{ #category : 'accessing' }
FsDirentStruct_Linux >> d_reclen [
	"Size in bytes of the structure, which will vary based on the size of the name field."

	^ bytes uint16At: 16
]

{ #category : 'accessing' }
FsDirentStruct_Linux >> d_type [
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
