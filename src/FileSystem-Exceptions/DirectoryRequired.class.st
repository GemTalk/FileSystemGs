"
Part of FileSystem

=========

Notify that this operation requires a Directory
"
Class {
	#name : 'DirectoryRequired',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
DirectoryRequired >> initialize [
  super initialize .
  gsNumber := ERR_DirectoryRequired .

]

