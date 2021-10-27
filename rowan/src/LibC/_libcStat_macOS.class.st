Class {
	#name : '_libcStat_macOS',
	#superclass : '_libcStat',
	#classVars : [
		'Functionchmod',
		'Functionfchmod',
		'Functionfchmodat',
		'Functionfstat',
		'Functionfstatat',
		'Functionfutimens',
		'Functionlchmod',
		'Functionlstat',
		'Functionmkdir',
		'Functionmkdirat',
		'Functionmkfifo',
		'Functionmkfifoat',
		'Functionmknod',
		'Functionmknodat',
		'Functionstat',
		'Functionumask',
		'Functionutimensat',
		'Function__fxstat',
		'Function__fxstatat',
		'Function__lxstat',
		'Function__xmknod',
		'Function__xmknodat',
		'Function__xstat'
	],
	#category : 'LibC'
}

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initialize [

  self initializeFunctions
]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___fxstat_inLibrary: cLibrary [

	Function__fxstat := CCallout
		library: cLibrary
		name: '__fxstat'
		result: #'int32'
		args: #(#'int32' #'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___fxstatat_inLibrary: cLibrary [

	Function__fxstatat := CCallout
		library: cLibrary
		name: '__fxstatat'
		result: #'int32'
		args: #(#'int32' #'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___lxstat_inLibrary: cLibrary [

	Function__lxstat := CCallout
		library: cLibrary
		name: '__lxstat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___xmknod_inLibrary: cLibrary [

	Function__xmknod := CCallout
		library: cLibrary
		name: '__xmknod'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___xmknodat_inLibrary: cLibrary [

	Function__xmknodat := CCallout
		library: cLibrary
		name: '__xmknodat'
		result: #'int32'
		args: #(#'int32' #'int32' #'const char*' #'uint32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction___xstat_inLibrary: cLibrary [

	Function__xstat := CCallout
		library: cLibrary
		name: '__xstat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_chmod_inLibrary: cLibrary [

	Functionchmod := CCallout
		library: cLibrary
		name: 'chmod'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_fchmod_inLibrary: cLibrary [

	Functionfchmod := CCallout
		library: cLibrary
		name: 'fchmod'
		result: #'int32'
		args: #(#'int32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_fchmodat_inLibrary: cLibrary [

	Functionfchmodat := CCallout
		library: cLibrary
		name: 'fchmodat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_fstat_inLibrary: cLibrary [

	Functionfstat := CCallout
		library: cLibrary
		name: 'fstat'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_fstatat_inLibrary: cLibrary [

	Functionfstatat := CCallout
		library: cLibrary
		name: 'fstatat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_futimens_inLibrary: cLibrary [

	Functionfutimens := CCallout
		library: cLibrary
		name: 'futimens'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_lchmod_inLibrary: cLibrary [

	Functionlchmod := CCallout
		library: cLibrary
		name: 'lchmod'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_lstat_inLibrary: cLibrary [

	Functionlstat := CCallout
		library: cLibrary
		name: 'lstat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mkdir_inLibrary: cLibrary [

	Functionmkdir := CCallout
		library: cLibrary
		name: 'mkdir'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mkdirat_inLibrary: cLibrary [

	Functionmkdirat := CCallout
		library: cLibrary
		name: 'mkdirat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mkfifo_inLibrary: cLibrary [

	Functionmkfifo := CCallout
		library: cLibrary
		name: 'mkfifo'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mkfifoat_inLibrary: cLibrary [

	Functionmkfifoat := CCallout
		library: cLibrary
		name: 'mkfifoat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mknod_inLibrary: cLibrary [

	Functionmknod := CCallout
		library: cLibrary
		name: 'mknod'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_mknodat_inLibrary: cLibrary [

	Functionmknodat := CCallout
		library: cLibrary
		name: 'mknodat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_stat_inLibrary: cLibrary [

	Functionstat := CCallout
		library: cLibrary
		name: 'stat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_umask_inLibrary: cLibrary [

	Functionumask := CCallout
		library: cLibrary
		name: 'umask'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunction_utimensat_inLibrary: cLibrary [

	Functionutimensat := CCallout
		library: cLibrary
		name: 'utimensat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStat_macOS class >> initializeFunctions [

	| library |
	library := CLibrary named: '/usr/lib/system/libsystem_c.dylib'.
	self
		initializeFunction_umask_inLibrary: library;
		initializeFunction___fxstatat_inLibrary: library;
		initializeFunction_chmod_inLibrary: library;
		initializeFunction_mkdir_inLibrary: library;
		initializeFunction___fxstat_inLibrary: library;
		initializeFunction_mknod_inLibrary: library;
		initializeFunction___xmknodat_inLibrary: library;
		initializeFunction_lstat_inLibrary: library;
		initializeFunction_fchmod_inLibrary: library;
		initializeFunction___xmknod_inLibrary: library;
		initializeFunction_lchmod_inLibrary: library;
		initializeFunction_mkdirat_inLibrary: library;
		initializeFunction___lxstat_inLibrary: library;
		initializeFunction___xstat_inLibrary: library;
		initializeFunction_mkfifo_inLibrary: library;
		initializeFunction_fstat_inLibrary: library;
		initializeFunction_fstatat_inLibrary: library;
		initializeFunction_mknodat_inLibrary: library;
		initializeFunction_stat_inLibrary: library;
		initializeFunction_fchmodat_inLibrary: library;
		initializeFunction_futimens_inLibrary: library;
		initializeFunction_mkfifoat_inLibrary: library;
		initializeFunction_utimensat_inLibrary: library;
		yourself
]

{ #category : 'Functions' }
_libcStat_macOS >> __fxstat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' #'ptr' )"

	^Function__fxstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> __fxstatat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' #'const char*' #'ptr' #'int32' )"

	^Function__fxstatat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> __lxstat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'ptr' )"

	^Function__lxstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> __xmknod: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' #'ptr' )"

	^Function__xmknod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> __xmknodat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' #'const char*' #'uint32' #'ptr' )"

	^Function__xmknodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> __xstat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'ptr' )"

	^Function__xstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> chmod: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functionchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> fchmod: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'uint32' )"

	^Functionfchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> fchmodat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' #'int32' )"

	^Functionfchmodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> fstat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionfstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> fstatat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'ptr' #'int32' )"

	^Functionfstatat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> futimens: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionfutimens
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> lchmod: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functionlchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> lstat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionlstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mkdir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functionmkdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mkdirat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' )"

	^Functionmkdirat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mkfifo: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functionmkfifo
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mkfifoat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' )"

	^Functionmkfifoat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mknod: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' #'uint64' )"

	^Functionmknod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> mknodat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' #'uint64' )"

	^Functionmknodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> stat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> umask: args errno: errnoHolder [
	"Interpreted as #uint32 from #( #'uint32' )"

	^Functionumask
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStat_macOS >> utimensat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'ptr' #'int32' )"

	^Functionutimensat
		callWith: args
		errno: errnoHolder
]
