Class {
	#name : '_libc_unistd_macOS',
	#superclass : '_libc_unistd',
	#classVars : [
		'Functionaccess',
		'Functionacct',
		'Functionalarm',
		'Functionbrk',
		'Functionchdir',
		'Functionchown',
		'Functionchroot',
		'Functionclose',
		'Functionconfstr',
		'Functioncrypt',
		'Functiondaemon',
		'Functiondup',
		'Functiondup2',
		'Functionendusershell',
		'Functionexecl',
		'Functionexecle',
		'Functionexeclp',
		'Functionexecv',
		'Functionexecve',
		'Functionexecvp',
		'Functionfaccessat',
		'Functionfchdir',
		'Functionfchown',
		'Functionfchownat',
		'Functionfdatasync',
		'Functionfexecve',
		'Functionfork',
		'Functionfpathconf',
		'Functionfsync',
		'Functionftruncate',
		'Functiongetcwd',
		'Functiongetdomainname',
		'Functiongetdtablesize',
		'Functiongetegid',
		'Functiongetentropy',
		'Functiongeteuid',
		'Functiongetgid',
		'Functiongetgroups',
		'Functiongethostid',
		'Functiongethostname',
		'Functiongetlogin',
		'Functiongetlogin_r',
		'Functiongetopt',
		'Functiongetpagesize',
		'Functiongetpass',
		'Functiongetpgid',
		'Functiongetpgrp',
		'Functiongetpid',
		'Functiongetppid',
		'Functiongetsid',
		'Functiongetuid',
		'Functiongetusershell',
		'Functiongetwd',
		'Functionisatty',
		'Functionlchown',
		'Functionlink',
		'Functionlinkat',
		'Functionlockf',
		'Functionlseek',
		'Functionnice',
		'Functionpathconf',
		'Functionpause',
		'Functionpipe',
		'Functionpread',
		'Functionprofil',
		'Functionpwrite',
		'Functionread',
		'Functionreadlink',
		'Functionreadlinkat',
		'Functionrevoke',
		'Functionrmdir',
		'Functionsbrk',
		'Functionsetdomainname',
		'Functionsetegid',
		'Functionseteuid',
		'Functionsetgid',
		'Functionsethostid',
		'Functionsethostname',
		'Functionsetlogin',
		'Functionsetpgid',
		'Functionsetpgrp',
		'Functionsetregid',
		'Functionsetreuid',
		'Functionsetsid',
		'Functionsetuid',
		'Functionsetusershell',
		'Functionsleep',
		'Functionsymlink',
		'Functionsymlinkat',
		'Functionsync',
		'Functionsyscall',
		'Functionsysconf',
		'Functiontcgetpgrp',
		'Functiontcsetpgrp',
		'Functiontruncate',
		'Functionttyname',
		'Functionttyname_r',
		'Functionttyslot',
		'Functionualarm',
		'Functionunlink',
		'Functionunlinkat',
		'Functionusleep',
		'Functionvfork',
		'Functionvhangup',
		'Functionwrite',
		'Function_exit',
		'Function__getpgid'
	],
	#category : 'LibC'
}

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initialize [

  self initializeFunctions
]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction___getpgid_inLibrary: cLibrary [

	Function__getpgid := CCallout
		library: cLibrary
		name: '__getpgid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction__exit_inLibrary: cLibrary [

	Function_exit := CCallout
		library: cLibrary
		name: '_exit'
		result: #'void'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_access_inLibrary: cLibrary [

	Functionaccess := CCallout
		library: cLibrary
		name: 'access'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_acct_inLibrary: cLibrary [

	Functionacct := CCallout
		library: cLibrary
		name: 'acct'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_alarm_inLibrary: cLibrary [

	Functionalarm := CCallout
		library: cLibrary
		name: 'alarm'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_brk_inLibrary: cLibrary [

	Functionbrk := CCallout
		library: cLibrary
		name: 'brk'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_chdir_inLibrary: cLibrary [

	Functionchdir := CCallout
		library: cLibrary
		name: 'chdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_chown_inLibrary: cLibrary [

	Functionchown := CCallout
		library: cLibrary
		name: 'chown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_chroot_inLibrary: cLibrary [

	Functionchroot := CCallout
		library: cLibrary
		name: 'chroot'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_close_inLibrary: cLibrary [

	Functionclose := CCallout
		library: cLibrary
		name: 'close'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_confstr_inLibrary: cLibrary [

	Functionconfstr := CCallout
		library: cLibrary
		name: 'confstr'
		result: #'uint64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_crypt_inLibrary: cLibrary [

	Functioncrypt := CCallout
		library: cLibrary
		name: 'crypt'
		result: #'char*'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_daemon_inLibrary: cLibrary [

	Functiondaemon := CCallout
		library: cLibrary
		name: 'daemon'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_dup_inLibrary: cLibrary [

	Functiondup := CCallout
		library: cLibrary
		name: 'dup'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_dup2_inLibrary: cLibrary [

	Functiondup2 := CCallout
		library: cLibrary
		name: 'dup2'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_endusershell_inLibrary: cLibrary [

	Functionendusershell := CCallout
		library: cLibrary
		name: 'endusershell'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execl_inLibrary: cLibrary [

	Functionexecl := CCallout
		library: cLibrary
		name: 'execl'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execle_inLibrary: cLibrary [

	Functionexecle := CCallout
		library: cLibrary
		name: 'execle'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execlp_inLibrary: cLibrary [

	Functionexeclp := CCallout
		library: cLibrary
		name: 'execlp'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execv_inLibrary: cLibrary [

	Functionexecv := CCallout
		library: cLibrary
		name: 'execv'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execve_inLibrary: cLibrary [

	Functionexecve := CCallout
		library: cLibrary
		name: 'execve'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_execvp_inLibrary: cLibrary [

	Functionexecvp := CCallout
		library: cLibrary
		name: 'execvp'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_faccessat_inLibrary: cLibrary [

	Functionfaccessat := CCallout
		library: cLibrary
		name: 'faccessat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fchdir_inLibrary: cLibrary [

	Functionfchdir := CCallout
		library: cLibrary
		name: 'fchdir'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fchown_inLibrary: cLibrary [

	Functionfchown := CCallout
		library: cLibrary
		name: 'fchown'
		result: #'int32'
		args: #(#'int32' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fchownat_inLibrary: cLibrary [

	Functionfchownat := CCallout
		library: cLibrary
		name: 'fchownat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'uint32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fdatasync_inLibrary: cLibrary [

	Functionfdatasync := CCallout
		library: cLibrary
		name: 'fdatasync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fexecve_inLibrary: cLibrary [

	Functionfexecve := CCallout
		library: cLibrary
		name: 'fexecve'
		result: #'int32'
		args: #(#'int32' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fork_inLibrary: cLibrary [

	Functionfork := CCallout
		library: cLibrary
		name: 'fork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fpathconf_inLibrary: cLibrary [

	Functionfpathconf := CCallout
		library: cLibrary
		name: 'fpathconf'
		result: #'int64'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_fsync_inLibrary: cLibrary [

	Functionfsync := CCallout
		library: cLibrary
		name: 'fsync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_ftruncate_inLibrary: cLibrary [

	Functionftruncate := CCallout
		library: cLibrary
		name: 'ftruncate'
		result: #'int32'
		args: #(#'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getcwd_inLibrary: cLibrary [

	Functiongetcwd := CCallout
		library: cLibrary
		name: 'getcwd'
		result: #'char*'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getdomainname_inLibrary: cLibrary [

	Functiongetdomainname := CCallout
		library: cLibrary
		name: 'getdomainname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getdtablesize_inLibrary: cLibrary [

	Functiongetdtablesize := CCallout
		library: cLibrary
		name: 'getdtablesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getegid_inLibrary: cLibrary [

	Functiongetegid := CCallout
		library: cLibrary
		name: 'getegid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getentropy_inLibrary: cLibrary [

	Functiongetentropy := CCallout
		library: cLibrary
		name: 'getentropy'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_geteuid_inLibrary: cLibrary [

	Functiongeteuid := CCallout
		library: cLibrary
		name: 'geteuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getgid_inLibrary: cLibrary [

	Functiongetgid := CCallout
		library: cLibrary
		name: 'getgid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getgroups_inLibrary: cLibrary [

	Functiongetgroups := CCallout
		library: cLibrary
		name: 'getgroups'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_gethostid_inLibrary: cLibrary [

	Functiongethostid := CCallout
		library: cLibrary
		name: 'gethostid'
		result: #'int64'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_gethostname_inLibrary: cLibrary [

	Functiongethostname := CCallout
		library: cLibrary
		name: 'gethostname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getlogin_inLibrary: cLibrary [

	Functiongetlogin := CCallout
		library: cLibrary
		name: 'getlogin'
		result: #'char*'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getlogin_r_inLibrary: cLibrary [

	Functiongetlogin_r := CCallout
		library: cLibrary
		name: 'getlogin_r'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getopt_inLibrary: cLibrary [

	Functiongetopt := CCallout
		library: cLibrary
		name: 'getopt'
		result: #'int32'
		args: #(#'int32' #'ptr' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getpagesize_inLibrary: cLibrary [

	Functiongetpagesize := CCallout
		library: cLibrary
		name: 'getpagesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getpass_inLibrary: cLibrary [

	Functiongetpass := CCallout
		library: cLibrary
		name: 'getpass'
		result: #'char*'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getpgid_inLibrary: cLibrary [

	Functiongetpgid := CCallout
		library: cLibrary
		name: 'getpgid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getpgrp_inLibrary: cLibrary [

	Functiongetpgrp := CCallout
		library: cLibrary
		name: 'getpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getpid_inLibrary: cLibrary [

	Functiongetpid := CCallout
		library: cLibrary
		name: 'getpid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getppid_inLibrary: cLibrary [

	Functiongetppid := CCallout
		library: cLibrary
		name: 'getppid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getsid_inLibrary: cLibrary [

	Functiongetsid := CCallout
		library: cLibrary
		name: 'getsid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getuid_inLibrary: cLibrary [

	Functiongetuid := CCallout
		library: cLibrary
		name: 'getuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getusershell_inLibrary: cLibrary [

	Functiongetusershell := CCallout
		library: cLibrary
		name: 'getusershell'
		result: #'char*'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_getwd_inLibrary: cLibrary [

	Functiongetwd := CCallout
		library: cLibrary
		name: 'getwd'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_isatty_inLibrary: cLibrary [

	Functionisatty := CCallout
		library: cLibrary
		name: 'isatty'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_lchown_inLibrary: cLibrary [

	Functionlchown := CCallout
		library: cLibrary
		name: 'lchown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_link_inLibrary: cLibrary [

	Functionlink := CCallout
		library: cLibrary
		name: 'link'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_linkat_inLibrary: cLibrary [

	Functionlinkat := CCallout
		library: cLibrary
		name: 'linkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_lockf_inLibrary: cLibrary [

	Functionlockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_lseek_inLibrary: cLibrary [

	Functionlseek := CCallout
		library: cLibrary
		name: 'lseek'
		result: #'int64'
		args: #(#'int32' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_nice_inLibrary: cLibrary [

	Functionnice := CCallout
		library: cLibrary
		name: 'nice'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_pathconf_inLibrary: cLibrary [

	Functionpathconf := CCallout
		library: cLibrary
		name: 'pathconf'
		result: #'int64'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_pause_inLibrary: cLibrary [

	Functionpause := CCallout
		library: cLibrary
		name: 'pause'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_pipe_inLibrary: cLibrary [

	Functionpipe := CCallout
		library: cLibrary
		name: 'pipe'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_pread_inLibrary: cLibrary [

	Functionpread := CCallout
		library: cLibrary
		name: 'pread'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_profil_inLibrary: cLibrary [

	Functionprofil := CCallout
		library: cLibrary
		name: 'profil'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'uint64' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_pwrite_inLibrary: cLibrary [

	Functionpwrite := CCallout
		library: cLibrary
		name: 'pwrite'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_read_inLibrary: cLibrary [

	Functionread := CCallout
		library: cLibrary
		name: 'read'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_readlink_inLibrary: cLibrary [

	Functionreadlink := CCallout
		library: cLibrary
		name: 'readlink'
		result: #'int64'
		args: #(#'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_readlinkat_inLibrary: cLibrary [

	Functionreadlinkat := CCallout
		library: cLibrary
		name: 'readlinkat'
		result: #'int64'
		args: #(#'int32' #'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_revoke_inLibrary: cLibrary [

	Functionrevoke := CCallout
		library: cLibrary
		name: 'revoke'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_rmdir_inLibrary: cLibrary [

	Functionrmdir := CCallout
		library: cLibrary
		name: 'rmdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sbrk_inLibrary: cLibrary [

	Functionsbrk := CCallout
		library: cLibrary
		name: 'sbrk'
		result: #'ptr'
		args: #(#'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setdomainname_inLibrary: cLibrary [

	Functionsetdomainname := CCallout
		library: cLibrary
		name: 'setdomainname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setegid_inLibrary: cLibrary [

	Functionsetegid := CCallout
		library: cLibrary
		name: 'setegid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_seteuid_inLibrary: cLibrary [

	Functionseteuid := CCallout
		library: cLibrary
		name: 'seteuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setgid_inLibrary: cLibrary [

	Functionsetgid := CCallout
		library: cLibrary
		name: 'setgid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sethostid_inLibrary: cLibrary [

	Functionsethostid := CCallout
		library: cLibrary
		name: 'sethostid'
		result: #'int32'
		args: #(#'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sethostname_inLibrary: cLibrary [

	Functionsethostname := CCallout
		library: cLibrary
		name: 'sethostname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setlogin_inLibrary: cLibrary [

	Functionsetlogin := CCallout
		library: cLibrary
		name: 'setlogin'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setpgid_inLibrary: cLibrary [

	Functionsetpgid := CCallout
		library: cLibrary
		name: 'setpgid'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setpgrp_inLibrary: cLibrary [

	Functionsetpgrp := CCallout
		library: cLibrary
		name: 'setpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setregid_inLibrary: cLibrary [

	Functionsetregid := CCallout
		library: cLibrary
		name: 'setregid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setreuid_inLibrary: cLibrary [

	Functionsetreuid := CCallout
		library: cLibrary
		name: 'setreuid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setsid_inLibrary: cLibrary [

	Functionsetsid := CCallout
		library: cLibrary
		name: 'setsid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setuid_inLibrary: cLibrary [

	Functionsetuid := CCallout
		library: cLibrary
		name: 'setuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_setusershell_inLibrary: cLibrary [

	Functionsetusershell := CCallout
		library: cLibrary
		name: 'setusershell'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sleep_inLibrary: cLibrary [

	Functionsleep := CCallout
		library: cLibrary
		name: 'sleep'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_symlink_inLibrary: cLibrary [

	Functionsymlink := CCallout
		library: cLibrary
		name: 'symlink'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_symlinkat_inLibrary: cLibrary [

	Functionsymlinkat := CCallout
		library: cLibrary
		name: 'symlinkat'
		result: #'int32'
		args: #(#'const char*' #'int32' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sync_inLibrary: cLibrary [

	Functionsync := CCallout
		library: cLibrary
		name: 'sync'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_syscall_inLibrary: cLibrary [

	Functionsyscall := CCallout
		library: cLibrary
		name: 'syscall'
		result: #'int64'
		args: #(#'int64')
		varArgsAfter: 1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_sysconf_inLibrary: cLibrary [

	Functionsysconf := CCallout
		library: cLibrary
		name: 'sysconf'
		result: #'int64'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_tcgetpgrp_inLibrary: cLibrary [

	Functiontcgetpgrp := CCallout
		library: cLibrary
		name: 'tcgetpgrp'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_tcsetpgrp_inLibrary: cLibrary [

	Functiontcsetpgrp := CCallout
		library: cLibrary
		name: 'tcsetpgrp'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_truncate_inLibrary: cLibrary [

	Functiontruncate := CCallout
		library: cLibrary
		name: 'truncate'
		result: #'int32'
		args: #(#'const char*' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_ttyname_inLibrary: cLibrary [

	Functionttyname := CCallout
		library: cLibrary
		name: 'ttyname'
		result: #'char*'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_ttyname_r_inLibrary: cLibrary [

	Functionttyname_r := CCallout
		library: cLibrary
		name: 'ttyname_r'
		result: #'int32'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_ttyslot_inLibrary: cLibrary [

	Functionttyslot := CCallout
		library: cLibrary
		name: 'ttyslot'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_ualarm_inLibrary: cLibrary [

	Functionualarm := CCallout
		library: cLibrary
		name: 'ualarm'
		result: #'uint32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_unlink_inLibrary: cLibrary [

	Functionunlink := CCallout
		library: cLibrary
		name: 'unlink'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_unlinkat_inLibrary: cLibrary [

	Functionunlinkat := CCallout
		library: cLibrary
		name: 'unlinkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_usleep_inLibrary: cLibrary [

	Functionusleep := CCallout
		library: cLibrary
		name: 'usleep'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_vfork_inLibrary: cLibrary [

	Functionvfork := CCallout
		library: cLibrary
		name: 'vfork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_vhangup_inLibrary: cLibrary [

	Functionvhangup := CCallout
		library: cLibrary
		name: 'vhangup'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunction_write_inLibrary: cLibrary [

	Functionwrite := CCallout
		library: cLibrary
		name: 'write'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libc_unistd_macOS class >> initializeFunctions [

	| library |
	library := CLibrary named: self libraryName.
	self
		initializeFunction_chdir_inLibrary: library;
		initializeFunction_setsid_inLibrary: library;
		initializeFunction_getpgrp_inLibrary: library;
		initializeFunction_execve_inLibrary: library;
		initializeFunction_getsid_inLibrary: library;
		initializeFunction_getlogin_r_inLibrary: library;
		initializeFunction_getgid_inLibrary: library;
		initializeFunction_getopt_inLibrary: library;
		initializeFunction_write_inLibrary: library;
		initializeFunction_ftruncate_inLibrary: library;
		initializeFunction_execle_inLibrary: library;
		initializeFunction_dup2_inLibrary: library;
		initializeFunction_linkat_inLibrary: library;
		initializeFunction_symlinkat_inLibrary: library;
		initializeFunction___getpgid_inLibrary: library;
		initializeFunction_execlp_inLibrary: library;
		initializeFunction_readlinkat_inLibrary: library;
		initializeFunction_unlinkat_inLibrary: library;
		initializeFunction_crypt_inLibrary: library;
		initializeFunction_setpgrp_inLibrary: library;
		initializeFunction_getppid_inLibrary: library;
		initializeFunction_close_inLibrary: library;
		initializeFunction_setegid_inLibrary: library;
		initializeFunction_ttyname_inLibrary: library;
		initializeFunction_sbrk_inLibrary: library;
		initializeFunction_access_inLibrary: library;
		initializeFunction_fchown_inLibrary: library;
		initializeFunction_fpathconf_inLibrary: library;
		initializeFunction_link_inLibrary: library;
		initializeFunction_execvp_inLibrary: library;
		initializeFunction_fork_inLibrary: library;
		initializeFunction_getuid_inLibrary: library;
		initializeFunction_tcgetpgrp_inLibrary: library;
		initializeFunction_getcwd_inLibrary: library;
		initializeFunction_fexecve_inLibrary: library;
		initializeFunction_getpass_inLibrary: library;
		initializeFunction_geteuid_inLibrary: library;
		initializeFunction_rmdir_inLibrary: library;
		initializeFunction_lockf_inLibrary: library;
		initializeFunction_pread_inLibrary: library;
		initializeFunction_fchdir_inLibrary: library;
		initializeFunction_gethostid_inLibrary: library;
		initializeFunction__exit_inLibrary: library;
		initializeFunction_sync_inLibrary: library;
		initializeFunction_setregid_inLibrary: library;
		initializeFunction_setpgid_inLibrary: library;
		initializeFunction_revoke_inLibrary: library;
		initializeFunction_tcsetpgrp_inLibrary: library;
		initializeFunction_setuid_inLibrary: library;
		initializeFunction_read_inLibrary: library;
		initializeFunction_setgid_inLibrary: library;
		initializeFunction_pause_inLibrary: library;
		initializeFunction_fsync_inLibrary: library;
		initializeFunction_isatty_inLibrary: library;
		initializeFunction_dup_inLibrary: library;
		initializeFunction_alarm_inLibrary: library;
		initializeFunction_endusershell_inLibrary: library;
		initializeFunction_pwrite_inLibrary: library;
		initializeFunction_execl_inLibrary: library;
		initializeFunction_setdomainname_inLibrary: library;
		initializeFunction_syscall_inLibrary: library;
		initializeFunction_confstr_inLibrary: library;
		initializeFunction_vfork_inLibrary: library;
		initializeFunction_getpgid_inLibrary: library;
		initializeFunction_setusershell_inLibrary: library;
		initializeFunction_getpagesize_inLibrary: library;
		initializeFunction_pipe_inLibrary: library;
		initializeFunction_usleep_inLibrary: library;
		initializeFunction_sysconf_inLibrary: library;
		initializeFunction_chroot_inLibrary: library;
		initializeFunction_getdtablesize_inLibrary: library;
		initializeFunction_fchownat_inLibrary: library;
		initializeFunction_vhangup_inLibrary: library;
		initializeFunction_ttyname_r_inLibrary: library;
		initializeFunction_acct_inLibrary: library;
		initializeFunction_brk_inLibrary: library;
		initializeFunction_execv_inLibrary: library;
		initializeFunction_sethostid_inLibrary: library;
		initializeFunction_setlogin_inLibrary: library;
		initializeFunction_daemon_inLibrary: library;
		initializeFunction_pathconf_inLibrary: library;
		initializeFunction_seteuid_inLibrary: library;
		initializeFunction_lchown_inLibrary: library;
		initializeFunction_gethostname_inLibrary: library;
		initializeFunction_getusershell_inLibrary: library;
		initializeFunction_lseek_inLibrary: library;
		initializeFunction_nice_inLibrary: library;
		initializeFunction_getegid_inLibrary: library;
		initializeFunction_faccessat_inLibrary: library;
		initializeFunction_getpid_inLibrary: library;
		initializeFunction_truncate_inLibrary: library;
		initializeFunction_getentropy_inLibrary: library;
		initializeFunction_unlink_inLibrary: library;
		initializeFunction_symlink_inLibrary: library;
		initializeFunction_getdomainname_inLibrary: library;
		initializeFunction_fdatasync_inLibrary: library;
		initializeFunction_ttyslot_inLibrary: library;
		initializeFunction_getlogin_inLibrary: library;
		initializeFunction_sethostname_inLibrary: library;
		initializeFunction_profil_inLibrary: library;
		initializeFunction_sleep_inLibrary: library;
		initializeFunction_getgroups_inLibrary: library;
		initializeFunction_getwd_inLibrary: library;
		initializeFunction_readlink_inLibrary: library;
		initializeFunction_ualarm_inLibrary: library;
		initializeFunction_chown_inLibrary: library;
		initializeFunction_setreuid_inLibrary: library;
		yourself
]

{ #category : 'accessing' }
_libc_unistd_macOS class >> libraryName [

	^'/usr/lib/system/libsystem_c.dylib'
]

{ #category : 'Functions' }
_libc_unistd_macOS >> __getpgid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Function__getpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> _exit: args errno: errnoHolder [
	"Interpreted as #void from #( #'int32' )"

	^Function_exit
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> access: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'int32' )"

	^Functionaccess
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> acct: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionacct
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> alarm: args errno: errnoHolder [
	"Interpreted as #uint32 from #( #'uint32' )"

	^Functionalarm
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> brk: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionbrk
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> chdir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionchdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> chown: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' #'uint32' )"

	^Functionchown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> chroot: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionchroot
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> close: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> confstr: args errno: errnoHolder [
	"Interpreted as #uint64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionconfstr
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> crypt: args errno: errnoHolder [
	"Interpreted as #char* from #( #'const char*' #'const char*' )"

	^Functioncrypt
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> daemon: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiondaemon
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> dup: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functiondup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> dup2: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiondup2
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> endusershell: args errno: errnoHolder [
	"Interpreted as #void from #( )"

	^Functionendusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execl: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexecl
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execle: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexecle
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execlp: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexeclp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execv: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionexecv
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execve: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' #'ptr' )"

	^Functionexecve
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> execvp: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionexecvp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> faccessat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' #'int32' )"

	^Functionfaccessat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fchdir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionfchdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fchown: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'uint32' #'uint32' )"

	^Functionfchown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fchownat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' #'uint32' #'int32' )"

	^Functionfchownat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fdatasync: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionfdatasync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fexecve: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' #'ptr' )"

	^Functionfexecve
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fork: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionfork
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fpathconf: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'int32' )"

	^Functionfpathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> fsync: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionfsync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ftruncate: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int64' )"

	^Functionftruncate
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getcwd: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' #'uint64' )"

	^Functiongetcwd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getdomainname: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetdomainname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getdtablesize: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetdtablesize
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getegid: args errno: errnoHolder [
	"Interpreted as #uint32 from #( )"

	^Functiongetegid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getentropy: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetentropy
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> geteuid: args errno: errnoHolder [
	"Interpreted as #uint32 from #( )"

	^Functiongeteuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getgid: args errno: errnoHolder [
	"Interpreted as #uint32 from #( )"

	^Functiongetgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getgroups: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functiongetgroups
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> gethostid: args errno: errnoHolder [
	"Interpreted as #int64 from #( )"

	^Functiongethostid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> gethostname: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongethostname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getlogin_r: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetlogin_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getlogin: args errno: errnoHolder [
	"Interpreted as #char* from #( )"

	^Functiongetlogin
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getopt: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' #'const char*' )"

	^Functiongetopt
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpagesize: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetpagesize
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpass: args errno: errnoHolder [
	"Interpreted as #char* from #( #'const char*' )"

	^Functiongetpass
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpgid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functiongetpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpgrp: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getpid: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetpid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getppid: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetppid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getsid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functiongetsid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getuid: args errno: errnoHolder [
	"Interpreted as #uint32 from #( )"

	^Functiongetuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getusershell: args errno: errnoHolder [
	"Interpreted as #char* from #( )"

	^Functiongetusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> getwd: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' )"

	^Functiongetwd
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> isatty: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionisatty
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> lchown: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint32' #'uint32' )"

	^Functionlchown
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> link: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> linkat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' #'const char*' #'int32' )"

	^Functionlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> lockf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' #'int64' )"

	^Functionlockf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> lseek: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'int64' #'int32' )"

	^Functionlseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> nice: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionnice
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pathconf: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'const char*' #'int32' )"

	^Functionpathconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pause: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionpause
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pipe: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionpipe
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pread: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'int64' )"

	^Functionpread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> profil: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' #'uint64' #'uint32' )"

	^Functionprofil
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> pwrite: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'int64' )"

	^Functionpwrite
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> read: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> readlink: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'const char*' #'ptr' #'uint64' )"

	^Functionreadlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> readlinkat: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'const char*' #'ptr' #'uint64' )"

	^Functionreadlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> revoke: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionrevoke
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> rmdir: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionrmdir
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sbrk: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'int64' )"

	^Functionsbrk
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setdomainname: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint64' )"

	^Functionsetdomainname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setegid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetegid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> seteuid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' )"

	^Functionseteuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setgid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sethostid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int64' )"

	^Functionsethostid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sethostname: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'uint64' )"

	^Functionsethostname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setlogin: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionsetlogin
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setpgid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functionsetpgid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setpgrp: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionsetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setregid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' #'uint32' )"

	^Functionsetregid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setreuid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' #'uint32' )"

	^Functionsetreuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setsid: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionsetsid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setuid: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetuid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> setusershell: args errno: errnoHolder [
	"Interpreted as #void from #( )"

	^Functionsetusershell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sleep: args errno: errnoHolder [
	"Interpreted as #uint32 from #( #'uint32' )"

	^Functionsleep
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> symlink: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionsymlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> symlinkat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'int32' #'const char*' )"

	^Functionsymlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sync: args errno: errnoHolder [
	"Interpreted as #void from #( )"

	^Functionsync
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> syscall: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int64' )"

	^Functionsyscall
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> sysconf: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' )"

	^Functionsysconf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> tcgetpgrp: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functiontcgetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> tcsetpgrp: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiontcsetpgrp
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> truncate: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'int64' )"

	^Functiontruncate
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ttyname_r: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' #'uint64' )"

	^Functionttyname_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ttyname: args errno: errnoHolder [
	"Interpreted as #char* from #( #'int32' )"

	^Functionttyname
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ttyslot: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionttyslot
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> ualarm: args errno: errnoHolder [
	"Interpreted as #uint32 from #( #'uint32' #'uint32' )"

	^Functionualarm
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> unlink: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionunlink
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> unlinkat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' )"

	^Functionunlinkat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> usleep: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'uint32' )"

	^Functionusleep
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> vfork: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionvfork
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> vhangup: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functionvhangup
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_unistd_macOS >> write: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionwrite
		callWith: args
		errno: errnoHolder
]
