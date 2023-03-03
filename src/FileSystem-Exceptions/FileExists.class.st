"
Part of FileSystem

=========

I am raised on an attempt to create a file or directory over top of an existing file.
"
Class {
	#name : 'FileExists',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FileExists >> initialize [
  super initialize .
  gsNumber := ERR_FileExists .

]
