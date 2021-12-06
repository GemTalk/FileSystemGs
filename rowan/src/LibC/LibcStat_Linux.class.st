Class {
	#name : 'LibcStat_Linux',
	#superclass : 'LibcStat',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat_Linux >> fstat: fd [

	| statStruct errnoHolder status |
	statStruct := StatStruct_Linux new.
	errnoHolder := { 0 }.
	status := library
		__fxstat: { 0 "_STAT_VER". fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'functions' }
LibcStat_Linux >> mkdir: pathString [

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
LibcStat_Linux >> stat: pathString [

	| statStruct errnoHolder status |
	statStruct := StatStruct_Linux new.
	errnoHolder := { 0 }.
	status := library
		__xstat: { 0 "_STAT_VER". pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat_Linux >> wrappedClass [

	^_libc_stat_Linux
]
