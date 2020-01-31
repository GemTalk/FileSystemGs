"
Abstract superclass for ""Smalltalk-ized"" wrappers around auto-generated classes that come from the various header files for functions in libc.
The primary functions of the wrappers are:
* Better keyword selectors than the auto-generated ones
* Convert error returns (in, for instance, errno) to signaled exceptions.
"
Class {
	#name : 'LibcWrapper',
	#superclass : 'Object',
	#instVars : [
		'library'
	],
	#category : 'LibC'
}

{ #category : 'instance creation' }
LibcWrapper class >> new [
	^ super new
		initialize;
		yourself
]

{ #category : 'error handling' }
LibcWrapper >> handleErrno: errorNumber [
	" Default handling of system errors: just signal the default exception class for the error.
	Subclasses may override this method for specific errors that need other handling."

	| errorClass |
	errorClass := UnixError errorClassForErrorNumber: errorNumber.
	^ errorClass signal
]

{ #category : 'initialization' }
LibcWrapper >> initialize [
	library := self wrappedClass new
]

{ #category : 'accessing' }
LibcWrapper >> wrappedClass [
	self subclassResponsibility
]
