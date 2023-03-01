"
Part of FileSystem

=========

I am raised on an attempt to delete a directory when is not empty.
"
Class {
	#name : 'DirectoryIsNotEmpty',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
DirectoryIsNotEmpty >> initialize [
  super initialize .
  gsNumber := ERR_DirectoryIsNotEmpty .

]
