Class {
	#name : 'LibcUnistd_Linux',
	#superclass : 'LibcUnistd',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcUnistd_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]

{ #category : 'functions' }
LibcUnistd_Linux >> truncate: fileDescriptor
to: length [

	| errnoHolder result |
	ftruncate == nil
		ifTrue:
			[ftruncate := CCallout
				library: library
				name: 'ftruncate'
				result: #'int32' "Should this be int64?"
				args: #(#'int32' #'int64')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	result := ftruncate
		callWith: { fileDescriptor. length }
		errno: errnoHolder.
	result == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^result
]
