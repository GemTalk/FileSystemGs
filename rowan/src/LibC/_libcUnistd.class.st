Class {
	#name : '_libcUnistd',
	#superclass : 'Object',
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
		'Functionget_current_dir_name',
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

{ #category : 'initializing' }
_libcUnistd class >> initialize [
	self initializeFunctions
]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction___getpgid_inLibrary: cLibrary [

	Function__getpgid := CCallout
		library: cLibrary
		name: '__getpgid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction__exit_inLibrary: cLibrary [

	Function_exit := CCallout
		library: cLibrary
		name: '_exit'
		result: #'void'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_access_inLibrary: cLibrary [

	Functionaccess := CCallout
		library: cLibrary
		name: 'access'
		result: #'int32'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_acct_inLibrary: cLibrary [

	Functionacct := CCallout
		library: cLibrary
		name: 'acct'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_alarm_inLibrary: cLibrary [

	Functionalarm := CCallout
		library: cLibrary
		name: 'alarm'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_brk_inLibrary: cLibrary [

	Functionbrk := CCallout
		library: cLibrary
		name: 'brk'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_chdir_inLibrary: cLibrary [

	Functionchdir := CCallout
		library: cLibrary
		name: 'chdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_chown_inLibrary: cLibrary [

	Functionchown := CCallout
		library: cLibrary
		name: 'chown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_chroot_inLibrary: cLibrary [

	Functionchroot := CCallout
		library: cLibrary
		name: 'chroot'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_close_inLibrary: cLibrary [

	Functionclose := CCallout
		library: cLibrary
		name: 'close'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_confstr_inLibrary: cLibrary [

	Functionconfstr := CCallout
		library: cLibrary
		name: 'confstr'
		result: #'uint64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_crypt_inLibrary: cLibrary [

	Functioncrypt := CCallout
		library: cLibrary
		name: 'crypt'
		result: #'char*'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_daemon_inLibrary: cLibrary [

	Functiondaemon := CCallout
		library: cLibrary
		name: 'daemon'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_dup_inLibrary: cLibrary [

	Functiondup := CCallout
		library: cLibrary
		name: 'dup'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_dup2_inLibrary: cLibrary [

	Functiondup2 := CCallout
		library: cLibrary
		name: 'dup2'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_endusershell_inLibrary: cLibrary [

	Functionendusershell := CCallout
		library: cLibrary
		name: 'endusershell'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execl_inLibrary: cLibrary [

	Functionexecl := CCallout
		library: cLibrary
		name: 'execl'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execle_inLibrary: cLibrary [

	Functionexecle := CCallout
		library: cLibrary
		name: 'execle'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execlp_inLibrary: cLibrary [

	Functionexeclp := CCallout
		library: cLibrary
		name: 'execlp'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execv_inLibrary: cLibrary [

	Functionexecv := CCallout
		library: cLibrary
		name: 'execv'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execve_inLibrary: cLibrary [

	Functionexecve := CCallout
		library: cLibrary
		name: 'execve'
		result: #'int32'
		args: #(#'const char*' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_execvp_inLibrary: cLibrary [

	Functionexecvp := CCallout
		library: cLibrary
		name: 'execvp'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_faccessat_inLibrary: cLibrary [

	Functionfaccessat := CCallout
		library: cLibrary
		name: 'faccessat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fchdir_inLibrary: cLibrary [

	Functionfchdir := CCallout
		library: cLibrary
		name: 'fchdir'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fchown_inLibrary: cLibrary [

	Functionfchown := CCallout
		library: cLibrary
		name: 'fchown'
		result: #'int32'
		args: #(#'int32' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fchownat_inLibrary: cLibrary [

	Functionfchownat := CCallout
		library: cLibrary
		name: 'fchownat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'uint32' #'uint32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fdatasync_inLibrary: cLibrary [

	Functionfdatasync := CCallout
		library: cLibrary
		name: 'fdatasync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fexecve_inLibrary: cLibrary [

	Functionfexecve := CCallout
		library: cLibrary
		name: 'fexecve'
		result: #'int32'
		args: #(#'int32' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fork_inLibrary: cLibrary [

	Functionfork := CCallout
		library: cLibrary
		name: 'fork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fpathconf_inLibrary: cLibrary [

	Functionfpathconf := CCallout
		library: cLibrary
		name: 'fpathconf'
		result: #'int64'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_fsync_inLibrary: cLibrary [

	Functionfsync := CCallout
		library: cLibrary
		name: 'fsync'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_ftruncate_inLibrary: cLibrary [

	Functionftruncate := CCallout
		library: cLibrary
		name: 'ftruncate'
		result: #'int32'
		args: #(#'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_get_current_dir_name_inLibrary: cLibrary [

	Functionget_current_dir_name := CCallout
		library: cLibrary
		name: 'get_current_dir_name'
		result: #'ptr'
		args: #()
		varArgsAfter: -1
]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getcwd_inLibrary: cLibrary [

	Functiongetcwd := CCallout
		library: cLibrary
		name: 'getcwd'
		result: #'char*'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getdomainname_inLibrary: cLibrary [

	Functiongetdomainname := CCallout
		library: cLibrary
		name: 'getdomainname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getdtablesize_inLibrary: cLibrary [

	Functiongetdtablesize := CCallout
		library: cLibrary
		name: 'getdtablesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getegid_inLibrary: cLibrary [

	Functiongetegid := CCallout
		library: cLibrary
		name: 'getegid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getentropy_inLibrary: cLibrary [

	Functiongetentropy := CCallout
		library: cLibrary
		name: 'getentropy'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_geteuid_inLibrary: cLibrary [

	Functiongeteuid := CCallout
		library: cLibrary
		name: 'geteuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getgid_inLibrary: cLibrary [

	Functiongetgid := CCallout
		library: cLibrary
		name: 'getgid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getgroups_inLibrary: cLibrary [

	Functiongetgroups := CCallout
		library: cLibrary
		name: 'getgroups'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_gethostid_inLibrary: cLibrary [

	Functiongethostid := CCallout
		library: cLibrary
		name: 'gethostid'
		result: #'int64'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_gethostname_inLibrary: cLibrary [

	Functiongethostname := CCallout
		library: cLibrary
		name: 'gethostname'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getlogin_inLibrary: cLibrary [

	Functiongetlogin := CCallout
		library: cLibrary
		name: 'getlogin'
		result: #'char*'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getlogin_r_inLibrary: cLibrary [

	Functiongetlogin_r := CCallout
		library: cLibrary
		name: 'getlogin_r'
		result: #'int32'
		args: #(#'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getopt_inLibrary: cLibrary [

	Functiongetopt := CCallout
		library: cLibrary
		name: 'getopt'
		result: #'int32'
		args: #(#'int32' #'ptr' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getpagesize_inLibrary: cLibrary [

	Functiongetpagesize := CCallout
		library: cLibrary
		name: 'getpagesize'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getpass_inLibrary: cLibrary [

	Functiongetpass := CCallout
		library: cLibrary
		name: 'getpass'
		result: #'char*'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getpgid_inLibrary: cLibrary [

	Functiongetpgid := CCallout
		library: cLibrary
		name: 'getpgid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getpgrp_inLibrary: cLibrary [

	Functiongetpgrp := CCallout
		library: cLibrary
		name: 'getpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getpid_inLibrary: cLibrary [

	Functiongetpid := CCallout
		library: cLibrary
		name: 'getpid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getppid_inLibrary: cLibrary [

	Functiongetppid := CCallout
		library: cLibrary
		name: 'getppid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getsid_inLibrary: cLibrary [

	Functiongetsid := CCallout
		library: cLibrary
		name: 'getsid'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getuid_inLibrary: cLibrary [

	Functiongetuid := CCallout
		library: cLibrary
		name: 'getuid'
		result: #'uint32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getusershell_inLibrary: cLibrary [

	Functiongetusershell := CCallout
		library: cLibrary
		name: 'getusershell'
		result: #'char*'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_getwd_inLibrary: cLibrary [

	Functiongetwd := CCallout
		library: cLibrary
		name: 'getwd'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_isatty_inLibrary: cLibrary [

	Functionisatty := CCallout
		library: cLibrary
		name: 'isatty'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_lchown_inLibrary: cLibrary [

	Functionlchown := CCallout
		library: cLibrary
		name: 'lchown'
		result: #'int32'
		args: #(#'const char*' #'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_link_inLibrary: cLibrary [

	Functionlink := CCallout
		library: cLibrary
		name: 'link'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_linkat_inLibrary: cLibrary [

	Functionlinkat := CCallout
		library: cLibrary
		name: 'linkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_lockf_inLibrary: cLibrary [

	Functionlockf := CCallout
		library: cLibrary
		name: 'lockf'
		result: #'int32'
		args: #(#'int32' #'int32' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_lseek_inLibrary: cLibrary [

	Functionlseek := CCallout
		library: cLibrary
		name: 'lseek'
		result: #'int64'
		args: #(#'int32' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_nice_inLibrary: cLibrary [

	Functionnice := CCallout
		library: cLibrary
		name: 'nice'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_pathconf_inLibrary: cLibrary [

	Functionpathconf := CCallout
		library: cLibrary
		name: 'pathconf'
		result: #'int64'
		args: #(#'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_pause_inLibrary: cLibrary [

	Functionpause := CCallout
		library: cLibrary
		name: 'pause'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_pipe_inLibrary: cLibrary [

	Functionpipe := CCallout
		library: cLibrary
		name: 'pipe'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_pread_inLibrary: cLibrary [

	Functionpread := CCallout
		library: cLibrary
		name: 'pread'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_profil_inLibrary: cLibrary [

	Functionprofil := CCallout
		library: cLibrary
		name: 'profil'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'uint64' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_pwrite_inLibrary: cLibrary [

	Functionpwrite := CCallout
		library: cLibrary
		name: 'pwrite'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_read_inLibrary: cLibrary [

	Functionread := CCallout
		library: cLibrary
		name: 'read'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_readlink_inLibrary: cLibrary [

	Functionreadlink := CCallout
		library: cLibrary
		name: 'readlink'
		result: #'int64'
		args: #(#'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_readlinkat_inLibrary: cLibrary [

	Functionreadlinkat := CCallout
		library: cLibrary
		name: 'readlinkat'
		result: #'int64'
		args: #(#'int32' #'const char*' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_revoke_inLibrary: cLibrary [

	Functionrevoke := CCallout
		library: cLibrary
		name: 'revoke'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_rmdir_inLibrary: cLibrary [

	Functionrmdir := CCallout
		library: cLibrary
		name: 'rmdir'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sbrk_inLibrary: cLibrary [

	Functionsbrk := CCallout
		library: cLibrary
		name: 'sbrk'
		result: #'ptr'
		args: #(#'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setdomainname_inLibrary: cLibrary [

	Functionsetdomainname := CCallout
		library: cLibrary
		name: 'setdomainname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setegid_inLibrary: cLibrary [

	Functionsetegid := CCallout
		library: cLibrary
		name: 'setegid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_seteuid_inLibrary: cLibrary [

	Functionseteuid := CCallout
		library: cLibrary
		name: 'seteuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setgid_inLibrary: cLibrary [

	Functionsetgid := CCallout
		library: cLibrary
		name: 'setgid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sethostid_inLibrary: cLibrary [

	Functionsethostid := CCallout
		library: cLibrary
		name: 'sethostid'
		result: #'int32'
		args: #(#'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sethostname_inLibrary: cLibrary [

	Functionsethostname := CCallout
		library: cLibrary
		name: 'sethostname'
		result: #'int32'
		args: #(#'const char*' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setlogin_inLibrary: cLibrary [

	Functionsetlogin := CCallout
		library: cLibrary
		name: 'setlogin'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setpgid_inLibrary: cLibrary [

	Functionsetpgid := CCallout
		library: cLibrary
		name: 'setpgid'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setpgrp_inLibrary: cLibrary [

	Functionsetpgrp := CCallout
		library: cLibrary
		name: 'setpgrp'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setregid_inLibrary: cLibrary [

	Functionsetregid := CCallout
		library: cLibrary
		name: 'setregid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setreuid_inLibrary: cLibrary [

	Functionsetreuid := CCallout
		library: cLibrary
		name: 'setreuid'
		result: #'int32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setsid_inLibrary: cLibrary [

	Functionsetsid := CCallout
		library: cLibrary
		name: 'setsid'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setuid_inLibrary: cLibrary [

	Functionsetuid := CCallout
		library: cLibrary
		name: 'setuid'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_setusershell_inLibrary: cLibrary [

	Functionsetusershell := CCallout
		library: cLibrary
		name: 'setusershell'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sleep_inLibrary: cLibrary [

	Functionsleep := CCallout
		library: cLibrary
		name: 'sleep'
		result: #'uint32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_symlink_inLibrary: cLibrary [

	Functionsymlink := CCallout
		library: cLibrary
		name: 'symlink'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_symlinkat_inLibrary: cLibrary [

	Functionsymlinkat := CCallout
		library: cLibrary
		name: 'symlinkat'
		result: #'int32'
		args: #(#'const char*' #'int32' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sync_inLibrary: cLibrary [

	Functionsync := CCallout
		library: cLibrary
		name: 'sync'
		result: #'void'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_syscall_inLibrary: cLibrary [

	Functionsyscall := CCallout
		library: cLibrary
		name: 'syscall'
		result: #'int64'
		args: #(#'int64')
		varArgsAfter: 1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_sysconf_inLibrary: cLibrary [

	Functionsysconf := CCallout
		library: cLibrary
		name: 'sysconf'
		result: #'int64'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_tcgetpgrp_inLibrary: cLibrary [

	Functiontcgetpgrp := CCallout
		library: cLibrary
		name: 'tcgetpgrp'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_tcsetpgrp_inLibrary: cLibrary [

	Functiontcsetpgrp := CCallout
		library: cLibrary
		name: 'tcsetpgrp'
		result: #'int32'
		args: #(#'int32' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_truncate_inLibrary: cLibrary [

	Functiontruncate := CCallout
		library: cLibrary
		name: 'truncate'
		result: #'int32'
		args: #(#'const char*' #'int64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_ttyname_inLibrary: cLibrary [

	Functionttyname := CCallout
		library: cLibrary
		name: 'ttyname'
		result: #'char*'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_ttyname_r_inLibrary: cLibrary [

	Functionttyname_r := CCallout
		library: cLibrary
		name: 'ttyname_r'
		result: #'int32'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_ttyslot_inLibrary: cLibrary [

	Functionttyslot := CCallout
		library: cLibrary
		name: 'ttyslot'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_ualarm_inLibrary: cLibrary [

	Functionualarm := CCallout
		library: cLibrary
		name: 'ualarm'
		result: #'uint32'
		args: #(#'uint32' #'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_unlink_inLibrary: cLibrary [

	Functionunlink := CCallout
		library: cLibrary
		name: 'unlink'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_unlinkat_inLibrary: cLibrary [

	Functionunlinkat := CCallout
		library: cLibrary
		name: 'unlinkat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_usleep_inLibrary: cLibrary [

	Functionusleep := CCallout
		library: cLibrary
		name: 'usleep'
		result: #'int32'
		args: #(#'uint32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_vfork_inLibrary: cLibrary [

	Functionvfork := CCallout
		library: cLibrary
		name: 'vfork'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_vhangup_inLibrary: cLibrary [

	Functionvhangup := CCallout
		library: cLibrary
		name: 'vhangup'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunction_write_inLibrary: cLibrary [

	Functionwrite := CCallout
		library: cLibrary
		name: 'write'
		result: #'int64'
		args: #(#'int32' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcUnistd class >> initializeFunctions [

	| library |
	library := CLibrary named: 'libc.so.6'.
	self
		initializeFunction_access_inLibrary: library;
		initializeFunction_acct_inLibrary: library;
		initializeFunction_alarm_inLibrary: library;
		initializeFunction_brk_inLibrary: library;
		initializeFunction_chdir_inLibrary: library;
		initializeFunction_chown_inLibrary: library;
		initializeFunction_chroot_inLibrary: library;
		initializeFunction_close_inLibrary: library;
		initializeFunction_confstr_inLibrary: library;
		initializeFunction_crypt_inLibrary: library;
		initializeFunction_daemon_inLibrary: library;
		initializeFunction_dup_inLibrary: library;
		initializeFunction_dup2_inLibrary: library;
		initializeFunction_endusershell_inLibrary: library;
		initializeFunction_execl_inLibrary: library;
		initializeFunction_execle_inLibrary: library;
		initializeFunction_execlp_inLibrary: library;
		initializeFunction_execv_inLibrary: library;
		initializeFunction_execve_inLibrary: library;
		initializeFunction_execvp_inLibrary: library;
		initializeFunction_faccessat_inLibrary: library;
		initializeFunction_fchdir_inLibrary: library;
		initializeFunction_fchown_inLibrary: library;
		initializeFunction_fchownat_inLibrary: library;
		initializeFunction_fdatasync_inLibrary: library;
		initializeFunction_fexecve_inLibrary: library;
		initializeFunction_fork_inLibrary: library;
		initializeFunction_fpathconf_inLibrary: library;
		initializeFunction_fsync_inLibrary: library;
		initializeFunction_ftruncate_inLibrary: library;
		initializeFunction_get_current_dir_name_inLibrary: library;
		initializeFunction_getcwd_inLibrary: library;
		initializeFunction_getdomainname_inLibrary: library;
		initializeFunction_getdtablesize_inLibrary: library;
		initializeFunction_getegid_inLibrary: library;
		initializeFunction_getentropy_inLibrary: library;
		initializeFunction_geteuid_inLibrary: library;
		initializeFunction_getgid_inLibrary: library;
		initializeFunction_getgroups_inLibrary: library;
		initializeFunction_gethostid_inLibrary: library;
		initializeFunction_gethostname_inLibrary: library;
		initializeFunction_getlogin_inLibrary: library;
		initializeFunction_getlogin_r_inLibrary: library;
		initializeFunction_getopt_inLibrary: library;
		initializeFunction_getpagesize_inLibrary: library;
		initializeFunction_getpass_inLibrary: library;
		initializeFunction_getpgid_inLibrary: library;
		initializeFunction_getpgrp_inLibrary: library;
		initializeFunction_getpid_inLibrary: library;
		initializeFunction_getppid_inLibrary: library;
		initializeFunction_getsid_inLibrary: library;
		initializeFunction_getuid_inLibrary: library;
		initializeFunction_getusershell_inLibrary: library;
		initializeFunction_getwd_inLibrary: library;
		initializeFunction_isatty_inLibrary: library;
		initializeFunction_lchown_inLibrary: library;
		initializeFunction_link_inLibrary: library;
		initializeFunction_linkat_inLibrary: library;
		initializeFunction_lockf_inLibrary: library;
		initializeFunction_lseek_inLibrary: library;
		initializeFunction_nice_inLibrary: library;
		initializeFunction_pathconf_inLibrary: library;
		initializeFunction_pause_inLibrary: library;
		initializeFunction_pipe_inLibrary: library;
		initializeFunction_pread_inLibrary: library;
		initializeFunction_profil_inLibrary: library;
		initializeFunction_pwrite_inLibrary: library;
		initializeFunction_read_inLibrary: library;
		initializeFunction_readlink_inLibrary: library;
		initializeFunction_readlinkat_inLibrary: library;
		initializeFunction_revoke_inLibrary: library;
		initializeFunction_rmdir_inLibrary: library;
		initializeFunction_sbrk_inLibrary: library;
		initializeFunction_setdomainname_inLibrary: library;
		initializeFunction_setegid_inLibrary: library;
		initializeFunction_seteuid_inLibrary: library;
		initializeFunction_setgid_inLibrary: library;
		initializeFunction_sethostid_inLibrary: library;
		initializeFunction_sethostname_inLibrary: library;
		initializeFunction_setlogin_inLibrary: library;
		initializeFunction_setpgid_inLibrary: library;
		initializeFunction_setpgrp_inLibrary: library;
		initializeFunction_setregid_inLibrary: library;
		initializeFunction_setreuid_inLibrary: library;
		initializeFunction_setsid_inLibrary: library;
		initializeFunction_setuid_inLibrary: library;
		initializeFunction_setusershell_inLibrary: library;
		initializeFunction_sleep_inLibrary: library;
		initializeFunction_symlink_inLibrary: library;
		initializeFunction_symlinkat_inLibrary: library;
		initializeFunction_sync_inLibrary: library;
		initializeFunction_syscall_inLibrary: library;
		initializeFunction_sysconf_inLibrary: library;
		initializeFunction_tcgetpgrp_inLibrary: library;
		initializeFunction_tcsetpgrp_inLibrary: library;
		initializeFunction_truncate_inLibrary: library;
		initializeFunction_ttyname_inLibrary: library;
		initializeFunction_ttyname_r_inLibrary: library;
		initializeFunction_ttyslot_inLibrary: library;
		initializeFunction_ualarm_inLibrary: library;
		initializeFunction_unlink_inLibrary: library;
		initializeFunction_unlinkat_inLibrary: library;
		initializeFunction_usleep_inLibrary: library;
		initializeFunction_vfork_inLibrary: library;
		initializeFunction_vhangup_inLibrary: library;
		initializeFunction_write_inLibrary: library;
		initializeFunction__exit_inLibrary: library;
		initializeFunction___getpgid_inLibrary: library;
		yourself.
]

{ #category : 'Functions' }
_libcUnistd >> __getpgid_: __pid [ 
	"/usr/include/unistd.h line 637
extern __pid_t __getpgid (__pid_t __pid)                                         __attribute__ ((__nothrow__ , __leaf__))                                               ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Function__getpgid callWith: { __pid }

]

{ #category : 'Functions' }
_libcUnistd >> _exit_: __status [ 
	"/usr/include/unistd.h line 603
extern void _exit (int __status) __attribute__ ((__noreturn__));"

	"Interpreted as #void from #( #'int32' )"

	^Function_exit callWith: { __status }

]

{ #category : 'Functions' }
_libcUnistd >> access_: __name _: __type [ 
	"/usr/include/unistd.h line 287
extern int access (const char *__name, int __type)                                                   __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                                           (1)                                                          ))                                                                         ;"

	"Interpreted as #int32 from #( #'const char*' #'int32' )"

	^Functionaccess callWith: { __name. __type }

]

{ #category : 'Functions' }
_libcUnistd >> acct_: __name [ 
	"/usr/include/unistd.h line 923
extern int acct (const char *__name)                                     __attribute__ ((__nothrow__ , __leaf__))                                           ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionacct callWith: { __name }

]

{ #category : 'Functions' }
_libcUnistd >> alarm_: __seconds [ 
	"/usr/include/unistd.h line 432
extern unsigned int alarm (unsigned int __seconds)                                                   __attribute__ ((__nothrow__ , __leaf__))                                                         ;"

	"Interpreted as #uint32 from #( #'uint32' )"

	^Functionalarm callWith: { __seconds }

]

{ #category : 'Functions' }
_libcUnistd >> brk_: __addr [ 
	"/usr/include/unistd.h line 1035
extern int brk (void *__addr)                              __attribute__ ((__nothrow__ , __leaf__))                                           ;"

	"Interpreted as #int32 from #( #'ptr' )"

	^Functionbrk callWith: { __addr }

]

{ #category : 'Functions' }
_libcUnistd >> chdir_: __path [ 
	"/usr/include/unistd.h line 497
extern int chdir (const char *__path)                                      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                              (1)                                             ))                                                                   ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionchdir callWith: { __path }

]

{ #category : 'Functions' }
_libcUnistd >> chown_: __file _: __owner _: __group [ 
	"/usr/include/unistd.h line 473
extern int chown (const char *__file, __uid_t __owner, __gid_t __group)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'const char*' #'uint32' #'uint32' )"

	^Functionchown callWith: { __file. __owner. __group }

]

{ #category : 'Functions' }
_libcUnistd >> chroot_: __path [ 
	"/usr/include/unistd.h line 942
extern int chroot (const char *__path)                                       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                               (1)                                              ))                                                                    ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionchroot callWith: { __path }

]

{ #category : 'Functions' }
_libcUnistd >> close_: __fd [ 
	"/usr/include/unistd.h line 353
extern int close (int __fd);"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionclose callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> confstr_: __name _: __buf _: __len [ 
	"/usr/include/unistd.h line 623
extern size_t confstr (int __name, char *__buf, size_t __len)                                                              __attribute__ ((__nothrow__ , __leaf__))                                                                    ;"

	"Interpreted as #uint64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionconfstr callWith: { __name. __buf. __len }

]

{ #category : 'Functions' }
_libcUnistd >> crypt_: __key _: __salt [ 
	"/usr/include/unistd.h line 1124
extern char *crypt (const char *__key, const char *__salt)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #char* from #( #'const char*' #'const char*' )"

	^Functioncrypt callWith: { __key. __salt }

]

{ #category : 'Functions' }
_libcUnistd >> daemon_: __nochdir _: __noclose [ 
	"/usr/include/unistd.h line 935
extern int daemon (int __nochdir, int __noclose)                                                 __attribute__ ((__nothrow__ , __leaf__))                                                              ;"

	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiondaemon callWith: { __nochdir. __noclose }

]

{ #category : 'Functions' }
_libcUnistd >> dup_: __fd [ 
	"/usr/include/unistd.h line 531
extern int dup (int __fd)                          __attribute__ ((__nothrow__ , __leaf__))                                       ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functiondup callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> dup2_: __fd _: __fd2 [ 
	"/usr/include/unistd.h line 534
extern int dup2 (int __fd, int __fd2)                                      __attribute__ ((__nothrow__ , __leaf__))                                            ;"

	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiondup2 callWith: { __fd. __fd2 }

]

{ #category : 'Functions' }
_libcUnistd >> endusershell [
	"/usr/include/unistd.h line 928
extern void endusershell (void)                                __attribute__ ((__nothrow__ , __leaf__))                                      ;"

	"Interpreted as #void from #( )"

	^Functionendusershell callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> execl_: __path _: __arg [ 
	"/usr/include/unistd.h line 573
extern int execl (const char *__path, const char *__arg, ...)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexecl callWith: { __path. __arg"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcUnistd >> execle_: __path _: __arg [ 
	"/usr/include/unistd.h line 568
extern int execle (const char *__path, const char *__arg, ...)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexecle callWith: { __path. __arg"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcUnistd >> execlp_: __file _: __arg [ 
	"/usr/include/unistd.h line 584
extern int execlp (const char *__file, const char *__arg, ...)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionexeclp callWith: { __file. __arg"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcUnistd >> execv_: __path _: __argv [ 
	"/usr/include/unistd.h line 563
extern int execv (const char *__path, char *const __argv[])     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionexecv callWith: { __path. __argv }

]

{ #category : 'Functions' }
_libcUnistd >> execve_: __path _: __argv _: __envp [ 
	"/usr/include/unistd.h line 551
extern int execve (const char *__path, char *const __argv[],     char *const __envp[])                           __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                   (1, 2)                                  ))                                                    ;"

	"Interpreted as #int32 from #( #'const char*' #'ptr' #'ptr' )"

	^Functionexecve callWith: { __path. __argv. __envp }

]

{ #category : 'Functions' }
_libcUnistd >> execvp_: __file _: __argv [ 
	"/usr/include/unistd.h line 578
extern int execvp (const char *__file, char *const __argv[])     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                              ;"

	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionexecvp callWith: { __file. __argv }

]

{ #category : 'Functions' }
_libcUnistd >> faccessat_: __fd _: __file _: __type _: __flag [ 
	"/usr/include/unistd.h line 304
extern int faccessat (int __fd, const char *__file, int __type, int __flag)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2)            ))                                  ;"

	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' #'int32' )"

	^Functionfaccessat callWith: { __fd. __file. __type. __flag }

]

{ #category : 'Functions' }
_libcUnistd >> fchdir_: __fd [ 
	"/usr/include/unistd.h line 501
extern int fchdir (int __fd)                             __attribute__ ((__nothrow__ , __leaf__))                                          ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionfchdir callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> fchown_: __fd _: __owner _: __group [ 
	"/usr/include/unistd.h line 478
extern int fchown (int __fd, __uid_t __owner, __gid_t __group)                                                               __attribute__ ((__nothrow__ , __leaf__))                                                                            ;"

	"Interpreted as #int32 from #( #'int32' #'uint32' #'uint32' )"

	^Functionfchown callWith: { __fd. __owner. __group }

]

{ #category : 'Functions' }
_libcUnistd >> fchownat_: __fd _: __file _: __owner _: __group _: __flag [ 
	"/usr/include/unistd.h line 491
extern int fchownat (int __fd, const char *__file, __uid_t __owner,       __gid_t __group, int __flag)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2)            ))                                  ;"

	"Interpreted as #int32 from #( #'int32' #'const char*' #'uint32' #'uint32' #'int32' )"

	^Functionfchownat callWith: { __fd. __file. __owner. __group. __flag }

]

{ #category : 'Functions' }
_libcUnistd >> fdatasync_: __fildes [ 
	"/usr/include/unistd.h line 1115
extern int fdatasync (int __fildes);"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionfdatasync callWith: { __fildes }

]

{ #category : 'Functions' }
_libcUnistd >> fexecve_: __fd _: __argv _: __envp [ 
	"/usr/include/unistd.h line 557
extern int fexecve (int __fd, char *const __argv[], char *const __envp[])     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2)            ))                           ;"

	"Interpreted as #int32 from #( #'int32' #'ptr' #'ptr' )"

	^Functionfexecve callWith: { __fd. __argv. __envp }

]

{ #category : 'Functions' }
_libcUnistd >> fork [
	"/usr/include/unistd.h line 756
extern __pid_t fork (void)                           __attribute__ ((__nothrow__))                                   ;"

	"Interpreted as #int32 from #( )"

	^Functionfork callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> fpathconf_: __fd _: __name [ 
	"/usr/include/unistd.h line 616
extern long int fpathconf (int __fd, int __name)                                                 __attribute__ ((__nothrow__ , __leaf__))                                                       ;"

	"Interpreted as #int64 from #( #'int32' #'int32' )"

	^Functionfpathconf callWith: { __fd. __name }

]

{ #category : 'Functions' }
_libcUnistd >> fsync_: __fd [ 
	"/usr/include/unistd.h line 954
extern int fsync (int __fd);"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionfsync callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> ftruncate_: __fd _: __length [ 
	"/usr/include/unistd.h line 1014
extern int ftruncate (int __fd, __off_t __length)                                                  __attribute__ ((__nothrow__ , __leaf__))                                                               ;"

	"Interpreted as #int32 from #( #'int32' #'int64' )"

	^Functionftruncate callWith: { __fd. __length }

]

{ #category : 'Functions' }
_libcUnistd >> get_current_dir_name [
	"/usr/include/unistd.h line
	extern char *get_current_dir_name (void)"

	^Functionget_current_dir_name callWith: {}
]

{ #category : 'Functions' }
_libcUnistd >> getcwd_: __buf _: __size [ 
	"/usr/include/unistd.h line 511
extern char *getcwd (char *__buf, size_t __size)                                                 __attribute__ ((__nothrow__ , __leaf__))                                                              ;"

	"Interpreted as #char* from #( #'ptr' #'uint64' )"

	^Functiongetcwd callWith: { __buf. __size }

]

{ #category : 'Functions' }
_libcUnistd >> getdomainname_: __name _: __len [ 
	"/usr/include/unistd.h line 895
extern int getdomainname (char *__name, size_t __len)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetdomainname callWith: { __name. __len }

]

{ #category : 'Functions' }
_libcUnistd >> getdtablesize [
	"/usr/include/unistd.h line 981
extern int getdtablesize (void)                                __attribute__ ((__nothrow__ , __leaf__))                                      ;"

	"Interpreted as #int32 from #( )"

	^Functiongetdtablesize callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getegid [
	"/usr/include/unistd.h line 684
extern __gid_t getegid (void)                              __attribute__ ((__nothrow__ , __leaf__))                                    ;"

	"Interpreted as #uint32 from #( )"

	^Functiongetegid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getentropy_: __buffer _: __length [ 
	"/usr/include/unistd.h line 1161
int getentropy (void *__buffer, size_t __length) ;"

	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetentropy callWith: { __buffer. __length }

]

{ #category : 'Functions' }
_libcUnistd >> geteuid [
	"/usr/include/unistd.h line 678
extern __uid_t geteuid (void)                              __attribute__ ((__nothrow__ , __leaf__))                                    ;"

	"Interpreted as #uint32 from #( )"

	^Functiongeteuid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getgid [
	"/usr/include/unistd.h line 681
extern __gid_t getgid (void)                             __attribute__ ((__nothrow__ , __leaf__))                                   ;"

	"Interpreted as #uint32 from #( )"

	^Functiongetgid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getgroups_: __size _: __list [ 
	"/usr/include/unistd.h line 689
extern int getgroups (int __size, __gid_t __list[])                                                    __attribute__ ((__nothrow__ , __leaf__))                                                                 ;"

	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functiongetgroups callWith: { __size. __list }

]

{ #category : 'Functions' }
_libcUnistd >> gethostid [
	"/usr/include/unistd.h line 967
extern long int gethostid (void);"

	"Interpreted as #int64 from #( )"

	^Functiongethostid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> gethostname_: __name _: __len [ 
	"/usr/include/unistd.h line 877
extern int gethostname (char *__name, size_t __len)                                                    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                                            (1)                                                           ))                                                                          ;"

	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongethostname callWith: { __name. __len }

]

{ #category : 'Functions' }
_libcUnistd >> getlogin [
	"/usr/include/unistd.h line 848
extern char *getlogin (void);"

	"Interpreted as #char* from #( )"

	^Functiongetlogin callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getlogin_r_: __name _: __name_len [ 
	"/usr/include/unistd.h line 856
extern int getlogin_r (char *__name, size_t __name_len)                                                        __attribute__ ((__nonnull__                                                        (1)                                                       ))                                                                      ;"

	"Interpreted as #int32 from #( #'ptr' #'uint64' )"

	^Functiongetlogin_r callWith: { __name. __name_len }

]

{ #category : 'Functions' }
_libcUnistd >> getopt_: ___argc _: ___argv _: __shortopts [ 
	"/usr/include/bits/getopt_core.h line 91
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));"

	"Interpreted as #int32 from #( #'int32' #'ptr' #'const char*' )"

	^Functiongetopt callWith: { ___argc. ___argv. __shortopts }

]

{ #category : 'Functions' }
_libcUnistd >> getpagesize [
	"/usr/include/unistd.h line 976
extern int getpagesize (void)                               __attribute__ ((__nothrow__ , __leaf__))                                       __attribute__ ((__const__));"

	"Interpreted as #int32 from #( )"

	^Functiongetpagesize callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getpass_: __prompt [ 
	"/usr/include/unistd.h line 946
extern char *getpass (const char *__prompt)                                            __attribute__ ((__nonnull__                                            (1)                                           ))                                                          ;"

	"Interpreted as #char* from #( #'const char*' )"

	^Functiongetpass callWith: { __prompt }

]

{ #category : 'Functions' }
_libcUnistd >> getpgid_: __pid [ 
	"/usr/include/unistd.h line 639
extern __pid_t getpgid (__pid_t __pid)                                       __attribute__ ((__nothrow__ , __leaf__))                                             ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functiongetpgid callWith: { __pid }

]

{ #category : 'Functions' }
_libcUnistd >> getpgrp [
	"/usr/include/unistd.h line 634
extern __pid_t getpgrp (void)                              __attribute__ ((__nothrow__ , __leaf__))                                    ;"

	"Interpreted as #int32 from #( )"

	^Functiongetpgrp callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getpid [
	"/usr/include/unistd.h line 628
extern __pid_t getpid (void)                             __attribute__ ((__nothrow__ , __leaf__))                                   ;"

	"Interpreted as #int32 from #( )"

	^Functiongetpid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getppid [
	"/usr/include/unistd.h line 631
extern __pid_t getppid (void)                              __attribute__ ((__nothrow__ , __leaf__))                                    ;"

	"Interpreted as #int32 from #( )"

	^Functiongetppid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getsid_: __pid [ 
	"/usr/include/unistd.h line 671
extern __pid_t getsid (__pid_t __pid)                                      __attribute__ ((__nothrow__ , __leaf__))                                            ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functiongetsid callWith: { __pid }

]

{ #category : 'Functions' }
_libcUnistd >> getuid [
	"/usr/include/unistd.h line 675
extern __uid_t getuid (void)                             __attribute__ ((__nothrow__ , __leaf__))                                   ;"

	"Interpreted as #uint32 from #( )"

	^Functiongetuid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getusershell [
	"/usr/include/unistd.h line 927
extern char *getusershell (void)                                 __attribute__ ((__nothrow__ , __leaf__))                                       ;"

	"Interpreted as #char* from #( )"

	^Functiongetusershell callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> getwd_: __buf [ 
	"/usr/include/unistd.h line 525
extern char *getwd (char *__buf)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            )) __attribute__ ((__deprecated__))                                                           ;"

	"Interpreted as #char* from #( #'ptr' )"

	^Functiongetwd callWith: { __buf }

]

{ #category : 'Functions' }
_libcUnistd >> isatty_: __fd [ 
	"/usr/include/unistd.h line 779
extern int isatty (int __fd)                             __attribute__ ((__nothrow__ , __leaf__))                                   ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionisatty callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> lchown_: __file _: __owner _: __group [ 
	"/usr/include/unistd.h line 483
extern int lchown (const char *__file, __uid_t __owner, __gid_t __group)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'const char*' #'uint32' #'uint32' )"

	^Functionlchown callWith: { __file. __owner. __group }

]

{ #category : 'Functions' }
_libcUnistd >> link_: __from _: __to [ 
	"/usr/include/unistd.h line 789
extern int link (const char *__from, const char *__to)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                                     ;"

	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionlink callWith: { __from. __to }

]

{ #category : 'Functions' }
_libcUnistd >> linkat_: __fromfd _: __from _: __tofd _: __to _: __flags [ 
	"/usr/include/unistd.h line 795
extern int linkat (int __fromfd, const char *__from, int __tofd,     const char *__to, int __flags)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2, 4)            ))                                     ;"

	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' #'const char*' #'int32' )"

	^Functionlinkat callWith: { __fromfd. __from. __tofd. __to. __flags }

]

{ #category : 'Functions' }
_libcUnistd >> lockf_: __fd _: __cmd _: __len [ 
	"/usr/include/unistd.h line 1079
extern int lockf (int __fd, int __cmd, __off_t __len) ;"

	"Interpreted as #int32 from #( #'int32' #'int32' #'int64' )"

	^Functionlockf callWith: { __fd. __cmd. __len }

]

{ #category : 'Functions' }
_libcUnistd >> lseek_: __fd _: __offset _: __whence [ 
	"/usr/include/unistd.h line 334
extern __off_t lseek (int __fd, __off_t __offset, int __whence)                                                                __attribute__ ((__nothrow__ , __leaf__))                                                                      ;"

	"Interpreted as #int64 from #( #'int32' #'int64' #'int32' )"

	^Functionlseek callWith: { __fd. __offset. __whence }

]

{ #category : 'Functions' }
_libcUnistd >> nice_: __inc [ 
	"/usr/include/unistd.h line 598
extern int nice (int __inc)                            __attribute__ ((__nothrow__ , __leaf__))                                         ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functionnice callWith: { __inc }

]

{ #category : 'Functions' }
_libcUnistd >> pathconf_: __path _: __name [ 
	"/usr/include/unistd.h line 612
extern long int pathconf (const char *__path, int __name)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                           ;"

	"Interpreted as #int64 from #( #'const char*' #'int32' )"

	^Functionpathconf callWith: { __path. __name }

]

{ #category : 'Functions' }
_libcUnistd >> pause [
	"/usr/include/unistd.h line 469
extern int pause (void);"

	"Interpreted as #int32 from #( )"

	^Functionpause callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> pipe_: __pipedes [ 
	"/usr/include/unistd.h line 417
extern int pipe (int __pipedes[2])                                   __attribute__ ((__nothrow__ , __leaf__))                                                ;"

	"Interpreted as #int32 from #( #'ptr' )"

	^Functionpipe callWith: { __pipedes }

]

{ #category : 'Functions' }
_libcUnistd >> pread_: __fd _: __buf _: __nbytes _: __offset [ 
	"/usr/include/unistd.h line 376
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,        __off_t __offset) ;"

	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'int64' )"

	^Functionpread callWith: { __fd. __buf. __nbytes. __offset }

]

{ #category : 'Functions' }
_libcUnistd >> profil_: __sample_buffer _: __size _: __offset _: __scale [ 
	"/usr/include/unistd.h line 915
extern int profil (unsigned short int *__sample_buffer, size_t __size,     size_t __offset, unsigned int __scale)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                           ;"

	"Interpreted as #int32 from #( #'ptr' #'uint64' #'uint64' #'uint32' )"

	^Functionprofil callWith: { __sample_buffer. __size. __offset. __scale }

]

{ #category : 'Functions' }
_libcUnistd >> pwrite_: __fd _: __buf _: __n _: __offset [ 
	"/usr/include/unistd.h line 384
extern ssize_t pwrite (int __fd, const void *__buf, size_t __n,         __off_t __offset) ;"

	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' #'int64' )"

	^Functionpwrite callWith: { __fd. __buf. __n. __offset }

]

{ #category : 'Functions' }
_libcUnistd >> read_: __fd _: __buf _: __nbytes [ 
	"/usr/include/unistd.h line 360
extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;"

	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionread callWith: { __fd. __buf. __nbytes }

]

{ #category : 'Functions' }
_libcUnistd >> readlink_: __path _: __buf _: __len [ 
	"/usr/include/unistd.h line 808
extern ssize_t readlink (const char *__restrict __path,    char *__restrict __buf, size_t __len)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                                     ;"

	"Interpreted as #int64 from #( #'const char*' #'ptr' #'uint64' )"

	^Functionreadlink callWith: { __path. __buf. __len }

]

{ #category : 'Functions' }
_libcUnistd >> readlinkat_: __fd _: __path _: __buf _: __len [ 
	"/usr/include/unistd.h line 819
extern ssize_t readlinkat (int __fd, const char *__restrict __path,      char *__restrict __buf, size_t __len)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2, 3)            ))                                     ;"

	"Interpreted as #int64 from #( #'int32' #'const char*' #'ptr' #'uint64' )"

	^Functionreadlinkat callWith: { __fd. __path. __buf. __len }

]

{ #category : 'Functions' }
_libcUnistd >> revoke_: __file [ 
	"/usr/include/unistd.h line 907
extern int revoke (const char *__file)                                       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                               (1)                                              ))                                                                    ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionrevoke callWith: { __file }

]

{ #category : 'Functions' }
_libcUnistd >> rmdir_: __path [ 
	"/usr/include/unistd.h line 834
extern int rmdir (const char *__path)                                      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                              (1)                                             ))                                                            ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionrmdir callWith: { __path }

]

{ #category : 'Functions' }
_libcUnistd >> sbrk_: __delta [ 
	"/usr/include/unistd.h line 1041
extern void *sbrk (intptr_t __delta)                                     __attribute__ ((__nothrow__ , __leaf__))                                           ;"

	"Interpreted as #ptr from #( #'int64' )"

	^Functionsbrk callWith: { __delta }

]

{ #category : 'Functions' }
_libcUnistd >> setdomainname_: __name _: __len [ 
	"/usr/include/unistd.h line 897
extern int setdomainname (const char *__name, size_t __len)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'const char*' #'uint64' )"

	^Functionsetdomainname callWith: { __name. __len }

]

{ #category : 'Functions' }
_libcUnistd >> setegid_: __gid [ 
	"/usr/include/unistd.h line 727
extern int setegid (__gid_t __gid)                                   __attribute__ ((__nothrow__ , __leaf__))                                                ;"

	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetegid callWith: { __gid }

]

{ #category : 'Functions' }
_libcUnistd >> seteuid_: __uid [ 
	"/usr/include/unistd.h line 710
extern int seteuid (__uid_t __uid)                                   __attribute__ ((__nothrow__ , __leaf__))                                                ;"

	"Interpreted as #int32 from #( #'uint32' )"

	^Functionseteuid callWith: { __uid }

]

{ #category : 'Functions' }
_libcUnistd >> setgid_: __gid [ 
	"/usr/include/unistd.h line 717
extern int setgid (__gid_t __gid)                                  __attribute__ ((__nothrow__ , __leaf__))                                               ;"

	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetgid callWith: { __gid }

]

{ #category : 'Functions' }
_libcUnistd >> sethostid_: __id [ 
	"/usr/include/unistd.h line 889
extern int sethostid (long int __id)                                     __attribute__ ((__nothrow__ , __leaf__))                                                  ;"

	"Interpreted as #int32 from #( #'int64' )"

	^Functionsethostid callWith: { __id }

]

{ #category : 'Functions' }
_libcUnistd >> sethostname_: __name _: __len [ 
	"/usr/include/unistd.h line 884
extern int sethostname (const char *__name, size_t __len)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'const char*' #'uint64' )"

	^Functionsethostname callWith: { __name. __len }

]

{ #category : 'Functions' }
_libcUnistd >> setlogin_: __name [ 
	"/usr/include/unistd.h line 861
extern int setlogin (const char *__name)                                         __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                                 (1)                                                ))                                                               ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionsetlogin callWith: { __name }

]

{ #category : 'Functions' }
_libcUnistd >> setpgid_: __pid _: __pgid [ 
	"/usr/include/unistd.h line 646
extern int setpgid (__pid_t __pid, __pid_t __pgid)                                                   __attribute__ ((__nothrow__ , __leaf__))                                                         ;"

	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functionsetpgid callWith: { __pid. __pgid }

]

{ #category : 'Functions' }
_libcUnistd >> setpgrp [
	"/usr/include/unistd.h line 660
extern int setpgrp (void)                          __attribute__ ((__nothrow__ , __leaf__))                                ;"

	"Interpreted as #int32 from #( )"

	^Functionsetpgrp callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> setregid_: __rgid _: __egid [ 
	"/usr/include/unistd.h line 722
extern int setregid (__gid_t __rgid, __gid_t __egid)                                                     __attribute__ ((__nothrow__ , __leaf__))                                                                  ;"

	"Interpreted as #int32 from #( #'uint32' #'uint32' )"

	^Functionsetregid callWith: { __rgid. __egid }

]

{ #category : 'Functions' }
_libcUnistd >> setreuid_: __ruid _: __euid [ 
	"/usr/include/unistd.h line 705
extern int setreuid (__uid_t __ruid, __uid_t __euid)                                                     __attribute__ ((__nothrow__ , __leaf__))                                                                  ;"

	"Interpreted as #int32 from #( #'uint32' #'uint32' )"

	^Functionsetreuid callWith: { __ruid. __euid }

]

{ #category : 'Functions' }
_libcUnistd >> setsid [
	"/usr/include/unistd.h line 667
extern __pid_t setsid (void)                             __attribute__ ((__nothrow__ , __leaf__))                                   ;"

	"Interpreted as #int32 from #( )"

	^Functionsetsid callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> setuid_: __uid [ 
	"/usr/include/unistd.h line 700
extern int setuid (__uid_t __uid)                                  __attribute__ ((__nothrow__ , __leaf__))                                               ;"

	"Interpreted as #int32 from #( #'uint32' )"

	^Functionsetuid callWith: { __uid }

]

{ #category : 'Functions' }
_libcUnistd >> setusershell [
	"/usr/include/unistd.h line 929
extern void setusershell (void)                                __attribute__ ((__nothrow__ , __leaf__))                                      ;"

	"Interpreted as #void from #( )"

	^Functionsetusershell callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> sleep_: __seconds [ 
	"/usr/include/unistd.h line 444
extern unsigned int sleep (unsigned int __seconds);"

	"Interpreted as #uint32 from #( #'uint32' )"

	^Functionsleep callWith: { __seconds }

]

{ #category : 'Functions' }
_libcUnistd >> symlink_: __from _: __to [ 
	"/usr/include/unistd.h line 802
extern int symlink (const char *__from, const char *__to)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1, 2)            ))                                     ;"

	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionsymlink callWith: { __from. __to }

]

{ #category : 'Functions' }
_libcUnistd >> symlinkat_: __from _: __tofd _: __to [ 
	"/usr/include/unistd.h line 815
extern int symlinkat (const char *__from, int __tofd,        const char *__to)                          __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                  (1, 3)                                 ))                                                          ;"

	"Interpreted as #int32 from #( #'const char*' #'int32' #'const char*' )"

	^Functionsymlinkat callWith: { __from. __tofd. __to }

]

{ #category : 'Functions' }
_libcUnistd >> sync [
	"/usr/include/unistd.h line 970
extern void sync (void)                        __attribute__ ((__nothrow__ , __leaf__))                              ;"

	"Interpreted as #void from #( )"

	^Functionsync callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> syscall_: __sysno [ 
	"/usr/include/unistd.h line 1056
extern long int syscall (long int __sysno, ...)                                                __attribute__ ((__nothrow__ , __leaf__))                                                      ;"

	"Interpreted as #int64 from #( #'int64' )"

	^Functionsyscall callWith: { __sysno"varArgs array should be appended to this array" }

]

{ #category : 'Functions' }
_libcUnistd >> sysconf_: __name [ 
	"/usr/include/unistd.h line 619
extern long int sysconf (int __name)                                     __attribute__ ((__nothrow__ , __leaf__))                                           ;"

	"Interpreted as #int64 from #( #'int32' )"

	^Functionsysconf callWith: { __name }

]

{ #category : 'Functions' }
_libcUnistd >> tcgetpgrp_: __fd [ 
	"/usr/include/unistd.h line 838
extern __pid_t tcgetpgrp (int __fd)                                    __attribute__ ((__nothrow__ , __leaf__))                                          ;"

	"Interpreted as #int32 from #( #'int32' )"

	^Functiontcgetpgrp callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> tcsetpgrp_: __fd _: __pgrp_id [ 
	"/usr/include/unistd.h line 841
extern int tcsetpgrp (int __fd, __pid_t __pgrp_id)                                                   __attribute__ ((__nothrow__ , __leaf__))                                                         ;"

	"Interpreted as #int32 from #( #'int32' #'int32' )"

	^Functiontcsetpgrp callWith: { __fd. __pgrp_id }

]

{ #category : 'Functions' }
_libcUnistd >> truncate_: __file _: __length [ 
	"/usr/include/unistd.h line 991
extern int truncate (const char *__file, __off_t __length)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (1)            ))                                  ;"

	"Interpreted as #int32 from #( #'const char*' #'int64' )"

	^Functiontruncate callWith: { __file. __length }

]

{ #category : 'Functions' }
_libcUnistd >> ttyname_: __fd [ 
	"/usr/include/unistd.h line 770
extern char *ttyname (int __fd)                                __attribute__ ((__nothrow__ , __leaf__))                                      ;"

	"Interpreted as #char* from #( #'int32' )"

	^Functionttyname callWith: { __fd }

]

{ #category : 'Functions' }
_libcUnistd >> ttyname_r_: __fd _: __buf _: __buflen [ 
	"/usr/include/unistd.h line 774
extern int ttyname_r (int __fd, char *__buf, size_t __buflen)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2)            ))                                  ;"

	"Interpreted as #int32 from #( #'int32' #'ptr' #'uint64' )"

	^Functionttyname_r callWith: { __fd. __buf. __buflen }


]

{ #category : 'Functions' }
_libcUnistd >> ttyslot [
	"/usr/include/unistd.h line 784
extern int ttyslot (void)                          __attribute__ ((__nothrow__ , __leaf__))                                ;"

	"Interpreted as #int32 from #( )"

	^Functionttyslot callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> ualarm_: __value _: __interval [ 
	"/usr/include/unistd.h line 452
extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)     
    __attribute__ ((__nothrow__ , __leaf__))           ;"

	"Interpreted as #uint32 from #( #'uint32' #'uint32' )"

	^Functionualarm callWith: { __value. __interval }

]

{ #category : 'Functions' }
_libcUnistd >> unlink_: __name [ 
	"/usr/include/unistd.h line 825
extern int unlink (const char *__name)                                       __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__                                               (1)                                              ))                                                             ;"

	"Interpreted as #int32 from #( #'const char*' )"

	^Functionunlink callWith: { __name }

]

{ #category : 'Functions' }
_libcUnistd >> unlinkat_: __fd _: __name _: __flag [ 
	"/usr/include/unistd.h line 829
extern int unlinkat (int __fd, const char *__name, int __flag)     
    __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__             (2)            ))                           ;"

	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' )"

	^Functionunlinkat callWith: { __fd. __name. __flag }

]

{ #category : 'Functions' }
_libcUnistd >> usleep_: __useconds [ 
	"/usr/include/unistd.h line 460
extern int usleep (__useconds_t __useconds);"

	"Interpreted as #int32 from #( #'uint32' )"

	^Functionusleep callWith: { __useconds }

]

{ #category : 'Functions' }
_libcUnistd >> vfork [
	"/usr/include/unistd.h line 764
extern __pid_t vfork (void)                            __attribute__ ((__nothrow__ , __leaf__))                                  ;"

	"Interpreted as #int32 from #( )"

	^Functionvfork callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> vhangup [
	"/usr/include/unistd.h line 904
extern int vhangup (void)                          __attribute__ ((__nothrow__ , __leaf__))                                ;"

	"Interpreted as #int32 from #( )"

	^Functionvhangup callWith: {  }

]

{ #category : 'Functions' }
_libcUnistd >> write_: __fd _: __buf _: __n [ 
	"/usr/include/unistd.h line 366
extern ssize_t write (int __fd, const void *__buf, size_t __n) ;"

	"Interpreted as #int64 from #( #'int32' #'ptr' #'uint64' )"

	^Functionwrite callWith: { __fd. __buf. __n }

]
