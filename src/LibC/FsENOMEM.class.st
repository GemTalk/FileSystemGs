"
Part of FileSystem

=========

Out of memory
"
Class {
	#name : 'FsENOMEM',
	#superclass : 'FsUnixError',
	#category : 'LibC'
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

