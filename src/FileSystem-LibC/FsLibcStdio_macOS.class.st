"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

macOS interface to stdio.h
"
Class {
	#name : 'FsLibcStdio_macOS',
	#superclass : 'FsLibcStdio',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsLibcStdio_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]
