"
Utility to re-generate the Libc class.
"
Class {
	#name : 'LibcFactory',
	#superclass : 'Object',
	#category : 'FileDescriptor'
}

{ #category : 'Utility' }
LibcFactory class >> generateLibc [
	"LibcFactory generateLibc"

	| header wrapperClass wrapper |
	header := CHeader path: '/usr/include/unistd.h'.
	wrapperClass := header wrapperForLibraryAt: '/lib64/libc.so.6'.	"You may need to change the path to libc, which varies by Linux distribution."
	wrapperClass initializeFunctions.
	UserGlobals at: wrapperClass name put: wrapperClass
]
