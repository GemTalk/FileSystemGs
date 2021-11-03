Class {
	#name : '_libc_stat_Linux',
	#superclass : '_libc_stat',
	#instVars : [
		'Function_chmod',
		'Function_fchmod',
		'Function_fchmodat',
		'Function_fstat',
		'Function_fstatat',
		'Function_futimens',
		'Function_lchmod',
		'Function_lstat',
		'Function_mkdir',
		'Function_mkdirat',
		'Function_mkfifo',
		'Function_mkfifoat',
		'Function_mknod',
		'Function_mknodat',
		'Function_stat',
		'Function_umask',
		'Function_utimensat',
		'Function___fxstat',
		'Function___fxstatat',
		'Function___lxstat',
		'Function___xmknod',
		'Function___xmknodat',
		'Function___xstat'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_stat_Linux >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: 'libc.so.6'.
	Function_chmod := CCallout
		library: cLibrary
		name: 'chmod'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_fchmod := CCallout
		library: cLibrary
		name: 'fchmod'
		result: #'int32'
		args: #(#'int32' #'uint32')
		varArgsAfter: -1.
	Function_fchmodat := CCallout
		library: cLibrary
		name: 'fchmodat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'int32')
		varArgsAfter: -1.
	Function_fstat := CCallout
		library: cLibrary
		name: 'fstat'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fstatat := CCallout
		library: cLibrary
		name: 'fstatat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.
	Function_futimens := CCallout
		library: cLibrary
		name: 'futimens'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_lchmod := CCallout
		library: cLibrary
		name: 'lchmod'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_lstat := CCallout
		library: cLibrary
		name: 'lstat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_mkdir := CCallout
		library: cLibrary
		name: 'mkdir'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_mkdirat := CCallout
		library: cLibrary
		name: 'mkdirat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32')
		varArgsAfter: -1.
	Function_mkfifo := CCallout
		library: cLibrary
		name: 'mkfifo'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_mkfifoat := CCallout
		library: cLibrary
		name: 'mkfifoat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32')
		varArgsAfter: -1.
	Function_mknod := CCallout
		library: cLibrary
		name: 'mknod'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint64')
		varArgsAfter: -1.
	Function_mknodat := CCallout
		library: cLibrary
		name: 'mknodat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'uint64')
		varArgsAfter: -1.
	Function_stat := CCallout
		library: cLibrary
		name: 'stat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_umask := CCallout
		library: cLibrary
		name: 'umask'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_utimensat := CCallout
		library: cLibrary
		name: 'utimensat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.
	Function___fxstat := CCallout
		library: cLibrary
		name: '__fxstat'
		result: #'int32'
		args: #(#'int32' #'int32' #'ptr')
		varArgsAfter: -1.
	Function___fxstatat := CCallout
		library: cLibrary
		name: '__fxstatat'
		result: #'int32'
		args: #(#'int32' #'int32' #'const char*' #'ptr' #'int32')
		varArgsAfter: -1.
	Function___lxstat := CCallout
		library: cLibrary
		name: '__lxstat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function___xmknod := CCallout
		library: cLibrary
		name: '__xmknod'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'ptr')
		varArgsAfter: -1.
	Function___xmknodat := CCallout
		library: cLibrary
		name: '__xmknodat'
		result: #'int32'
		args: #(#'int32' #'int32' #'const char*' #'uint32' #'ptr')
		varArgsAfter: -1.
	Function___xstat := CCallout
		library: cLibrary
		name: '__xstat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_stat_Linux >> chmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_chmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> fchmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'uint32')"

	^Function_fchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> fchmodat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32' #'int32')"

	^Function_fchmodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> fstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> fstatat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'ptr' #'int32')"

	^Function_fstatat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> futimens: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_futimens
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> lchmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_lchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> lstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_lstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mkdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_mkdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mkdirat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32')"

	^Function_mkdirat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mkfifo: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_mkfifo
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mkfifoat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32')"

	^Function_mkfifoat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mknod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32' #'uint64')"

	^Function_mknod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> mknodat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32' #'uint64')"

	^Function_mknodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> stat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_stat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> umask: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32')"

	^Function_umask
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> utimensat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'ptr' #'int32')"

	^Function_utimensat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __fxstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32' #'ptr')"

	^Function___fxstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __fxstatat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32' #'const char*' #'ptr' #'int32')"

	^Function___fxstatat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __lxstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'ptr')"

	^Function___lxstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __xmknod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32' #'ptr')"

	^Function___xmknod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __xmknodat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32' #'const char*' #'uint32' #'ptr')"

	^Function___xmknodat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_Linux >> __xstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'ptr')"

	^Function___xstat
		callWith: args
		errno: errnoHolder
]
