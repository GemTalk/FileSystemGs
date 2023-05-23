"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

No space left on device
"
Class {
	#name : 'FsENOSPC',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsENOSPC class >> errorNumber [
	^ 28
]

{ #category : 'Instance initialization' }
FsENOSPC >> initialize [
  super initialize .
  gsNumber := ERR_FsENOSPC .

]
