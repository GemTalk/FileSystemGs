"
Part of FileSystem

=========

x64-specific direct.h changes
"
Class {
	#name : 'FsLibcDirent_macOS_x64',
	#superclass : 'FsLibcDirent_macOS',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsLibcDirent_macOS_x64 >> opendirName [
	"Returns the name of the opendir function"

	^'opendir$INODE64'
]

{ #category : 'accessing' }
FsLibcDirent_macOS_x64 >> readdirName [
	"Returns the name of the readdir function"

	^'readdir$INODE64'
]
