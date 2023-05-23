"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

No such file or directory
"
Class {
	#name : 'FsENOENT',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsENOENT class >> errorNumber [
	^ 2
]

{ #category : 'Instance initialization' }
FsENOENT >> initialize [
  super initialize .
  gsNumber := ERR_FsENOENT .

]
