"
Part of FileSystem

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
FsLibcStat_macOS_x64 >> statName [
	"Returns the name of the stat function"

	^'stat$INODE64'
]
