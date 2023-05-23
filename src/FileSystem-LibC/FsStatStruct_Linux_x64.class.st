"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Represents x64-specific aspects of Linux's stat struct
"
Class {
	#name : 'FsStatStruct_Linux_x64',
	#superclass : 'FsStatStruct_Linux',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsStatStruct_Linux_x64 class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_blksize [

	^bytes uint64At: 56
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_gid [

	^bytes uint32At: 32
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_mode [

	^bytes uint32At: 24
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_nlink [

	^bytes uint64At: 16
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_rdev [

	^bytes uint64At: 40
]

{ #category : 'private-accessing' }
FsStatStruct_Linux_x64 >> st_uid [

	^bytes uint32At: 28
]
