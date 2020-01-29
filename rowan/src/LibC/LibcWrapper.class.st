"
Abstract superclass for ""Smalltalk-ized"" wrappers around auto-generated classes that come from the various header files for functions in libc.
The primary functions of the wrappers are:
* Better keyword selectors than the auto-generated ones
* Convert error returns (in, for instance, errno) to signaled exceptions.

Instvar library should refer to a library class created by LibcFactory
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
	^ self basicNew initialize
]

{ #category : 'accessing' }
LibcWrapper >> initialize [
	library := self libraryClass new
]

{ #category : 'accessing' }
LibcWrapper >> libraryClass [
	^ self subclassResponsibility
]
