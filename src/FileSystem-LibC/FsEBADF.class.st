"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Bad file number
"
Class {
	#name : 'FsEBADF',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEBADF class >> errorNumber [
	^ 9
]

{ #category : 'Instance initialization' }
FsEBADF >> initialize [
  super initialize .
  gsNumber := ERR_FsEBADF .

]
