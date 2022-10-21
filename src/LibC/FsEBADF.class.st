"
Part of FileSystem

=========

Bad file number
"
Class {
	#name : 'FsEBADF',
	#superclass : 'FsUnixError',
	#category : 'LibC'
}

{ #category : 'accessing' }
FsEBADF class >> errorNumber [
	^ 9
]
