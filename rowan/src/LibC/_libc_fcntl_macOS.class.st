Class {
	#name : '_libc_fcntl_macOS',
	#superclass : '_libc_fcntl',
	#instVars : [
		'Function_creat',
		'Function_fcntl',
		'Function_filesec_dup',
		'Function_filesec_free',
		'Function_filesec_get_property',
		'Function_filesec_init',
		'Function_filesec_query_property',
		'Function_filesec_set_property',
		'Function_filesec_unset_property',
		'Function_flock',
		'Function_open',
		'Function_openx_np',
		'Function_open_dprotected_np'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_fcntl_macOS >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: '/usr/lib/system/libsystem_c.dylib'.
	Function_creat := CCallout
		library: cLibrary
		name: 'creat'
		result: #'int32'
		args: #(#'const char*' #'uint16')
		varArgsAfter: -1.
	Function_fcntl := CCallout
		library: cLibrary
		name: 'fcntl'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: 2.
	Function_filesec_dup := CCallout
		library: cLibrary
		name: 'filesec_dup'
		result: #'ptr'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_filesec_free := CCallout
		library: cLibrary
		name: 'filesec_free'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_filesec_get_property := CCallout
		library: cLibrary
		name: 'filesec_get_property'
		result: #'int32'
		args: #(#'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_filesec_init := CCallout
		library: cLibrary
		name: 'filesec_init'
		result: #'ptr'
		args: #()
		varArgsAfter: -1.
	Function_filesec_query_property := CCallout
		library: cLibrary
		name: 'filesec_query_property'
		result: #'int32'
		args: #(#'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_filesec_set_property := CCallout
		library: cLibrary
		name: 'filesec_set_property'
		result: #'int32'
		args: #(#'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_filesec_unset_property := CCallout
		library: cLibrary
		name: 'filesec_unset_property'
		result: #'int32'
		args: #(#'ptr' #'int32')
		varArgsAfter: -1.
	Function_flock := CCallout
		library: cLibrary
		name: 'flock'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_open := CCallout
		library: cLibrary
		name: 'open'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: 2.
	Function_openx_np := CCallout
		library: cLibrary
		name: 'openx_np'
		result: #'int32'
		args: #(#'const char*' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_open_dprotected_np := CCallout
		library: cLibrary
		name: 'open_dprotected_np'
		result: #'int32'
		args: #(#'const char*' #'int32' #'int32' #'int32')
		varArgsAfter: 4.
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> creat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint16')"

	^Function_creat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> fcntl: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_fcntl
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_dup: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'ptr')"

	^Function_filesec_dup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_free: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_filesec_free
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_get_property: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32' #'ptr')"

	^Function_filesec_get_property
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_init: args errno: errnoHolder [
	"Interpreted as #'ptr' from #()"

	^Function_filesec_init
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_query_property: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32' #'ptr')"

	^Function_filesec_query_property
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_set_property: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32' #'ptr')"

	^Function_filesec_set_property
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> filesec_unset_property: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32')"

	^Function_filesec_unset_property
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> flock: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_flock
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> open: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32')"

	^Function_open
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> openx_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32' #'ptr')"

	^Function_openx_np
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_fcntl_macOS >> open_dprotected_np: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32' #'int32' #'int32')"

	^Function_open_dprotected_np
		callWith: args
		errno: errnoHolder
]