Class {
	#name : '_libc_fcntl_Linux',
	#superclass : '_libc_fcntl',
	#instVars : [
		'Function_creat',
		'Function_fcntl',
		'Function_lockf',
		'Function_open',
		'Function_openat',
		'Function_posix_fadvise',
		'Function_posix_fallocate'
	],
	#category : 'LibC'
}

{ #category : 'Functions' }
_libc_fcntl_Linux >> creat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_creat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> fcntl: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_fcntl
		callWith: args
		errno: errnoHolder
]

{ #category : 'initialization' }
_libc_fcntl_Linux >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: 'libc.so.6'.
	Function_creat := CCallout
		library: cLibrary
		name: 'creat'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_fcntl := CCallout
		library: cLibrary
		name: 'fcntl'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: 2.
	Function_lockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.
	Function_open := CCallout
		library: cLibrary
		name: 'open'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: 2.
	Function_openat := CCallout
		library: cLibrary
		name: 'openat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: 3.
	Function_posix_fadvise := CCallout
		library: cLibrary
		name: 'posix_fadvise'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64' #'int32')
		varArgsAfter: -1.
	Function_posix_fallocate := CCallout
		library: cLibrary
		name: 'posix_fallocate'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> lockf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32' #'int64')"

	^Function_lockf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> open: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32')"

	^Function_open
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> openat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'int32')"

	^Function_openat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> posix_fadvise: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int64' #'int64' #'int32')"

	^Function_posix_fadvise
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_Linux >> posix_fallocate: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int64' #'int64')"

	^Function_posix_fallocate
		callWith: args
		errno: errnoHolder
]
