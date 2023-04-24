"
Part of FileSystem

=========

Linux/aarch64 interface to stat.h
"
Class {
	#name : 'FsLibcStat_Linux_aarch64',
	#superclass : 'FsLibcStat_Linux',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStat_Linux_aarch64 >> statStructClass [
	"Returns the class that should be used as StatStruct."

	^FsStatStruct_Linux_aarch64
]
