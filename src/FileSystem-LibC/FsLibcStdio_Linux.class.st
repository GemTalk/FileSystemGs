"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Linux interface to stdio.h
"
Class {
	#name : 'FsLibcStdio_Linux',
	#superclass : 'FsLibcStdio',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStdio_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
