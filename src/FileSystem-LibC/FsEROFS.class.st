"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Read-only file system
"
Class {
	#name : 'FsEROFS',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEROFS class >> errorNumber [
	^ 30
]

{ #category : 'Instance initialization' }
FsEROFS >> initialize [
  super initialize .
  gsNumber := ERR_FsEROFS .

]
