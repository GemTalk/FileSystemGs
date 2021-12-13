Class {
	#name : 'LibcStdio_macOS',
	#superclass : 'LibcStdio',
	#category : 'LibC'
}

{ #category : 'initialization' }
LibcStdio_macOS >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
LibcStdio_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
LibcStdio_macOS >> rename: srcPathString
to: dstPathString [

	| errnoHolder status |
	rename == nil
		ifTrue:
			[rename := CCallout
				library: library
				name: 'rename'
				result: #'int32'
				args: #(#'const char*' #'const char*')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := rename
		callWith: { srcPathString encodeAsUTF8. dstPathString encodeAsUTF8. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]

{ #category : 'accessing' }
LibcStdio_macOS >> wrappedClass [

	^_libc_stdio_macOS
]
