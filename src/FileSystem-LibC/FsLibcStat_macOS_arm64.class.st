"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

macOS/arm64 interface to stat.h
"
Class {
	#name : 'FsLibcStat_macOS_arm64',
	#superclass : 'FsLibcStat_macOS',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStat_macOS_arm64 >> fstatName [
	"Returns the name of the fstat function"

	^'fstat'
]

{ #category : 'accessing' }
FsLibcStat_macOS_arm64 >> lstatName [
	"Returns the name of the lstat function"

	^'lstat'
]

{ #category : 'accessing' }
FsLibcStat_macOS_arm64 >> statName [
	"Returns the name of the stat function"

	^'stat'
]
