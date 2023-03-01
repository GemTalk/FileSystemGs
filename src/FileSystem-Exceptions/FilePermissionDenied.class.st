Class {
	#name : 'FilePermissionDenied',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FilePermissionDenied >> initialize [
  super initialize .
  gsNumber := ERR_FilePermissionDenied .

]
