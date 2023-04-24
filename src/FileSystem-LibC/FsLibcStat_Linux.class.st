"
Part of FileSystem

=========

Common Linux interface to stat.h
"
Class {
	#name : 'FsLibcStat_Linux',
	#superclass : 'FsLibcStat',
	#category : 'FileSystem-LibC'
}

{ #category : 'functions' }
FsLibcStat_Linux >> fstat: fd [

	| statStruct errnoHolder status |
	fstat == nil
		ifTrue:
			[fstat := CCallout
				library: library
				name: '__fxstat'
				result: #'int32'
				args: #(#'int32' #'int32' #'ptr')
				varArgsAfter: -1].
	statStruct := self statStructClass new.
	errnoHolder := { 0 }.
	status := fstat
		callWith: { 0 "_STAT_VER". fd. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
FsLibcStat_Linux >> libraryName [
	"Returns the name of the C library that should be used."

	^'libc.so.6'
]

{ #category : 'functions' }
FsLibcStat_Linux >> mkdir: pathString [

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
FsLibcStat_Linux >> stat: pathString [

	| statStruct errnoHolder status |
	stat == nil
		ifTrue:
			[stat := CCallout
				library: library
				name: '__xstat'
				result: #'int32'
				args: #(#'int32' #'const char*' #'ptr')
				varArgsAfter: -1].
	statStruct := self statStructClass new.
	errnoHolder := { 0 }.
	status := stat
		callWith: { 0 "_STAT_VER". pathString encodeAsUTF8. statStruct bytes. }
		errno: errnoHolder.
	status == -1
		ifTrue: [self handleErrno: errnoHolder first].
	^statStruct
]

{ #category : 'accessing' }
FsLibcStat_Linux >> statStructClass [
	"Returns the class that should be used as StatStruct."

	self subclassResponsibility
]
