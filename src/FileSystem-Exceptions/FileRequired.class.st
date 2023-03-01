"
Part of FileSystem

=========

Notify that this operation requires a File.
"
Class {
	#name : 'FileRequired',
	#superclass : 'FileException',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FileRequired >> initialize [
  super initialize .
  gsNumber := ERR_FileRequired .

]

