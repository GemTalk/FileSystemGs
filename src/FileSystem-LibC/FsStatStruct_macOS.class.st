"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Represents macOS's stat struct
"
Class {
	#name : 'FsStatStruct_macOS',
	#superclass : 'FsStatStruct',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsStatStruct_macOS class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]

{ #category : 'accessing' }
FsStatStruct_macOS >> accessTime [

	^FsTimespecStruct forBytes: (self st_atimespec)
]

{ #category : 'accessing' }
FsStatStruct_macOS >> changeTime [

	^FsTimespecStruct forBytes: (self st_ctimespec)
]

{ #category : 'accessing' }
FsStatStruct_macOS >> deviceId [
	"Return the device id associated with this file."

	^self st_dev
]

{ #category : 'accessing' }
FsStatStruct_macOS >> gid [
	"Return the group id associated with this file."

	^self st_gid
]

{ #category : 'accessing' }
FsStatStruct_macOS >> inode [
	"Return the inode."

	^self st_ino
]

{ #category : 'testing' }
FsStatStruct_macOS >> isBlock [
	"true for a block device"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifblk
]

{ #category : 'testing' }
FsStatStruct_macOS >> isCharacter [
	"true for a character device"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifchr
]

{ #category : 'testing' }
FsStatStruct_macOS >> isDirectory [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifdir
]

{ #category : 'testing' }
FsStatStruct_macOS >> isFifo [
	"true for a fifio"

	^(self st_mode bitAnd: self s_ifmt) == self s_ififo
]

{ #category : 'testing' }
FsStatStruct_macOS >> isFile [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifreg
]

{ #category : 'testing' }
FsStatStruct_macOS >> isSocket [
	"true for a socket"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifsock
]

{ #category : 'testing' }
FsStatStruct_macOS >> isSymlink [

	^(self st_mode bitAnd: self s_ifmt) == self s_iflnk
]

{ #category : 'accessing' }
FsStatStruct_macOS >> mode [
	"Returns the mode of the file."

	^self st_mode
]

{ #category : 'accessing' }
FsStatStruct_macOS >> modificationTime [

	^FsTimespecStruct forBytes: (self st_mtimespec)
]

{ #category : 'accessing' }
FsStatStruct_macOS >> numberOfHardLinks [
	"Return the number of hard links."

	^self st_nlink
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifblk [
	"block device"

	^8r0060000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifchr [
	"character device"

	^8r0020000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifdir [
	"directory"

	^8r0040000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ififo [
	"FIFO"

	^8r0010000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_iflnk [
	"symbolic link"

	^8r0120000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifmt [
	"bit mask for the file type bit field"

	^8r0170000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifreg [
	"regular file"

	^8r0100000
]

{ #category : 'private-masks' }
FsStatStruct_macOS >> s_ifsock [
	"socket"

	^8r0140000
]

{ #category : 'accessing' }
FsStatStruct_macOS >> size [
	"Returns the size of the file when stat was called."

	^self st_size
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_atimespec [

	^bytes CByteArrayFrom: 32 to: 47
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_blksize [

	^bytes uint32At: 112
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_blocks [

	^bytes uint64At: 104
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_ctimespec [

	^bytes CByteArrayFrom: 64 to: 79
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_dev [

	^bytes uint32At: 0
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_gid [

	^bytes uint32At: 20
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_ino [

	^bytes uint64At: 8
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_mode [

	^bytes uint16At: 4
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_mtimespec [

	^bytes CByteArrayFrom: 48 to: 63
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_nlink [

	^bytes uint16At: 6
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_rdev [

	^bytes uint32At: 24
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_size [

	^bytes uint64At: 96
]

{ #category : 'private-accessing' }
FsStatStruct_macOS >> st_uid [

	^bytes uint32At: 16
]

{ #category : 'accessing' }
FsStatStruct_macOS >> uid [
	"Return the user id associated with this file."

	^self st_uid
]
