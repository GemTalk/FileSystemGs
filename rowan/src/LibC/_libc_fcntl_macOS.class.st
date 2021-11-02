Class {
	#name : '_libc_fcntl_macOS',
	#superclass : '_libc_fcntl',
	#classVars : [
		'Functioncreat',
		'Functionfcntl',
		'Functionlockf',
		'Functionopen',
		'Functionopenat',
		'Functionposix_fadvise',
		'Functionposix_fallocate'
	],
	#category : 'LibC'
}

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initialize [

  self initializeFunctions
]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_creat_inLibrary: cLibrary [

	Functioncreat := CCallout
		library: cLibrary
		name: 'creat'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_fcntl_inLibrary: cLibrary [

	Functionfcntl := CCallout
		library: cLibrary
		name: 'fcntl'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_lockf_inLibrary: cLibrary [

	Functionlockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_open_inLibrary: cLibrary [

	Functionopen := CCallout
		library: cLibrary
		name: 'open'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_openat_inLibrary: cLibrary [

	Functionopenat := CCallout
		library: cLibrary
		name: 'openat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: 3.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_posix_fadvise_inLibrary: cLibrary [

	Functionposix_fadvise := CCallout
		library: cLibrary
		name: 'posix_fadvise'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunction_posix_fallocate_inLibrary: cLibrary [

	Functionposix_fallocate := CCallout
		library: cLibrary
		name: 'posix_fallocate'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_fcntl_macOS class >> initializeFunctions [

	| library |
	library := CLibrary named: '/usr/lib/system/libsystem_c.dylib'.
	self
		initializeFunction_open_inLibrary: library;
		initializeFunction_posix_fadvise_inLibrary: library;
		initializeFunction_posix_fallocate_inLibrary: library;
		initializeFunction_fcntl_inLibrary: library;
		initializeFunction_creat_inLibrary: library;
		initializeFunction_lockf_inLibrary: library;
		initializeFunction_openat_inLibrary: library;
		yourself
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> creat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functioncreat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> fcntl: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functionfcntl
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> lockf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' #'int64' )"

	^Functionlockf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> open: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'int32' )"

	^Functionopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> openat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' )"

	^Functionopenat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> posix_fadvise: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int64' #'int64' #'int32' )"

	^Functionposix_fadvise
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> posix_fallocate: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int64' #'int64' )"

	^Functionposix_fallocate
		callWith: args
		errno: errnoHolder
]
