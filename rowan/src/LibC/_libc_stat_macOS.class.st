Class {
	#name : '_libc_stat_macOS',
	#superclass : '_libc_stat',
	#instVars : [
		'Function_chflags',
		'Function_chmod',
		'Function_chmodx_np',
		'Function_fchflags',
		'Function_fchmod',
		'Function_fchmodx_np',
		'Function_fstat',
		'Function_fstat64',
		'Function_fstatx64_np',
		'Function_fstatx_np',
		'Function_lchflags',
		'Function_lchmod',
		'Function_lstat',
		'Function_lstat64',
		'Function_lstatx64_np',
		'Function_lstatx_np',
		'Function_mkdir',
		'Function_mkdirx_np',
		'Function_mkfifo',
		'Function_mkfifox_np',
		'Function_mknod',
		'Function_stat',
		'Function_stat64',
		'Function_statx64_np',
		'Function_statx_np',
		'Function_umask',
		'Function_umaskx_np'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_stat_macOS >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: '/usr/lib/libSystem.dylib'.
	Function_chflags := CCallout
		library: cLibrary
		name: 'chflags'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_chmod := CCallout
		library: cLibrary
		name: 'chmod'
		result: #'int32'
		args: #(#'const char*' #'uint16')
		varArgsAfter: -1.
	Function_chmodx_np := CCallout
		library: cLibrary
		name: 'chmodx_np'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_fchflags := CCallout
		library: cLibrary
		name: 'fchflags'
		result: #'int32'
		args: #(#'int32' #'uint32')
		varArgsAfter: -1.
	Function_fchmod := CCallout
		library: cLibrary
		name: 'fchmod'
		result: #'int32'
		args: #(#'int32' #'uint16')
		varArgsAfter: -1.
	Function_fchmodx_np := CCallout
		library: cLibrary
		name: 'fchmodx_np'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fstat := CCallout
		library: cLibrary
		name: 'fstat'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fstat64 := CCallout
		library: cLibrary
		name: 'fstat64'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fstatx64_np := CCallout
		library: cLibrary
		name: 'fstatx64_np'
		result: #'int32'
		args: #(#'int32' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_fstatx_np := CCallout
		library: cLibrary
		name: 'fstatx_np'
		result: #'int32'
		args: #(#'int32' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_lchflags := CCallout
		library: cLibrary
		name: 'lchflags'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.
	Function_lchmod := CCallout
		library: cLibrary
		name: 'lchmod'
		result: #'int32'
		args: #(#'const char*' #'uint16')
		varArgsAfter: -1.
	Function_lstat := CCallout
		library: cLibrary
		name: 'lstat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_lstat64 := CCallout
		library: cLibrary
		name: 'lstat64'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_lstatx64_np := CCallout
		library: cLibrary
		name: 'lstatx64_np'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_lstatx_np := CCallout
		library: cLibrary
		name: 'lstatx_np'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_mkdir := CCallout
		library: cLibrary
		name: 'mkdir'
		result: #'int32'
		args: #(#'const char*' #'uint16')
		varArgsAfter: -1.
	Function_mkdirx_np := CCallout
		library: cLibrary
		name: 'mkdirx_np'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_mkfifo := CCallout
		library: cLibrary
		name: 'mkfifo'
		result: #'int32'
		args: #(#'const char*' #'uint16')
		varArgsAfter: -1.
	Function_mkfifox_np := CCallout
		library: cLibrary
		name: 'mkfifox_np'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_mknod := CCallout
		library: cLibrary
		name: 'mknod'
		result: #'int32'
		args: #(#'const char*' #'uint16' #'int32')
		varArgsAfter: -1.
	Function_stat := CCallout
		library: cLibrary
		name: 'stat'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_stat64 := CCallout
		library: cLibrary
		name: 'stat64'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_statx64_np := CCallout
		library: cLibrary
		name: 'statx64_np'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_statx_np := CCallout
		library: cLibrary
		name: 'statx_np'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_umask := CCallout
		library: cLibrary
		name: 'umask'
		result: #'uint16'
		args: #(#'uint16')
		varArgsAfter: -1.
	Function_umaskx_np := CCallout
		library: cLibrary
		name: 'umaskx_np'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_stat_macOS >> chflags: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_chflags
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> chmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16')"

	^Function_chmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> chmodx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_chmodx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fchflags: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'uint32')"

	^Function_fchflags
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fchmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'uint16')"

	^Function_fchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fchmodx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fchmodx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fstat64: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fstat64
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fstatx64_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'ptr')"

	^Function_fstatx64_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> fstatx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'ptr')"

	^Function_fstatx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lchflags: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32')"

	^Function_lchflags
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lchmod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16')"

	^Function_lchmod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lstat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_lstat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lstat64: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_lstat64
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lstatx64_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_lstatx64_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> lstatx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_lstatx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> mkdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16')"

	^Function_mkdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> mkdirx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_mkdirx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> mkfifo: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16')"

	^Function_mkfifo
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> mkfifox_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_mkfifox_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> mknod: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16' #'int32')"

	^Function_mknod
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> stat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_stat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> stat64: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_stat64
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> statx64_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_statx64_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> statx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_statx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> umask: args errno: errnoHolder [
	"Interpreted as #'uint16' from #(#'uint16')"

	^Function_umask
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stat_macOS >> umaskx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_umaskx_np
		callWith: args
		errno: errnoHolder
]