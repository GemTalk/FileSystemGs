"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Invalid argument
"
Class {
	#name : 'FsEINVAL',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEINVAL class >> errorNumber [
	^ 22
]

{ #category : 'Instance initialization' }
FsEINVAL >> initialize [
  super initialize .
  gsNumber := ERR_FsEINVAL .

]
