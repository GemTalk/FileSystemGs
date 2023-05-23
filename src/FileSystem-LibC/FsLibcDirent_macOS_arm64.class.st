"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

arm64-specific dirent.h modifications
"
Class {
	#name : 'FsLibcDirent_macOS_arm64',
	#superclass : 'FsLibcDirent_macOS',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcDirent_macOS_arm64 >> opendirName [
	"Returns the name of the opendir function"

	^'opendir'
]

{ #category : 'accessing' }
FsLibcDirent_macOS_arm64 >> readdirName [
	"Returns the name of the readdir function"

	^'readdir'
]
