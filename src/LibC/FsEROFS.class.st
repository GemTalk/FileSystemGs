"
Part of FileSystem

=========

Read-only file system
"
Class {
	#name : 'FsEROFS',
	#superclass : 'FsUnixError',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsEROFS class >> errorNumber [
	^ 30
]
