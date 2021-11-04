Class {
	#name : '_libc_dirent_Linux',
	#superclass : '_libc_dirent',
	#instVars : [
		'Function_alphasort',
		'Function_closedir',
		'Function_dirfd',
		'Function_fdopendir',
		'Function_getdirentries',
		'Function_opendir',
		'Function_readdir',
		'Function_readdir_r',
		'Function_rewinddir',
		'Function_scandir',
		'Function_seekdir',
		'Function_telldir'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_dirent_Linux >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: 'libc.so.6'.
	Function_alphasort := CCallout
		library: cLibrary
		name: 'alphasort'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.
	Function_closedir := CCallout
		library: cLibrary
		name: 'closedir'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_dirfd := CCallout
		library: cLibrary
		name: 'dirfd'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fdopendir := CCallout
		library: cLibrary
		name: 'fdopendir'
		result: #'ptr'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_getdirentries := CCallout
		library: cLibrary
		name: 'getdirentries'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'ptr')
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
	Function_scandir := CCallout
		library: cLibrary
		name: 'scandir'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr' #'ptr')
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
_libc_dirent_Linux >> alphasort: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr')"

	^Function_alphasort
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> closedir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_closedir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> dirfd: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_dirfd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> fdopendir: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'int32')"

	^Function_fdopendir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> getdirentries: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64' #'ptr')"

	^Function_getdirentries
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> opendir: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*')"

	^Function_opendir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> readdir: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'ptr')"

	^Function_readdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> readdir_r: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr' #'ptr')"

	^Function_readdir_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> rewinddir: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_rewinddir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> scandir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr' #'ptr')"

	^Function_scandir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> seekdir: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr' #'int64')"

	^Function_seekdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> telldir: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr')"

	^Function_telldir
		callWith: args
		errno: errnoHolder
]