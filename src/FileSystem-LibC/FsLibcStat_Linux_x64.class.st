"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Linux/x64 interface to stat.h
"
Class {
	#name : 'FsLibcStat_Linux_x64',
	#superclass : 'FsLibcStat_Linux',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStat_Linux_x64 >> statStructClass [
	"Returns the class that should be used as StatStruct."

	^FsStatStruct_Linux_x64
]
