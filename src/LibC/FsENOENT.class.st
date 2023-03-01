"
Part of FileSystem

=========

No such file or directory
"
Class {
	#name : 'FsENOENT',
	#superclass : 'FsUnixError',
	#category : 'LibC'
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

