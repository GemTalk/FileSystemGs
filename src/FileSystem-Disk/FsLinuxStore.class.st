"
Part of FileSystem

=========

FsLinuxStore provides an interface to a Linux file system. Any differences from other Unix systems is specified here.
"
Class {
	#name : 'FsLinuxStore',
	#superclass : 'UnixStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
FsLinuxStore >> maxFileNameLength [
	"Returns the max file name length"

	^4096
]
