"
Part of FileSystem

=========

Represents common aspects of Linux's stat struct
"
Class {
	#name : 'FsStatStruct_Linux',
	#superclass : 'FsStatStruct',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsStatStruct_Linux >> accessTime [

	^FsTimespecStruct forBytes: (self st_atim)
]

{ #category : 'accessing' }
FsStatStruct_Linux >> changeTime [

	^FsTimespecStruct forBytes: (self st_ctim)
]

{ #category : 'accessing' }
FsStatStruct_Linux >> deviceId [
	"Return the device id associated with this file."

	^self st_dev
]

{ #category : 'accessing' }
FsStatStruct_Linux >> gid [
	"Return the group id associated with this file."

	^self st_gid
]

{ #category : 'accessing' }
FsStatStruct_Linux >> inode [
	"Return the inode."

	^self st_ino
]

{ #category : 'testing' }
FsStatStruct_Linux >> isBlock [
	"true for a block device"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifblk
]

{ #category : 'testing' }
FsStatStruct_Linux >> isCharacter [
	"true for a character device"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifchr
]

{ #category : 'testing' }
FsStatStruct_Linux >> isDirectory [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifdir
]

{ #category : 'testing' }
FsStatStruct_Linux >> isFifo [
	"true for a fifio"

	^(self st_mode bitAnd: self s_ifmt) == self s_ififo
]

{ #category : 'testing' }
FsStatStruct_Linux >> isFile [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifreg
]

{ #category : 'testing' }
FsStatStruct_Linux >> isSocket [
	"true for a socket"

	^(self st_mode bitAnd: self s_ifmt) == self s_ifsock
]

{ #category : 'testing' }
FsStatStruct_Linux >> isSymlink [

	^(self st_mode bitAnd: self s_ifmt) == self s_iflnk
]

{ #category : 'accessing' }
FsStatStruct_Linux >> mode [
	"Returns the mode of the file."

	^self st_mode
]

{ #category : 'accessing' }
FsStatStruct_Linux >> modificationTime [

	^FsTimespecStruct forBytes: (self st_mtim)
]

{ #category : 'accessing' }
FsStatStruct_Linux >> numberOfHardLinks [
	"Return the number of hard links."

	^self st_nlink
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifblk [
	"block device"

	^8r0060000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifchr [
	"character device"

	^8r0020000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifdir [
	"directory"

	^8r0040000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ififo [
	"FIFO"

	^8r0010000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_iflnk [
	"symbolic link"

	^8r0120000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifmt [
	"bit mask for the file type bit field"

	^8r0170000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifreg [
	"regular file"

	^8r0100000
]

{ #category : 'private-masks' }
FsStatStruct_Linux >> s_ifsock [
	"socket"

	^8r0140000
]

{ #category : 'accessing' }
FsStatStruct_Linux >> size [
	"Returns the size of the file when stat was called."

	^self st_size
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_atim [

	^bytes CByteArrayFrom: 72 to: 87
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_blksize [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_blocks [

	^bytes uint64At: 64
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_ctim [

	^bytes CByteArrayFrom: 104 to: 119
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_dev [

	^bytes uint64At: 0
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_gid [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_ino [

	^bytes uint64At: 8
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_mode [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_mtim [

	^bytes CByteArrayFrom: 88 to: 103
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_nlink [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_rdev [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_size [

	^bytes uint64At: 48
]

{ #category : 'private-accessing' }
FsStatStruct_Linux >> st_uid [

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct_Linux >> uid [
	"Return the user id associated with this file."

	^self st_uid
]
