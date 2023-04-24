"
Part of FileSystem

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

