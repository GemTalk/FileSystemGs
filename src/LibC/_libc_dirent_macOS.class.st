Class {
	#name : '_libc_dirent_macOS',
	#superclass : '_libc_dirent',
	#instVars : [
		'Function_closedir',
		'Function_opendir',
		'Function_readdir',
		'Function_readdir_r',
		'Function_rewinddir',
		'Function_seekdir',
		'Function_telldir'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_dirent_macOS >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: '/usr/lib/libSystem.dylib'.
	Function_closedir := CCallout
		library: cLibrary
		name: 'closedir'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_opendir := CCallout
		library: cLibrary
		name: 'opendir'
		result: #'ptr'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_readdir := CCallout
		library: cLibrary
		name: 'readdir'
		result: #'ptr'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_readdir_r := CCallout
		library: cLibrary
		name: 'readdir_r'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_rewinddir := CCallout
		library: cLibrary
		name: 'rewinddir'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_seekdir := CCallout
		library: cLibrary
		name: 'seekdir'
		result: #'void'
		args: #(#'ptr' #'int64')
		varArgsAfter: -1.
	Function_telldir := CCallout
		library: cLibrary
		name: 'telldir'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_dirent_macOS >> closedir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_closedir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> opendir: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*')"

	^Function_opendir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> readdir: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'ptr')"

	^Function_readdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> readdir_r: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr' #'ptr')"

	^Function_readdir_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> rewinddir: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_rewinddir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> seekdir: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr' #'int64')"

	^Function_seekdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_macOS >> telldir: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr')"

	^Function_telldir
		callWith: args
		errno: errnoHolder
]