"
Part of FileSystem

=========

arm64-specific dirent.h modifications
"
Class {
	#name : 'FsLibcDirent_macOS_arm64',
	#superclass : 'FsLibcDirent_macOS',
	#category : 'LibC'
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
