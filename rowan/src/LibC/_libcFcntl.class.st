Class {
	#name : '_libcFcntl',
	#superclass : 'Object',
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

{ #category : 'documentation' }
_libcFcntl class >> documentOpenFlags [
	"
#define O_ACCMODE          0003
#define O_RDONLY             00
#define O_WRONLY             01
#define O_RDWR               02
# define O_CREAT           0100 /* Not fcntl.  */
# define O_EXCL            0200 /* Not fcntl.  */
# define O_NOCTTY          0400 /* Not fcntl.  */
# define O_TRUNC          01000 /* Not fcntl.  */
# define O_APPEND         02000
# define O_NONBLOCK       04000
# define O_NDELAY       O_NONBLOCK
# define O_SYNC        04010000
#define O_FSYNC         O_SYNC
# define O_ASYNC         020000
# define __O_LARGEFILE  0100000
# define __O_DIRECTORY  0200000
# define __O_NOFOLLOW   0400000
# define __O_CLOEXEC   02000000
# define __O_DIRECT      040000
# define __O_NOATIME   01000000
# define __O_PATH     010000000
# define __O_DSYNC       010000
# define __O_TMPFILE   (020000000 | __O_DIRECTORY)
"
]

{ #category : 'initializing' }
_libcFcntl class >> initialize [
	self initializeFunctions
]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_creat_inLibrary: cLibrary [

	Functioncreat := CCallout
		library: cLibrary
		name: 'creat'
		result: #'int32'
		args: #(#'const char*' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_fcntl_inLibrary: cLibrary [

	Functionfcntl := CCallout
		library: cLibrary
		name: 'fcntl'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_lockf_inLibrary: cLibrary [

	Functionlockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_open_inLibrary: cLibrary [

	Functionopen := CCallout
		library: cLibrary
		name: 'open'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_openat_inLibrary: cLibrary [

	Functionopenat := CCallout
		library: cLibrary
		name: 'openat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: 3.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_posix_fadvise_inLibrary: cLibrary [

	Functionposix_fadvise := CCallout
		library: cLibrary
		name: 'posix_fadvise'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunction_posix_fallocate_inLibrary: cLibrary [

	Functionposix_fallocate := CCallout
		library: cLibrary
		name: 'posix_fallocate'
		result: #'int32'
		args: #(#'int32' #'int64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcFcntl class >> initializeFunctions [

	| library |
	library := CLibrary named: 'libc.so.6'.
	self
		initializeFunction_creat_inLibrary: library;
		initializeFunction_fcntl_inLibrary: library;
		initializeFunction_lockf_inLibrary: library;
		initializeFunction_open_inLibrary: library;
		initializeFunction_openat_inLibrary: library;
		initializeFunction_posix_fadvise_inLibrary: library;
		initializeFunction_posix_fallocate_inLibrary: library;
		yourself.
]

{ #category : 'Functions' }
_libcFcntl >> creat_: __file _: __mode [ 
	"/usr/include/fcntl.h line 241
extern int creat (const char *__file, mode_t __mode)                                                     __attribute__ ((__nonnull__                                                     (1)                                                    ))                                                                   ;"

	"Interpreted as #int32 from #( #'const char*' #'uint32' )"

	^Functioncreat callWith: { __file. __mode }

]

{ #category : 'Functions' }
_libcFcntl >> fcntl_: __fd _: __cmd [ 
	"/usr/include/fcntl.h line 175
extern int fcntl (int __fd, int __cmd, ...);"

	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functionfcntl callWith: { __fd. __cmd"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcFcntl >> lockf_: __fd _: __cmd _: __len [ 
	"/usr/include/fcntl.h line 270
extern int lockf (int __fd, int __cmd, off_t __len);"

	"Interpreted as #int32 from #( #'int32' #'int32' #'int64' )"

	^Functionlockf callWith: { __fd. __cmd. __len }

]

{ #category : 'Functions' }
_libcFcntl >> open_: __file _: __oflag [ 
	"/usr/include/fcntl.h line 195
extern int open (const char *__file, int __oflag, ...)                                                       __attribute__ ((__nonnull__                                                       (1)                                                      ))                                                                     ;"

	"Interpreted as #int32 from #( #'const char*' #'int32' )"

	^Functionopen callWith: { __file. __oflag"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcFcntl >> open_: __file _: __oflag _: __varArgs [
	"/usr/include/fcntl.h line 195
extern int open (const char *__file, int __oflag, ...)                                                       __attribute__ ((__nonnull__                                                       (1)                                                      ))                                                                     ;"

	"Interpreted as #int32 from #( #'const char*' #'int32' )"

	^ Functionopen
		callWith:
			{__file.
			__oflag} , __varArgs
]

{ #category : 'Functions' }
_libcFcntl >> openat_: __fd _: __file _: __oflag [ 
	"/usr/include/fcntl.h line 219
extern int openat (int __fd, const char *__file, int __oflag, ...)     
    __attribute__ ((__nonnull__     (2)    ))                   ;"

	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' )"

	^Functionopenat callWith: { __fd. __file. __oflag"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcFcntl >> posix_fadvise_: __fd _: __offset _: __len _: __advise [ 
	"/usr/include/fcntl.h line 287
extern int posix_fadvise (int __fd, off_t __offset, off_t __len,     int __advise)                   __attribute__ ((__nothrow__ , __leaf__))                         ;"

	"Interpreted as #int32 from #( #'int32' #'int64' #'int64' #'int32' )"

	^Functionposix_fadvise callWith: { __fd. __offset. __len. __advise }

]

{ #category : 'Functions' }
_libcFcntl >> posix_fallocate_: __fd _: __offset _: __len [ 
	"/usr/include/fcntl.h line 309
extern int posix_fallocate (int __fd, off_t __offset, off_t __len);"

	"Interpreted as #int32 from #( #'int32' #'int64' #'int64' )"

	^Functionposix_fallocate callWith: { __fd. __offset. __len }

]
