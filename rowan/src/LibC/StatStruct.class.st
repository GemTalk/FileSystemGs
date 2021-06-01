"
This class represents 'struct stat'. The offsets and sizes were calculated using the following code.


```c
#include <fcntl.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stddef.h>

int main() {
  struct stat xlerb;
  stat(""/"", &xlerb);
  printf(""size: %li\n"", sizeof(struct stat));
  printf(""st_dev     offset: %li size: %li\n"", offsetof(struct stat, st_dev), sizeof(dev_t));
  printf(""st_ino     offset: %li size: %li\n"", offsetof(struct stat, st_ino), sizeof(ino_t));
  printf(""st_mode    offset: %li size: %li\n"", offsetof(struct stat, st_mode), sizeof(mode_t));
  printf(""st_nlink   offset: %li size: %li\n"", offsetof(struct stat, st_nlink), sizeof(nlink_t));
  printf(""st_uid     offset: %li size: %li\n"", offsetof(struct stat, st_uid), sizeof(uid_t));
  printf(""st_gid     offset: %li size: %li\n"", offsetof(struct stat, st_gid), sizeof(gid_t));
  printf(""st_rdev    offset: %li size: %li\n"", offsetof(struct stat, st_rdev), sizeof(dev_t));
  printf(""st_size    offset: %li size: %li\n"", offsetof(struct stat, st_size), sizeof(off_t));
  printf(""st_blksize offset: %li size: %li\n"", offsetof(struct stat, st_blksize), 0);
  printf(""st_blocks  offset: %li size: %li\n"", offsetof(struct stat, st_blocks), 0);
  printf(""st_atim    offset: %li size: %li\n"", offsetof(struct stat, st_atim), sizeof(struct timespec));
  printf(""st_mtim    offset: %li size: %li\n"", offsetof(struct stat, st_mtim), sizeof(struct timespec));
  printf(""st_ctim    offset: %li size: %li\n"", offsetof(struct stat, st_ctim), sizeof(struct timespec));

  return 0;
}
```
"
Class {
	#name : 'StatStruct',
	#superclass : 'CStructure',
	#category : 'LibC'
}

{ #category : 'instance creation' }
StatStruct class >> new [
	"Create an uninistalized instance of the stat struct"

	^super forBytes: (CByteArray gcMalloc: self structSize)
]

{ #category : 'accessing' }
StatStruct class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]

{ #category : 'testing' }
StatStruct >> isDirectory [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifdir
]

{ #category : 'testing' }
StatStruct >> isFile [

	^(self st_mode bitAnd: self s_ifmt) == self s_ifreg
]

{ #category : 'testing' }
StatStruct >> isSymlink [

	^(self st_mode bitAnd: self s_ifmt) == self s_iflnk
]

{ #category : 'private-masks' }
StatStruct >> s_ifblk [
	"block device"

	^8r0060000
]

{ #category : 'private-masks' }
StatStruct >> s_ifchr [
	"character device"

	^8r0020000
]

{ #category : 'private-masks' }
StatStruct >> s_ifdir [
	"directory"

	^8r0040000
]

{ #category : 'private-masks' }
StatStruct >> s_ififo [
	"FIFO"

	^8r0010000
]

{ #category : 'private-masks' }
StatStruct >> s_iflnk [
	"symbolic link"

	^8r0120000
]

{ #category : 'private-masks' }
StatStruct >> s_ifmt [
	"bit mask for the file type bit field"

	^8r0170000
]

{ #category : 'private-masks' }
StatStruct >> s_ifreg [
	"regular file"

	^8r0100000
]

{ #category : 'private-masks' }
StatStruct >> s_ifsock [
	"socket"

	^8r0140000
]

{ #category : 'accessing' }
StatStruct >> size [
	"Returns the size of the file in bytes."

	^self st_size
]

{ #category : 'private-accessing' }
StatStruct >> st_atim [

	"st_atim is 16 bytes starting at 72"
	Error signal: 'st_atim is not yet implemented'
]

{ #category : 'private-accessing' }
StatStruct >> st_blksize [

	^bytes uint64At: 56
]

{ #category : 'private-accessing' }
StatStruct >> st_blocks [

	^bytes uint64At: 64
]

{ #category : 'private-accessing' }
StatStruct >> st_ctim [

	"st_ctim is 16 bytes starting at 104"
	Error signal: 'st_ctim is not yet implemented'
]

{ #category : 'private-accessing' }
StatStruct >> st_dev [

	^bytes uint64At: 0
]

{ #category : 'private-accessing' }
StatStruct >> st_gid [

	^bytes uint32At: 32
]

{ #category : 'private-accessing' }
StatStruct >> st_ino [

	^bytes uint64At: 0
]

{ #category : 'private-accessing' }
StatStruct >> st_mode [

	^bytes uint32At: 24
]

{ #category : 'private-accessing' }
StatStruct >> st_mtim [

	"st_mtim is 16 bytes starting at 88"
	Error signal: 'st_mtim is not yet implemented'
]

{ #category : 'private-accessing' }
StatStruct >> st_nlink [

	^bytes uint64At: 16
]

{ #category : 'private-accessing' }
StatStruct >> st_rdev [

	^bytes uint64At: 40
]

{ #category : 'private-accessing' }
StatStruct >> st_size [

	^bytes uint64At: 48
]

{ #category : 'private-accessing' }
StatStruct >> st_uid [

	^bytes uint32At: 28
]
