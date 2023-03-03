"
Part of FileSystem

=========

Not a directory
"
Class {
	#name : 'FsENOTDIR',
	#superclass : 'FsUnixError',
	#category : 'LibC'
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

