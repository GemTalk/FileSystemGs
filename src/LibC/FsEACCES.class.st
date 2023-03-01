"
Part of FileSystem

=========

Permission was denied
"
Class {
	#name : 'FsEACCES',
	#superclass : 'FsUnixError',
	#category : 'LibC'
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
