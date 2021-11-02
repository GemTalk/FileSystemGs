Class {
	#name : '_libc_dirent_Linux',
	#superclass : '_libc_dirent',
	#classVars : [
		'Functionalphasort',
		'Functionclosedir',
		'Functiondirfd',
		'Functionfdopendir',
		'Functiongetdirentries',
		'Functionopendir',
		'Functionreaddir',
		'Functionreaddir_r',
		'Functionrewinddir',
		'Functionscandir',
		'Functionseekdir',
		'Functiontelldir'
	],
	#category : 'LibC'
}

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initialize [
 
  self initializeFunctions
]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_alphasort_inLibrary: cLibrary [

	Functionalphasort := CCallout
		library: cLibrary
		name: 'alphasort'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_closedir_inLibrary: cLibrary [

	Functionclosedir := CCallout
		library: cLibrary
		name: 'closedir'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_dirfd_inLibrary: cLibrary [

	Functiondirfd := CCallout
		library: cLibrary
		name: 'dirfd'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_fdopendir_inLibrary: cLibrary [

	Functionfdopendir := CCallout
		library: cLibrary
		name: 'fdopendir'
		result: #'ptr'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_getdirentries_inLibrary: cLibrary [

	Functiongetdirentries := CCallout
		library: cLibrary
		name: 'getdirentries'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_opendir_inLibrary: cLibrary [

	Functionopendir := CCallout
		library: cLibrary
		name: 'opendir'
		result: #'ptr'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_readdir_inLibrary: cLibrary [

	Functionreaddir := CCallout
		library: cLibrary
		name: 'readdir'
		result: #'ptr'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_readdir_r_inLibrary: cLibrary [

	Functionreaddir_r := CCallout
		library: cLibrary
		name: 'readdir_r'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_rewinddir_inLibrary: cLibrary [

	Functionrewinddir := CCallout
		library: cLibrary
		name: 'rewinddir'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_scandir_inLibrary: cLibrary [

	Functionscandir := CCallout
		library: cLibrary
		name: 'scandir'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_seekdir_inLibrary: cLibrary [

	Functionseekdir := CCallout
		library: cLibrary
		name: 'seekdir'
		result: #'void'
		args: #(#'ptr' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunction_telldir_inLibrary: cLibrary [

	Functiontelldir := CCallout
		library: cLibrary
		name: 'telldir'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_dirent_Linux class >> initializeFunctions [

	| library |
	library := CLibrary named: 'libc.so.6'.
	self
		initializeFunction_fdopendir_inLibrary: library;
		initializeFunction_telldir_inLibrary: library;
		initializeFunction_dirfd_inLibrary: library;
		initializeFunction_seekdir_inLibrary: library;
		initializeFunction_readdir_r_inLibrary: library;
		initializeFunction_getdirentries_inLibrary: library;
		initializeFunction_rewinddir_inLibrary: library;
		initializeFunction_scandir_inLibrary: library;
		initializeFunction_readdir_inLibrary: library;
		initializeFunction_closedir_inLibrary: library;
		initializeFunction_opendir_inLibrary: library;
		initializeFunction_alphasort_inLibrary: library;
		yourself
]

{ #category : 'Functions' }
_libc_dirent_Linux >> alphasort: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'ptr' )"

	^Functionalphasort
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> closedir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionclosedir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> dirfd: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functiondirfd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> fdopendir: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'int32' )"

	^Functionfdopendir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> getdirentries: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'ptr' )"

	^Functiongetdirentries
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> opendir: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'const char*' )"

	^Functionopendir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> readdir_r: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'ptr' #'ptr' )"

	^Functionreaddir_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> readdir: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'ptr' )"

	^Functionreaddir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> rewinddir: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionrewinddir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> scandir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' #'ptr' #'ptr' )"

	^Functionscandir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> seekdir: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' #'int64' )"

	^Functionseekdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_dirent_Linux >> telldir: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' )"

	^Functiontelldir
		callWith: args
		errno: errnoHolder
]
