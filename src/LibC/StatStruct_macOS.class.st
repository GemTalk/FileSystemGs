Class {
	#name : 'StatStruct_macOS',
	#superclass : 'StatStruct',
	#category : 'LibC'
}

{ #category : 'accessing' }
StatStruct_macOS class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]

{ #category : 'accessing' }
StatStruct_macOS >> accessTime [

	^TimespecStruct forBytes: (self st_atimespec)
]

{ #category : 'accessing' }
StatStruct_macOS >> changeTime [

	^TimespecStruct forBytes: (self st_ctimespec)
]

{ #category : 'accessing' }
StatStruct_macOS >> inode [
	"Return the inode."

	^self st_ino
]

{ #category : 'testing' }
StatStruct_macOS >> isDirectory [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifdir
]

{ #category : 'testing' }
StatStruct_macOS >> isFile [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifreg
]

{ #category : 'testing' }
StatStruct_macOS >> isSymlink [

	^(self st_mode bitAnd: self s_ifmt) == self s_iflnk
]

{ #category : 'accessing' }
StatStruct_macOS >> mode [
	"Returns the mode of the file."

	^self st_mode
]

{ #category : 'accessing' }
StatStruct_macOS >> modificationTime [

	^TimespecStruct forBytes: (self st_mtimespec)
]

{ #category : 'accessing' }
StatStruct_macOS >> numberOfHardLinks [
	"Return the number of hard links."

	^self st_nlink
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifblk [
	"block device"

	^8r0060000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifchr [
	"character device"

	^8r0020000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifdir [
	"directory"

	^8r0040000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ififo [
	"FIFO"

	^8r0010000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_iflnk [
	"symbolic link"

	^8r0120000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifmt [
	"bit mask for the file type bit field"

	^8r0170000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifreg [
	"regular file"

	^8r0100000
]

{ #category : 'private-masks' }
StatStruct_macOS >> s_ifsock [
	"socket"

	^8r0140000
]

{ #category : 'accessing' }
StatStruct_macOS >> size [
	"Returns the size of the file when stat was called."

	^self st_size
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_atimespec [

	^bytes CByteArrayFrom: 32 to: 47
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_blksize [

	^bytes uint32At: 112
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_blocks [

	^bytes uint64At: 104
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_ctimespec [

	^bytes CByteArrayFrom: 64 to: 79
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_dev [

	^bytes uint32At: 0
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_gid [

	^bytes uint32At: 20
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_ino [

	^bytes uint64At: 8
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_mode [

	^bytes uint16At: 4
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_mtimespec [

	^bytes CByteArrayFrom: 48 to: 63
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_nlink [

	^bytes uint16At: 6
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_rdev [

	^bytes uint32At: 24
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_size [

	^bytes uint64At: 96
]

{ #category : 'private-accessing' }
StatStruct_macOS >> st_uid [

	^bytes uint32At: 16
]
