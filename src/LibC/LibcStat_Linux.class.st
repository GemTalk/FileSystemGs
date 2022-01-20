Class {
	#name : 'LibcStat_Linux',
	#superclass : 'LibcStat',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat_Linux >> fstat: fd [

	| statStruct errnoHolder status |
	fstat == nil
		ifTrue:
			[fstat := CCallout
				library: library
				name: '__fxstat'
				result: #'int32'
				args: #(#'int32' #'int32' #'ptr')
				varArgsAfter: -1].
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := fstat
		callWith: { 0 "_STAT_VER". fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]

{ #category : 'functions' }
LibcStat_Linux >> mkdir: pathString [

	| errnoHolder status |
	mkdir == nil
		ifTrue:
			[mkdir := CCallout
				library: library
				name: 'mkdir'
				result: #'int32'
				args: #(#'const char*' #'uint32')
				varArgsAfter: -1].
	errnoHolder := { 0 }.
	status := mkdir
		callWith: { pathString encodeAsUTF8. 8r0777. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^true
]

{ #category : 'functions' }
LibcStat_Linux >> stat: pathString [

	| statStruct errnoHolder status |
	stat == nil
		ifTrue:
			[stat := CCallout
				library: library
				name: '__xstat'
				result: #'int32'
				args: #(#'int32' #'const char*' #'ptr')
				varArgsAfter: -1].
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := stat
		callWith: { 0 "_STAT_VER". pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]
