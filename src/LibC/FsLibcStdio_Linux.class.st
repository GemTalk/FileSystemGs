"
Part of FileSystem

=========

Linux interface to stdio.h
"
Class {
	#name : 'FsLibcStdio_Linux',
	#superclass : 'FsLibcStdio',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsLibcStdio_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
