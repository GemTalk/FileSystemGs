Class {
	#name : 'StatStruct_Linux',
	#superclass : 'StatStruct',
	#category : 'LibC'
}

{ #category : 'accessing' }
StatStruct_Linux >> accessTime [

	^TimespecStruct forBytes: (self st_atim)
]

{ #category : 'testing' }
StatStruct_Linux >> isDirectory [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifdir
]

{ #category : 'testing' }
StatStruct_Linux >> isFile [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifreg
]

{ #category : 'testing' }
StatStruct_Linux >> isSymlink [

	^(self st_mode bitAnd: self s_ifmt) == self s_iflnk
]

{ #category : 'accessing' }
StatStruct_Linux >> mode [
	"Returns the mode of the file."

	^self st_mode
]

{ #category : 'accessing' }
StatStruct_Linux >> modificationTime [

	^TimespecStruct forBytes: (self st_mtim)
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifblk [
	"block device"

	^8r0060000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifchr [
	"character device"

	^8r0020000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifdir [
	"directory"

	^8r0040000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ififo [
	"FIFO"

	^8r0010000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_iflnk [
	"symbolic link"

	^8r0120000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifmt [
	"bit mask for the file type bit field"

	^8r0170000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifreg [
	"regular file"

	^8r0100000
]

{ #category : 'private-masks' }
StatStruct_Linux >> s_ifsock [
	"socket"

	^8r0140000
]

{ #category : 'accessing' }
StatStruct_Linux >> size [
	"Returns the size of the file when stat was called."

	^self st_size
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_atim [

	^bytes CByteArrayFrom: 72 to: 87
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_blksize [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_blocks [

	^bytes uint64At: 64
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_ctim [

	^bytes CByteArrayFrom: 104 to: 119
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_dev [

	^bytes uint64At: 0
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_gid [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_ino [

	^bytes uint64At: 8
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_mode [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_mtim [

	^bytes CByteArrayFrom: 88 to: 103
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_nlink [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_rdev [

	self subclassResponsibility
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_size [

	^bytes uint64At: 48
]

{ #category : 'private-accessing' }
StatStruct_Linux >> st_uid [

	self subclassResponsibility
]
