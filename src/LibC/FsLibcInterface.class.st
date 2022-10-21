"
Part of FileSystem

=========

Abstract superclass for ""Smalltalk-ized"" wrappers around auto-generated classes that come from the various header files for functions in libc.
The primary functions of the wrappers are:
* Better keyword selectors than the auto-generated ones
* Convert error returns (in, for instance, errno) to signaled exceptions.

Instvar library should refer to a library class created by LibcFactory
"
Class {
	#name : 'FsLibcInterface',
	#superclass : 'Object',
	#instVars : [
		'library'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'LibC'
}

{ #category : 'instance creation' }
FsLibcInterface class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'error handling' }
FsLibcInterface >> handleErrno: errorNumber [
	" Default handling of system errors: just signal the default exception class for the error.
	Subclasses may override this method for specific errors that need other handling."

	| errorClass |
	errorClass := FsUnixError errorClassForErrorNumber: errorNumber.
	^ errorClass signal
]

{ #category : 'initialization' }
FsLibcInterface >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
FsLibcInterface >> libraryName [
	"Returns the name or path to the library that should be loaded."

	^self subclassResponsibility
]
