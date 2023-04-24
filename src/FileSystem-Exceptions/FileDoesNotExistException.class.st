"
Part of FileSystem

=========

I am raised when an operation is attempted on a file that does not exist.
"
Class {
	#name : 'FileDoesNotExistException',
	#superclass : 'FileException',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FileDoesNotExistException >> initialize [
  super initialize .
  gsNumber := ERR_FileDoesNotExistException .

]
