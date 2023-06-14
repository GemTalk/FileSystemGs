"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

macOS/x64 interface to stat.h
"
Class {
	#name : 'FsLibcStat_macOS_x64',
	#superclass : 'FsLibcStat_macOS',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStat_macOS_x64 >> fstatName [
	"Returns the name of the fstat function"

	^'fstat$INODE64'
]

{ #category : 'accessing' }
FsLibcStat_macOS_x64 >> lstatName [
	"Returns the name of the lstat function"

	^'lstat$INODE64'
]

{ #category : 'accessing' }
FsLibcStat_macOS_x64 >> statName [
	"Returns the name of the stat function"

	^'stat$INODE64'
]
