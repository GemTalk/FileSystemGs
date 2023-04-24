"
Part of FileSystem

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
FsLibcStat_macOS_arm64 >> statName [
	"Returns the name of the stat function"

	^'stat'
]
