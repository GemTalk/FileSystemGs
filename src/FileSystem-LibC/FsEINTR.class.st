"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Interrupted system call
"
Class {
	#name : 'FsEINTR',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEINTR class >> errorNumber [
	^ 4
]

{ #category : 'Instance initialization' }
FsEINTR >> initialize [
  super initialize .
  gsNumber := ERR_FsEINTR .

]
