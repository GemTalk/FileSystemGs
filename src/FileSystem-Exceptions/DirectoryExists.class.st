"
Part of FileSystem

=========

I am raised on an attempt to create a directory that already exists.
"
Class {
	#name : 'DirectoryExists',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
DirectoryExists >> initialize [
  super initialize .
  gsNumber := ERR_DirectoryExists .

]
