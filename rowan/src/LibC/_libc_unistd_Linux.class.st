Class {
	#name : '_libc_unistd_Linux',
	#superclass : '_libc_unistd',
	#instVars : [
		'Function_access',
		'Function_acct',
		'Function_alarm',
		'Function_brk',
		'Function_chdir',
		'Function_chown',
		'Function_chroot',
		'Function_close',
		'Function_confstr',
		'Function_crypt',
		'Function_daemon',
		'Function_dup',
		'Function_dup2',
		'Function_endusershell',
		'Function_execl',
		'Function_execle',
		'Function_execlp',
		'Function_execv',
		'Function_execve',
		'Function_execvp',
		'Function_faccessat',
		'Function_fchdir',
		'Function_fchown',
		'Function_fchownat',
		'Function_fdatasync',
		'Function_fexecve',
		'Function_fork',
		'Function_fpathconf',
		'Function_fsync',
		'Function_ftruncate',
		'Function_getcwd',
		'Function_getdomainname',
		'Function_getdtablesize',
		'Function_getegid',
		'Function_getentropy',
		'Function_geteuid',
		'Function_getgid',
		'Function_getgroups',
		'Function_gethostid',
		'Function_gethostname',
		'Function_getlogin',
		'Function_getlogin_r',
		'Function_getopt',
		'Function_getpagesize',
		'Function_getpass',
		'Function_getpgid',
		'Function_getpgrp',
		'Function_getpid',
		'Function_getppid',
		'Function_getsid',
		'Function_getuid',
		'Function_getusershell',
		'Function_getwd',
		'Function_isatty',
		'Function_lchown',
		'Function_link',
		'Function_linkat',
		'Function_lockf',
		'Function_lseek',
		'Function_nice',
		'Function_pathconf',
		'Function_pause',
		'Function_pipe',
		'Function_pread',
		'Function_profil',
		'Function_pwrite',
		'Function_read',
		'Function_readlink',
		'Function_readlinkat',
		'Function_revoke',
		'Function_rmdir',
		'Function_sbrk',
		'Function_setdomainname',
		'Function_setegid',
		'Function_seteuid',
		'Function_setgid',
		'Function_sethostid',
		'Function_sethostname',
		'Function_setlogin',
		'Function_setpgid',
		'Function_setpgrp',
		'Function_setregid',
		'Function_setreuid',
		'Function_setsid',
		'Function_setuid',
		'Function_setusershell',
		'Function_sleep',
		'Function_symlink',
		'Function_symlinkat',
		'Function_sync',
		'Function_syscall',
		'Function_sysconf',
		'Function_tcgetpgrp',
		'Function_tcsetpgrp',
		'Function_truncate',
		'Function_ttyname',
		'Function_ttyname_r',
		'Function_ttyslot',
		'Function_ualarm',
		'Function_unlink',
		'Function_unlinkat',
		'Function_usleep',
		'Function_vfork',
		'Function_vhangup',
		'Function_write',
		'Function__exit',
		'Function___getpgid'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_unistd_Linux >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: 'libc.so.6'.
	Function_access := CCallout
		library: cLibrary
		name: 'access'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.
	Function_acct := CCallout
		library: cLibrary
		name: 'acct'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_alarm := CCallout
		library: cLibrary
		name: 'alarm'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_brk := CCallout
		library: cLibrary
		name: 'brk'
		result: #'int32'
		args: #(#'ptr')
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
	Function_chroot := CCallout
		library: cLibrary
		name: 'chroot'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_close := CCallout
		library: cLibrary
		name: 'close'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_confstr := CCallout
		library: cLibrary
		name: 'confstr'
		result: #'uint64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_crypt := CCallout
		library: cLibrary
		name: 'crypt'
		result: #'char*'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_daemon := CCallout
		library: cLibrary
		name: 'daemon'
		result: #'int32'
		args: #(#'int32' #'int32')
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
	Function_endusershell := CCallout
		library: cLibrary
		name: 'endusershell'
		result: #'void'
		args: #()
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
	Function_faccessat := CCallout
		library: cLibrary
		name: 'faccessat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'int32')
		varArgsAfter: -1.
	Function_fchdir := CCallout
		library: cLibrary
		name: 'fchdir'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_fchown := CCallout
		library: cLibrary
		name: 'fchown'
		result: #'int32'
		args: #(#'int32' #'uint32' #'uint32')
		varArgsAfter: -1.
	Function_fchownat := CCallout
		library: cLibrary
		name: 'fchownat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'uint32' #'int32')
		varArgsAfter: -1.
	Function_fdatasync := CCallout
		library: cLibrary
		name: 'fdatasync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_fexecve := CCallout
		library: cLibrary
		name: 'fexecve'
		result: #'int32'
		args: #(#'int32' #'ptr' #'ptr')
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
	Function_fsync := CCallout
		library: cLibrary
		name: 'fsync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_ftruncate := CCallout
		library: cLibrary
		name: 'ftruncate'
		result: #'int32'
		args: #(#'int32' #'int64')
		varArgsAfter: -1.
	Function_getcwd := CCallout
		library: cLibrary
		name: 'getcwd'
		result: #'char*'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.
	Function_getdomainname := CCallout
		library: cLibrary
		name: 'getdomainname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.
	Function_getdtablesize := CCallout
		library: cLibrary
		name: 'getdtablesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getegid := CCallout
		library: cLibrary
		name: 'getegid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_getentropy := CCallout
		library: cLibrary
		name: 'getentropy'
		result: #'int32'
		args: #(#'ptr' #'uint64')
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
	Function_gethostid := CCallout
		library: cLibrary
		name: 'gethostid'
		result: #'int64'
		args: #()
		varArgsAfter: -1.
	Function_gethostname := CCallout
		library: cLibrary
		name: 'gethostname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.
	Function_getlogin := CCallout
		library: cLibrary
		name: 'getlogin'
		result: #'char*'
		args: #()
		varArgsAfter: -1.
	Function_getlogin_r := CCallout
		library: cLibrary
		name: 'getlogin_r'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.
	Function_getopt := CCallout
		library: cLibrary
		name: 'getopt'
		result: #'int32'
		args: #(#'int32' #'ptr' #'const char*')
		varArgsAfter: -1.
	Function_getpagesize := CCallout
		library: cLibrary
		name: 'getpagesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getpass := CCallout
		library: cLibrary
		name: 'getpass'
		result: #'char*'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_getpgid := CCallout
		library: cLibrary
		name: 'getpgid'
		result: #'int32'
		args: #(#'int32')
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
	Function_getsid := CCallout
		library: cLibrary
		name: 'getsid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_getuid := CCallout
		library: cLibrary
		name: 'getuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.
	Function_getusershell := CCallout
		library: cLibrary
		name: 'getusershell'
		result: #'char*'
		args: #()
		varArgsAfter: -1.
	Function_getwd := CCallout
		library: cLibrary
		name: 'getwd'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_isatty := CCallout
		library: cLibrary
		name: 'isatty'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_lchown := CCallout
		library: cLibrary
		name: 'lchown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.
	Function_link := CCallout
		library: cLibrary
		name: 'link'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_linkat := CCallout
		library: cLibrary
		name: 'linkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'const char*' #'int32')
		varArgsAfter: -1.
	Function_lockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.
	Function_lseek := CCallout
		library: cLibrary
		name: 'lseek'
		result: #'int64'
		args: #(#'int32' #'int64' #'int32')
		varArgsAfter: -1.
	Function_nice := CCallout
		library: cLibrary
		name: 'nice'
		result: #'int32'
		args: #(#'int32')
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
	Function_pread := CCallout
		library: cLibrary
		name: 'pread'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.
	Function_profil := CCallout
		library: cLibrary
		name: 'profil'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'uint64' #'uint32')
		varArgsAfter: -1.
	Function_pwrite := CCallout
		library: cLibrary
		name: 'pwrite'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.
	Function_read := CCallout
		library: cLibrary
		name: 'read'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_readlink := CCallout
		library: cLibrary
		name: 'readlink'
		result: #'int64'
		args: #(#'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_readlinkat := CCallout
		library: cLibrary
		name: 'readlinkat'
		result: #'int64'
		args: #(#'int32' #'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_revoke := CCallout
		library: cLibrary
		name: 'revoke'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_rmdir := CCallout
		library: cLibrary
		name: 'rmdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_sbrk := CCallout
		library: cLibrary
		name: 'sbrk'
		result: #'ptr'
		args: #(#'int64')
		varArgsAfter: -1.
	Function_setdomainname := CCallout
		library: cLibrary
		name: 'setdomainname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.
	Function_setegid := CCallout
		library: cLibrary
		name: 'setegid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_seteuid := CCallout
		library: cLibrary
		name: 'seteuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_setgid := CCallout
		library: cLibrary
		name: 'setgid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_sethostid := CCallout
		library: cLibrary
		name: 'sethostid'
		result: #'int32'
		args: #(#'int64')
		varArgsAfter: -1.
	Function_sethostname := CCallout
		library: cLibrary
		name: 'sethostname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.
	Function_setlogin := CCallout
		library: cLibrary
		name: 'setlogin'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_setpgid := CCallout
		library: cLibrary
		name: 'setpgid'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.
	Function_setpgrp := CCallout
		library: cLibrary
		name: 'setpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_setregid := CCallout
		library: cLibrary
		name: 'setregid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.
	Function_setreuid := CCallout
		library: cLibrary
		name: 'setreuid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
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
	Function_setusershell := CCallout
		library: cLibrary
		name: 'setusershell'
		result: #'void'
		args: #()
		varArgsAfter: -1.
	Function_sleep := CCallout
		library: cLibrary
		name: 'sleep'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_symlink := CCallout
		library: cLibrary
		name: 'symlink'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_symlinkat := CCallout
		library: cLibrary
		name: 'symlinkat'
		result: #'int32'
		args: #(#'const char*' #'int32' #'const char*')
		varArgsAfter: -1.
	Function_sync := CCallout
		library: cLibrary
		name: 'sync'
		result: #'void'
		args: #()
		varArgsAfter: -1.
	Function_syscall := CCallout
		library: cLibrary
		name: 'syscall'
		result: #'int64'
		args: #(#'int64')
		varArgsAfter: 1.
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
	Function_truncate := CCallout
		library: cLibrary
		name: 'truncate'
		result: #'int32'
		args: #(#'const char*' #'int64')
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
	Function_ttyslot := CCallout
		library: cLibrary
		name: 'ttyslot'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_ualarm := CCallout
		library: cLibrary
		name: 'ualarm'
		result: #'uint32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.
	Function_unlink := CCallout
		library: cLibrary
		name: 'unlink'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_unlinkat := CCallout
		library: cLibrary
		name: 'unlinkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: -1.
	Function_usleep := CCallout
		library: cLibrary
		name: 'usleep'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.
	Function_vfork := CCallout
		library: cLibrary
		name: 'vfork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_vhangup := CCallout
		library: cLibrary
		name: 'vhangup'
		result: #'int32'
		args: #()
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
	Function___getpgid := CCallout
		library: cLibrary
		name: '__getpgid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_unistd_Linux >> access: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32')"

	^Function_access
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> acct: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_acct
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> alarm: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32')"

	^Function_alarm
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> brk: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_brk
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> chdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_chdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> chown: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32' #'uint32')"

	^Function_chown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> chroot: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_chroot
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> close: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_close
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> confstr: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'int32' #'ptr' #'uint64')"

	^Function_confstr
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> crypt: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'const char*' #'const char*')"

	^Function_crypt
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> daemon: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_daemon
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> dup: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_dup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> dup2: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_dup2
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> endusershell: args errno: errnoHolder [
	"Interpreted as #'void' from #()"

	^Function_endusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execl: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execl
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execle: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execle
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execlp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_execlp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execv: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_execv
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execve: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr' #'ptr')"

	^Function_execve
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> execvp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_execvp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> faccessat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'int32' #'int32')"

	^Function_faccessat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fchdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_fchdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fchown: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'uint32' #'uint32')"

	^Function_fchown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fchownat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'uint32' #'uint32' #'int32')"

	^Function_fchownat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fdatasync: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_fdatasync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fexecve: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'ptr')"

	^Function_fexecve
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fork: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_fork
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fpathconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'int32')"

	^Function_fpathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> fsync: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_fsync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> ftruncate: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int64')"

	^Function_ftruncate
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getcwd: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr' #'uint64')"

	^Function_getcwd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getdomainname: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64')"

	^Function_getdomainname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getdtablesize: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getdtablesize
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getegid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getegid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getentropy: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64')"

	^Function_getentropy
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> geteuid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_geteuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getgid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getgroups: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_getgroups
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> gethostid: args errno: errnoHolder [
	"Interpreted as #'int64' from #()"

	^Function_gethostid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> gethostname: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64')"

	^Function_gethostname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getlogin: args errno: errnoHolder [
	"Interpreted as #'char*' from #()"

	^Function_getlogin
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getlogin_r: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64')"

	^Function_getlogin_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getopt: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'const char*')"

	^Function_getopt
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getpagesize: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getpagesize
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getpass: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'const char*')"

	^Function_getpass
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getpgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_getpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getpid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getpid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getppid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getppid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getsid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_getsid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getuid: args errno: errnoHolder [
	"Interpreted as #'uint32' from #()"

	^Function_getuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getusershell: args errno: errnoHolder [
	"Interpreted as #'char*' from #()"

	^Function_getusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> getwd: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_getwd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> isatty: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_isatty
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> lchown: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint32' #'uint32')"

	^Function_lchown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> link: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_link
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> linkat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'int32' #'const char*' #'int32')"

	^Function_linkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> lockf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32' #'int64')"

	^Function_lockf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> lseek: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'int64' #'int32')"

	^Function_lseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> nice: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_nice
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> pathconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'const char*' #'int32')"

	^Function_pathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> pause: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_pause
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> pipe: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_pipe
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> pread: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64' #'int64')"

	^Function_pread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> profil: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64' #'uint64' #'uint32')"

	^Function_profil
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> pwrite: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64' #'int64')"

	^Function_pwrite
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> read: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64')"

	^Function_read
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> readlink: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'const char*' #'ptr' #'uint64')"

	^Function_readlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> readlinkat: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'const char*' #'ptr' #'uint64')"

	^Function_readlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> revoke: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_revoke
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> rmdir: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_rmdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sbrk: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'int64')"

	^Function_sbrk
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setdomainname: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint64')"

	^Function_setdomainname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setegid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_setegid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> seteuid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_seteuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_setgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sethostid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int64')"

	^Function_sethostid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sethostname: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'uint64')"

	^Function_sethostname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setlogin: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_setlogin
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setpgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_setpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_setpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setregid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32' #'uint32')"

	^Function_setregid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setreuid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32' #'uint32')"

	^Function_setreuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setsid: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_setsid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setuid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_setuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> setusershell: args errno: errnoHolder [
	"Interpreted as #'void' from #()"

	^Function_setusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sleep: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32')"

	^Function_sleep
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> symlink: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_symlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> symlinkat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int32' #'const char*')"

	^Function_symlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sync: args errno: errnoHolder [
	"Interpreted as #'void' from #()"

	^Function_sync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> syscall: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int64')"

	^Function_syscall
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> sysconf: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32')"

	^Function_sysconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> tcgetpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_tcgetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> tcsetpgrp: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'int32')"

	^Function_tcsetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> truncate: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'int64')"

	^Function_truncate
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> ttyname: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'int32')"

	^Function_ttyname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> ttyname_r: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr' #'uint64')"

	^Function_ttyname_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> ttyslot: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_ttyslot
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> ualarm: args errno: errnoHolder [
	"Interpreted as #'uint32' from #(#'uint32' #'uint32')"

	^Function_ualarm
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> unlink: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_unlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> unlinkat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'int32')"

	^Function_unlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> usleep: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'uint32')"

	^Function_usleep
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> vfork: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_vfork
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> vhangup: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_vhangup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> write: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'int32' #'ptr' #'uint64')"

	^Function_write
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> _exit: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'int32')"

	^Function__exit
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_Linux >> __getpgid: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function___getpgid
		callWith: args
		errno: errnoHolder
]