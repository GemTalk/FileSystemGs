"
Part of FileSystem

=========

I am raised when I an operation is attempted inside a directory that does not exist.
"
Class {
	#name : 'DirectoryDoesNotExist',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
DirectoryDoesNotExist >> initialize [
  super initialize .
  gsNumber := ERR_DirectoryDoesNotExist .

]
