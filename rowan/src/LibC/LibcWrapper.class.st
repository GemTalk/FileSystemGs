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
