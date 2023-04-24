"
Part of FileSystem

=========

This class represents 'struct stat'.
"
Class {
	#name : 'FsStatStruct',
	#superclass : 'FsCStructure',
	#category : 'FileSystem-LibC'
}

{ #category : 'instance creation' }
FsStatStruct class >> new [
	"Create an uninistalized instance of the stat struct"

	^super forBytes: (CByteArray gcMalloc: self structSize)
]

{ #category : 'accessing' }
FsStatStruct >> accessTime [
	"Returns the access time associated with the file when stat was called."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> deviceId [
	"Return the device id associated with this file."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> gid [
	"Return the group id associated with this file."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> inode [
	"Return the inode."

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isBlock [
	"true for a block device"

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isCharacter [
	"true for a character device"

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isDirectory [
	"Returns true if the stat was performed on a directory."

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isFifo [
	"true for a fifio"

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isFile [
	"Returns true if the stat was performed on a normal file."

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isSocket [
	"true for a socket"

	self subclassResponsibility
]

{ #category : 'testing' }
FsStatStruct >> isSymlink [
	"Returns true if the stat was performed on a symbolic link."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> mode [
	"Returns the mode of the file."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> modificationTime [
	"Returns the modification time associated with the file when stat was called."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> numberOfHardLinks [
	"Return the number of hard links."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> permission [
	"Returns the permission of the file."

	^self mode bitAnd: 8r777 "This should be a mask"
]

{ #category : 'accessing' }
FsStatStruct >> size [
	"Returns the size of the file when stat was called."

	self subclassResponsibility
]

{ #category : 'accessing' }
FsStatStruct >> uid [
	"Return the user id associated with this file."

	self subclassResponsibility
]
