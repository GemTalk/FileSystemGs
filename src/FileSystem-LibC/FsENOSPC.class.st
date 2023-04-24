"
Part of FileSystem

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

