Class {
	#name : 'LibcStat',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat >> fstat: fd [

	| statStruct errnoHolder status |
	statStruct := StatStruct new.
	errnoHolder := { 0 }.
	status := library
		__fxstat: { 0 "_STAT_VER". fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'functions' }
LibcStat >> mkdir: pathString [

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
LibcStat >> stat: pathString [

	| statStruct errnoHolder status |
	statStruct := StatStruct new.
	errnoHolder := { 0 }.
	status := library
		__xstat: { 0 "_STAT_VER". pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat >> wrappedClass [

	^_libcStat
]
