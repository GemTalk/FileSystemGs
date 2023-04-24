"
Part of FileSystem

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

