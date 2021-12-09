Class {
	#name : 'LibcStat_macOS',
	#superclass : 'LibcStat',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat_macOS >> fstat: fd [

	| statStruct errnoHolder status |
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := library
		__fxstat: { fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'initialization' }
LibcStat_macOS >> initialize [

	library := CLibrary named: self libraryName
]

{ #category : 'accessing' }
LibcStat_macOS >> libraryName [
	"Returns the name of the C library that should be used."

	^'/usr/lib/libSystem.dylib'.
]

{ #category : 'functions' }
LibcStat_macOS >> mkdir: pathString [

	| errnoHolder status |
	errnoHolder := { 0 }.
	status := library
		mkdir: { pathString encodeAsUTF8. 8r0777. }
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

{ #category : 'accessing' }
LibcStat_macOS >> wrappedClass [

	^_libc_stat_macOS
]
