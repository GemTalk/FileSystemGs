"
Part of FileSystem

=========

macOS interface to stdio.h
"
Class {
	#name : 'FsLibcStdio_macOS',
	#superclass : 'FsLibcStdio',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsLibcStdio_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
