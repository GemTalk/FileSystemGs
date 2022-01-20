Class {
	#name : 'LibcStat_macOS',
	#superclass : 'LibcStat',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat_macOS >> fstat: fd [

	| statStruct errnoHolder status |
	fstat == nil
		ifTrue:
			[fstat := CCallout
				library: library
				name: 'fstat$INODE64'
				result: #'int32'
				args: #(#'int32' #'ptr')
				varArgsAfter: -1].
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := fstat
		callWith: { fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'
]

{ #category : 'functions' }
LibcStat_macOS >> mkdir: pathString [

	| errnoHolder status |
	mkdir == nil
		ifTrue:
			[mkdir := CCallout
				library: library
				name: 'mkdir'
				result: #'int32'
				args: #(#'const char*' #'uint16') "Should this be unint32?"
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
LibcStat_macOS >> stat: pathString [

	| statStruct errnoHolder status |
	stat == nil
		ifTrue:
			[stat := CCallout
				library: library
				name: 'stat$INODE64'
				result: #'int32'
				args: #(#'const char*' #'ptr')
				varArgsAfter: -1].
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := stat
		callWith: { pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]
