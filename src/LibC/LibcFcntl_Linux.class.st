Class {
	#name : 'LibcFcntl_Linux',
	#superclass : 'LibcFcntl',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcFcntl_Linux >> chmod: pathString
mode: mode [

	| errnoHolder result |
	chmod == nil
		ifTrue: [chmod := CCallout
			library: library
			name: 'chmod'
			result: #'int32'
			args: #(#'const char*' #'uint32')
			varArgsAfter: 2].
	errnoHolder := { 0 }.
	result := chmod
		callWith: { pathString encodeAsUTF8. mode }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]

{ #category : 'accessing' }
LibcFcntl_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]
