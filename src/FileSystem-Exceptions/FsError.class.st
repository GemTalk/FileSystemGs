"
Part of FileSystem

=========

I am an abstract Error class and serve as the base class for most FileSystem-related errors.
"
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
