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
		__fxstat: { 0 "_STAT_VER". fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
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
	statStruct := StatStruct_macOS new.
	errnoHolder := { 0 }.
	status := library
		stat: { pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat_macOS >> wrappedClass [

	^_libc_stat_macOS
]
