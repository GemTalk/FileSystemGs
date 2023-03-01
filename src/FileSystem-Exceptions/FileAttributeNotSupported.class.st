"
Part of FileSystem

=========

This Error is signaled when an attempting to access an attribute which is unsupported by the underlying FileSystem.
"
Class {
	#name : 'FileAttributeNotSupported',
	#superclass : 'FileSystemError',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FileAttributeNotSupported >> initialize [
  super initialize .
  gsNumber := ERR_FileAttributeNotSupported .

]
