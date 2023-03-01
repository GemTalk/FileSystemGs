Class {
	#name : 'FsError',
	#superclass : 'Error',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FsError >> initialize [
  super initialize .
  gsNumber := ERR_FsError .

]
