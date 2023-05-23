"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Out of memory
"
Class {
	#name : 'FsENOMEM',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsENOMEM class >> errorNumber [
	^ 12
]

{ #category : 'Instance initialization' }
FsENOMEM >> initialize [
  super initialize .
  gsNumber := ERR_FsENOMEM .

]
