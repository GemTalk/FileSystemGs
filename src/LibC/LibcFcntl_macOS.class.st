Class {
	#name : 'LibcFcntl_macOS',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'initialization' }
LibcFcntl_macOS >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
LibcFcntl_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
LibcFcntl_macOS >> openPath: pathString flags: flagsInteger mode: modeInteger [

	| errnoHolder result |
	open == nil
		ifTrue: [open := CCallout
			library: library
			name: 'open'
			result: #'int32'
			args: #(#'const char*' #'int32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := open
		callWith: { pathString encodeAsUTF8. flagsInteger. #'int32'. modeInteger. }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
LibcFcntl_macOS >> wrappedClass [

	^_libc_fcntl_macOS
]
