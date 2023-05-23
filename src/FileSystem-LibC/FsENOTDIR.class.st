"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Not a directory
"
Class {
	#name : 'FsENOTDIR',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsENOTDIR class >> errorNumber [

	^20
]

{ #category : 'Instance initialization' }
FsENOTDIR >> initialize [
  super initialize .
  gsNumber := ERR_FsENOTDIR .

]
