"
Part of FileSystem

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
