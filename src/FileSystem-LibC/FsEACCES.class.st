"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

Permission was denied
"
Class {
	#name : 'FsEACCES',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEACCES class >> errorNumber [
	^13
]

{ #category : 'Instance initialization' }
FsEACCES >> initialize [
  super initialize .
  gsNumber := ERR_FsEACCES .

]
