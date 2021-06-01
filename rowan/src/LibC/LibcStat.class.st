Class {
	#name : 'LibcStat',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcStat >> mkdir: pathString [

	| errnoHolder status |
	errnoHolder := { 0 }.
	status := library
		mkdir: { pathString. 8r0777. }
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
		__xstat: { 0 "_STAT_VER". pathString. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
LibcStat >> wrappedClass [

	^_libcStat
]
