Class {
	#name : '_libcDirent',
	#superclass : 'Object',
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

{ #category : 'initializing' }
_libcDirent class >> initialize [
	self initializeFunctions
]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_alphasort_inLibrary: cLibrary [

	Functionalphasort := CCallout
		library: cLibrary
		name: 'alphasort'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_closedir_inLibrary: cLibrary [

	Functionclosedir := CCallout
		library: cLibrary
		name: 'closedir'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_dirfd_inLibrary: cLibrary [

	Functiondirfd := CCallout
		library: cLibrary
		name: 'dirfd'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_fdopendir_inLibrary: cLibrary [

	Functionfdopendir := CCallout
		library: cLibrary
		name: 'fdopendir'
		result: #'ptr'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_getdirentries_inLibrary: cLibrary [

	Functiongetdirentries := CCallout
		library: cLibrary
		name: 'getdirentries'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_opendir_inLibrary: cLibrary [

	Functionopendir := CCallout
		library: cLibrary
		name: 'opendir'
		result: #'ptr'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_readdir_inLibrary: cLibrary [

	Functionreaddir := CCallout
		library: cLibrary
		name: 'readdir'
		result: #'ptr'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_readdir_r_inLibrary: cLibrary [

	Functionreaddir_r := CCallout
		library: cLibrary
		name: 'readdir_r'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_rewinddir_inLibrary: cLibrary [

	Functionrewinddir := CCallout
		library: cLibrary
		name: 'rewinddir'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_scandir_inLibrary: cLibrary [

	Functionscandir := CCallout
		library: cLibrary
		name: 'scandir'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_seekdir_inLibrary: cLibrary [

	Functionseekdir := CCallout
		library: cLibrary
		name: 'seekdir'
		result: #'void'
		args: #(#'ptr' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunction_telldir_inLibrary: cLibrary [

	Functiontelldir := CCallout
		library: cLibrary
		name: 'telldir'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcDirent class >> initializeFunctions [

	| library |
	library := CLibrary named: '/lib64/libc.so.6'.
	self
		initializeFunction_alphasort_inLibrary: library;
		initializeFunction_closedir_inLibrary: library;
		initializeFunction_dirfd_inLibrary: library;
		initializeFunction_fdopendir_inLibrary: library;
		initializeFunction_getdirentries_inLibrary: library;
		initializeFunction_opendir_inLibrary: library;
		initializeFunction_readdir_inLibrary: library;
		initializeFunction_readdir_r_inLibrary: library;
		initializeFunction_rewinddir_inLibrary: library;
		initializeFunction_scandir_inLibrary: library;
		initializeFunction_seekdir_inLibrary: library;
		initializeFunction_telldir_inLibrary: library;
		yourself.

]

{ #category : 'Functions' }
_libcDirent >> alphasort_: __e1 _: __e2 [ 
	"/usr/include/dirent.h line 325
extern int alphasort (const struct dirent **__e1,        const struct dirent **__e2)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__                                (1, 2)                               ))                                                 ;"

	"Interpreted as #int32 from #( #'ptr' #'ptr' )"

	^Functionalphasort callWith: { __e1. __e2 }

]

{ #category : 'Functions' }
_libcDirent >> closedir_: __dirp [ 
	"/usr/include/dirent.h line 149
extern int closedir (DIR *__dirp)                                  __attribute__ ((__nonnull__                                  (1)                                 ))                                                ;"

	"Interpreted as #int32 from #( #'ptr' )"

	^Functionclosedir callWith: { __dirp }

]

{ #category : 'Functions' }
_libcDirent >> dirfd_: __dirp [ 
	"/usr/include/dirent.h line 224
extern int dirfd (DIR *__dirp)                               __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                       (1)                                      ))                                                     ;"

	"Interpreted as #int32 from #( #'ptr' )"

	^Functiondirfd callWith: { __dirp }

]

{ #category : 'Functions' }
_libcDirent >> fdopendir_: __fd [ 
	"/usr/include/dirent.h line 141
extern DIR *fdopendir (int __fd);"

	"Interpreted as #ptr from #( #'int32' )"

	^Functionfdopendir callWith: { __fd }

]

{ #category : 'Functions' }
_libcDirent >> getdirentries_: __fd _: __buf _: __nbytes _: __basep [ 
	"/usr/include/dirent.h line 353
extern __ssize_t getdirentries (int __fd, char *__restrict __buf,    size_t __nbytes,    __off_t *__restrict __basep)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2, 4)            ))                              ;"

	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'ptr' )"

	^Functiongetdirentries callWith: { __fd. __buf. __nbytes. __basep }

]

{ #category : 'Functions' }
_libcDirent >> opendir_: __name [ 
	"/usr/include/dirent.h line 134
extern DIR *opendir (const char *__name)                                         __attribute__ ((__nonnull__                                         (1)                                        ))                                                       ;"

	"Interpreted as #ptr from #( #'const char*' )"

	^Functionopendir callWith: { __name }

]

{ #category : 'Functions' }
_libcDirent >> readdir_: __dirp [ 
	"/usr/include/dirent.h line 162
extern struct dirent *readdir (DIR *__dirp)                                            __attribute__ ((__nonnull__                                            (1)                                           ))                                                          ;"

	"Interpreted as #ptr from #( #'ptr' )"

	^Functionreaddir callWith: { __dirp }

]

{ #category : 'Functions' }
_libcDirent >> readdir_r_: __dirp _: __entry _: __result [ 
	"/usr/include/dirent.h line 183
extern int readdir_r (DIR *__restrict __dirp,        struct dirent *__restrict __entry,        struct dirent **__restrict __result)     
    __attribute__ ((__nonnull__     (1, 2, 3)    )) __attribute__ ((__deprecated__))                                                  ;"

	"Interpreted as #int32 from #( #'ptr' #'ptr' #'ptr' )"

	^Functionreaddir_r callWith: { __dirp. __entry. __result }

]

{ #category : 'Functions' }
_libcDirent >> rewinddir_: __dirp [ 
	"/usr/include/dirent.h line 209
extern void rewinddir (DIR *__dirp)                                    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                            (1)                                           ))                                                          ;"

	"Interpreted as #void from #( #'ptr' )"

	^Functionrewinddir callWith: { __dirp }

]

{ #category : 'Functions' }
_libcDirent >> scandir_: __dir _: __namelist _: __selector _: __cmp [ 
	"/usr/include/dirent.h line 255
extern int scandir (const char *__restrict __dir,      struct dirent ***__restrict __namelist,      int (*__selector) (const struct dirent *),      int (*__cmp) (const struct dirent **,      const struct dirent **))     
    __attribute__ ((__nonnull__     (1, 2)    ))                      ;"

	"Interpreted as #int32 from #( #'const char*' #'ptr' #'ptr' #'ptr' )"

	^Functionscandir callWith: { __dir. __namelist. __selector. __cmp }

]

{ #category : 'Functions' }
_libcDirent >> seekdir_: __dirp _: __pos [ 
	"/usr/include/dirent.h line 215
extern void seekdir (DIR *__dirp, long int __pos)                                                  __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                                          (1)                                                         ))                                                                        ;"

	"Interpreted as #void from #( #'ptr' #'int64' )"

	^Functionseekdir callWith: { __dirp. __pos }

]

{ #category : 'Functions' }
_libcDirent >> telldir_: __dirp [ 
	"/usr/include/dirent.h line 218
extern long int telldir (DIR *__dirp)                                      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                              (1)                                             ))                                                            ;"

	"Interpreted as #int64 from #( #'ptr' )"

	^Functiontelldir callWith: { __dirp }

]
