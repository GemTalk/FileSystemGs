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
StatStruct >> accessTime [
	"Returns the access time associated with the file when stat was called."

	self subclassResponsibility
]

{ #category : 'accessing' }
StatStruct >> inode [
	"Return the inode."

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isBlock [
	"true for a block device"

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isCharacter [
	"true for a character device"

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isDirectory [
	"Returns true if the stat was performed on a directory."

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isFifo [
	"true for a fifio"

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isFile [
	"Returns true if the stat was performed on a normal file."

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isSocket [
	"true for a socket"

	self subclassResponsibility
]

{ #category : 'testing' }
StatStruct >> isSymlink [
	"Returns true if the stat was performed on a symbolic link."

	self subclassResponsibility
]

{ #category : 'accessing' }
StatStruct >> mode [
	"Returns the mode of the file."

	self subclassResponsibility
]

{ #category : 'accessing' }
StatStruct >> modificationTime [
	"Returns the modification time associated with the file when stat was called."

	self subclassResponsibility
]

{ #category : 'accessing' }
StatStruct >> numberOfHardLinks [
	"Return the number of hard links."

	self subclassResponsibility
]

{ #category : 'accessing' }
StatStruct >> size [
	"Returns the size of the file when stat was called."

	self subclassResponsibility
]
