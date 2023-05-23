"
Part of FileSystem

=========

This class is private and subject to revision or removal. The FileSystem-LibC package is still under active development.

=========

File exists
"
Class {
	#name : 'FsEEXIST',
	#superclass : 'FsUnixError',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsEEXIST class >> errorNumber [

	^17
]

{ #category : 'Instance initialization' }
FsEEXIST >> initialize [
  super initialize .
  gsNumber := ERR_FsEEXIST .

]
