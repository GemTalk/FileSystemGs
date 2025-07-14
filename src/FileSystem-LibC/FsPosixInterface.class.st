Class {
	#name : 'FsPosixInterface',
	#superclass : 'Object',
	#instVars : [
		'library'
	],
	#gs_options : [
		'instancesNonPersistent'
	],
	#category : 'FileSystem-LibC'
}

{ #category : 'instance creation' }
FsPosixInterface class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'error handling' }
FsPosixInterface >> handleErrno: errorNumber [
	" Default handling of system errors: just signal the default exception class for the error.
	Subclasses may override this method for specific errors that need other handling."

	| errorClass |
	errorClass := FsUnixError errorClassForErrorNumber: errorNumber.
	^ errorClass signal
]

{ #category : 'initialization' }
FsPosixInterface >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
FsPosixInterface >> libraryName [
	"Returns the name or path to the library that should be loaded."

	^'libFileSystemGs.so'
]
