Class {
	#name : '_libc_unistd_macOS',
	#superclass : '_libc_unistd',
	#instVars : [
		'Function_access',
		'Function_alarm',
		'Function_chdir',
		'Function_chown',
		'Function_close',
		'Function_dup',
		'Function_dup2',
		'Function_execl',
		'Function_execle',
		'Function_execlp',
		'Function_execv',
		'Function_execve',
		'Function_execvp',
		'Function_fork',
		'Function_fpathconf',
		'Function_getcwd',
		'Function_getegid',
		'Function_geteuid',
		'Function_getgid',
		'Function_getgroups',
		'Function_getlogin',
		'Function_getpgrp',
		'Function_getpid',
		'Function_getppid',
		'Function_getuid',
		'Function_isatty',
		'Function_link',
		'Function_lseek',
		'Function_pathconf',
		'Function_pause',
		'Function_pipe',
		'Function_read',
		'Function_rmdir',
		'Function_setgid',
		'Function_setpgid',
		'Function_setsid',
		'Function_setuid',
		'Function_sleep',
		'Function_sysconf',
		'Function_tcgetpgrp',
		'Function_tcsetpgrp',
		'Function_ttyname',
		'Function_ttyname_r',
		'Function_unlink',
		'Function_write',
		'Function__exit'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_unistd_macOS >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: '/usr/lib/system/libsystem_c.dylib'.
	Function_access := CCallout
		library: cLibrary
		name: 'access'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.
	Function_alarm := CCallout
		library: cLibrary
		name: 'alarm'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_chdir := CCallout
		library: cLibrary
		name: 'chdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_chown := CCallout
		library: cLibrary
		name: 'chown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.
	Function_close := CCallout
		library: cLibrary
		name: 'close'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_dup := CCallout
		library: cLibrary
		name: 'dup'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_dup2 := CCallout
		library: cLibrary
		name: 'dup2'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_execl := CCallout
		library: cLibrary
		name: 'execl'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.
	Function_execle := CCallout
		library: cLibrary
		name: 'execle'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.
	Function_execlp := CCallout
		library: cLibrary
		name: 'execlp'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.
	Function_execv := CCallout
		library: cLibrary
		name: 'execv'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_execve := CCallout
		library: cLibrary
		name: 'execve'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_execvp := CCallout
		library: cLibrary
		name: 'execvp'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_fork := CCallout
		library: cLibrary
		name: 'fork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_fpathconf := CCallout
		library: cLibrary
		name: 'fpathconf'
		result: #'int64'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_getcwd := CCallout
		library: cLibrary
		name: 'getcwd'
		result: #'char*'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.
	Function_getegid := CCallout
		library: cLibrary
		name: 'getegid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_geteuid := CCallout
		library: cLibrary
		name: 'geteuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_getgid := CCallout
		library: cLibrary
		name: 'getgid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_getgroups := CCallout
		library: cLibrary
		name: 'getgroups'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_getlogin := CCallout
		library: cLibrary
		name: 'getlogin'
		result: #'char*'
		args: #()
		varArgsAfter: -1.
	Function_getpgrp := CCallout
		library: cLibrary
		name: 'getpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getpid := CCallout
		library: cLibrary
		name: 'getpid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getppid := CCallout
		library: cLibrary
		name: 'getppid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getuid := CCallout
		library: cLibrary
		name: 'getuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_isatty := CCallout
		library: cLibrary
		name: 'isatty'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_link := CCallout
		library: cLibrary
		name: 'link'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_lseek := CCallout
		library: cLibrary
		name: 'lseek'
		result: #'int64'
		args: #(#'int32' #'int64' #'int32')
		varArgsAfter: -1.
	Function_pathconf := CCallout
		library: cLibrary
		name: 'pathconf'
		result: #'int64'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.
	Function_pause := CCallout
		library: cLibrary
		name: 'pause'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_pipe := CCallout
		library: cLibrary
		name: 'pipe'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_read := CCallout
		library: cLibrary
		name: 'read'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_rmdir := CCallout
		library: cLibrary
		name: 'rmdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_setgid := CCallout
		library: cLibrary
		name: 'setgid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_setpgid := CCallout
		library: cLibrary
		name: 'setpgid'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_setsid := CCallout
		library: cLibrary
		name: 'setsid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_setuid := CCallout
		library: cLibrary
		name: 'setuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_sleep := CCallout
		library: cLibrary
		name: 'sleep'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_sysconf := CCallout
		library: cLibrary
		name: 'sysconf'
		result: #'int64'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_tcgetpgrp := CCallout
		library: cLibrary
		name: 'tcgetpgrp'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_tcsetpgrp := CCallout
		library: cLibrary
		name: 'tcsetpgrp'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_ttyname := CCallout
		library: cLibrary
		name: 'ttyname'
		result: #'char*'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_ttyname_r := CCallout
		library: cLibrary
		name: 'ttyname_r'
		result: #'int32'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_unlink := CCallout
		library: cLibrary
		name: 'unlink'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_write := CCallout
		library: cLibrary
		name: 'write'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function__exit := CCallout
		library: cLibrary
		name: '_exit'
		result: #'void'
		args: #(#'int32')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_unistd_macOS >> access: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32')"

	^Function_access
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> alarm: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32')"

	^Function_alarm
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> chdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_chdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> chown: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32' #'uint32')"

	^Function_chown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> close: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_close
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> dup: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_dup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> dup2: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_dup2
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execl: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execl
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execle: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execle
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execlp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execlp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execv: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_execv
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execve: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_execve
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execvp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_execvp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fork: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_fork
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fpathconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'int32')"

	^Function_fpathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getcwd: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr' #'uint64')"

	^Function_getcwd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getegid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getegid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> geteuid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_geteuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getgid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getgroups: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_getgroups
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getlogin: args errno: errnoHolder [
	"Interpreted as #'char*' from #()"

	^Function_getlogin
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getpid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getppid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getppid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getuid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> isatty: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_isatty
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> link: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_link
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> lseek: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'int64' #'int32')"

	^Function_lseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pathconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'const char*' #'int32')"

	^Function_pathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pause: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_pause
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pipe: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_pipe
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> read: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64')"

	^Function_read
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> rmdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_rmdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_setgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setpgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_setpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setsid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_setsid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setuid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_setuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sleep: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32')"

	^Function_sleep
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sysconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32')"

	^Function_sysconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> tcgetpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_tcgetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> tcsetpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_tcsetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ttyname: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'int32')"

	^Function_ttyname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ttyname_r: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'uint64')"

	^Function_ttyname_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> unlink: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_unlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> write: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64')"

	^Function_write
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> _exit: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'int32')"

	^Function__exit
		callWith: args
		errno: errnoHolder
]