Class {
	#name : '_libc_stdio_Linux',
	#superclass : '_libc_stdio',
	#instVars : [
		'Function_clearerr',
		'Function_clearerr_unlocked',
		'Function_ctermid',
		'Function_dprintf',
		'Function_fclose',
		'Function_fdopen',
		'Function_feof',
		'Function_feof_unlocked',
		'Function_ferror',
		'Function_ferror_unlocked',
		'Function_fflush',
		'Function_fflush_unlocked',
		'Function_fgetc',
		'Function_fgetc_unlocked',
		'Function_fgetpos',
		'Function_fgets',
		'Function_fileno',
		'Function_fileno_unlocked',
		'Function_flockfile',
		'Function_fmemopen',
		'Function_fopen',
		'Function_fprintf',
		'Function_fputc',
		'Function_fputc_unlocked',
		'Function_fputs',
		'Function_fread',
		'Function_fread_unlocked',
		'Function_freopen',
		'Function_fscanf',
		'Function_fseek',
		'Function_fseeko',
		'Function_fsetpos',
		'Function_ftell',
		'Function_ftello',
		'Function_ftrylockfile',
		'Function_funlockfile',
		'Function_fwrite',
		'Function_fwrite_unlocked',
		'Function_getc',
		'Function_getchar',
		'Function_getchar_unlocked',
		'Function_getc_unlocked',
		'Function_getdelim',
		'Function_getline',
		'Function_getw',
		'Function_open_memstream',
		'Function_pclose',
		'Function_perror',
		'Function_popen',
		'Function_printf',
		'Function_putc',
		'Function_putchar',
		'Function_putchar_unlocked',
		'Function_putc_unlocked',
		'Function_puts',
		'Function_putw',
		'Function_remove',
		'Function_rename',
		'Function_renameat',
		'Function_rewind',
		'Function_scanf',
		'Function_setbuf',
		'Function_setbuffer',
		'Function_setlinebuf',
		'Function_setvbuf',
		'Function_snprintf',
		'Function_sprintf',
		'Function_sscanf',
		'Function_tempnam',
		'Function_tmpfile',
		'Function_tmpnam',
		'Function_tmpnam_r',
		'Function_ungetc',
		'Function_vdprintf',
		'Function_vfprintf',
		'Function_vfscanf',
		'Function_vprintf',
		'Function_vscanf',
		'Function_vsnprintf',
		'Function_vsprintf',
		'Function_vsscanf',
		'Function___getdelim',
		'Function___overflow',
		'Function___uflow'
	],
	#category : 'LibC'
}

{ #category : 'Functions' }
_libc_stdio_Linux >> __getdelim: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr' #'ptr' #'int32' #'ptr')"

	^Function___getdelim
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> __overflow: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32')"

	^Function___overflow
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> __uflow: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function___uflow
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> clearerr_unlocked: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_clearerr_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> clearerr: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_clearerr
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ctermid: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_ctermid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> dprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*')"

	^Function_dprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fclose: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fdopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'int32' #'const char*')"

	^Function_fdopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> feof_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_feof_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> feof: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_feof
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ferror_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_ferror_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ferror: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_ferror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fflush_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fflush_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fflush: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fflush
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fgetc_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fgetc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fgetc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fgetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fgetpos: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr')"

	^Function_fgetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fgets: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr' #'int32' #'ptr')"

	^Function_fgets
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fileno_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fileno_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fileno: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fileno
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> flockfile: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_flockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fmemopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'ptr' #'uint64' #'const char*')"

	^Function_fmemopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*' #'const char*')"

	^Function_fopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_fprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fputc_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fputc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fputc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fputc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fputs: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_fputs
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fread_unlocked: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fread_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fread: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> freopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*' #'const char*' #'ptr')"

	^Function_freopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_fscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fseek: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int64' #'int32')"

	^Function_fseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fseeko: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int64' #'int32')"

	^Function_fseeko
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fsetpos: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr')"

	^Function_fsetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ftell: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr')"

	^Function_ftell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ftello: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr')"

	^Function_ftello
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ftrylockfile: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_ftrylockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> funlockfile: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_funlockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fwrite_unlocked: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fwrite_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> fwrite: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fwrite
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getc_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_getc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_getc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getchar_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getchar_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getchar: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getdelim: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr' #'ptr' #'int32' #'ptr')"

	^Function_getdelim
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getline: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr' #'ptr' #'ptr')"

	^Function_getline
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> getw: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_getw
		callWith: args
		errno: errnoHolder
]

{ #category : 'initialization' }
_libc_stdio_Linux >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: 'libc.so.6'.
	Function_clearerr := CCallout
		library: cLibrary
		name: 'clearerr'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_clearerr_unlocked := CCallout
		library: cLibrary
		name: 'clearerr_unlocked'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ctermid := CCallout
		library: cLibrary
		name: 'ctermid'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_dprintf := CCallout
		library: cLibrary
		name: 'dprintf'
		result: #'int32'
		args: #(#'int32' #'const char*')
		varArgsAfter: 2.
	Function_fclose := CCallout
		library: cLibrary
		name: 'fclose'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fdopen := CCallout
		library: cLibrary
		name: 'fdopen'
		result: #'ptr'
		args: #(#'int32' #'const char*')
		varArgsAfter: -1.
	Function_feof := CCallout
		library: cLibrary
		name: 'feof'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_feof_unlocked := CCallout
		library: cLibrary
		name: 'feof_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ferror := CCallout
		library: cLibrary
		name: 'ferror'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ferror_unlocked := CCallout
		library: cLibrary
		name: 'ferror_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fflush := CCallout
		library: cLibrary
		name: 'fflush'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fflush_unlocked := CCallout
		library: cLibrary
		name: 'fflush_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fgetc := CCallout
		library: cLibrary
		name: 'fgetc'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fgetc_unlocked := CCallout
		library: cLibrary
		name: 'fgetc_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fgetpos := CCallout
		library: cLibrary
		name: 'fgetpos'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.
	Function_fgets := CCallout
		library: cLibrary
		name: 'fgets'
		result: #'char*'
		args: #(#'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_fileno := CCallout
		library: cLibrary
		name: 'fileno'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fileno_unlocked := CCallout
		library: cLibrary
		name: 'fileno_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_flockfile := CCallout
		library: cLibrary
		name: 'flockfile'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fmemopen := CCallout
		library: cLibrary
		name: 'fmemopen'
		result: #'ptr'
		args: #(#'ptr' #'uint64' #'const char*')
		varArgsAfter: -1.
	Function_fopen := CCallout
		library: cLibrary
		name: 'fopen'
		result: #'ptr'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_fprintf := CCallout
		library: cLibrary
		name: 'fprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.
	Function_fputc := CCallout
		library: cLibrary
		name: 'fputc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fputc_unlocked := CCallout
		library: cLibrary
		name: 'fputc_unlocked'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_fputs := CCallout
		library: cLibrary
		name: 'fputs'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_fread := CCallout
		library: cLibrary
		name: 'fread'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.
	Function_fread_unlocked := CCallout
		library: cLibrary
		name: 'fread_unlocked'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.
	Function_freopen := CCallout
		library: cLibrary
		name: 'freopen'
		result: #'ptr'
		args: #(#'const char*' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_fscanf := CCallout
		library: cLibrary
		name: 'fscanf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.
	Function_fseek := CCallout
		library: cLibrary
		name: 'fseek'
		result: #'int32'
		args: #(#'ptr' #'int64' #'int32')
		varArgsAfter: -1.
	Function_fseeko := CCallout
		library: cLibrary
		name: 'fseeko'
		result: #'int32'
		args: #(#'ptr' #'int64' #'int32')
		varArgsAfter: -1.
	Function_fsetpos := CCallout
		library: cLibrary
		name: 'fsetpos'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.
	Function_ftell := CCallout
		library: cLibrary
		name: 'ftell'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ftello := CCallout
		library: cLibrary
		name: 'ftello'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ftrylockfile := CCallout
		library: cLibrary
		name: 'ftrylockfile'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_funlockfile := CCallout
		library: cLibrary
		name: 'funlockfile'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fwrite := CCallout
		library: cLibrary
		name: 'fwrite'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.
	Function_fwrite_unlocked := CCallout
		library: cLibrary
		name: 'fwrite_unlocked'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.
	Function_getc := CCallout
		library: cLibrary
		name: 'getc'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_getchar := CCallout
		library: cLibrary
		name: 'getchar'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getchar_unlocked := CCallout
		library: cLibrary
		name: 'getchar_unlocked'
		result: #'int32'
		args: #()
		varArgsAfter: -1.
	Function_getc_unlocked := CCallout
		library: cLibrary
		name: 'getc_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_getdelim := CCallout
		library: cLibrary
		name: 'getdelim'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function_getline := CCallout
		library: cLibrary
		name: 'getline'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.
	Function_getw := CCallout
		library: cLibrary
		name: 'getw'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_open_memstream := CCallout
		library: cLibrary
		name: 'open_memstream'
		result: #'ptr'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.
	Function_pclose := CCallout
		library: cLibrary
		name: 'pclose'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_perror := CCallout
		library: cLibrary
		name: 'perror'
		result: #'void'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_popen := CCallout
		library: cLibrary
		name: 'popen'
		result: #'ptr'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_printf := CCallout
		library: cLibrary
		name: 'printf'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: 1.
	Function_putc := CCallout
		library: cLibrary
		name: 'putc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_putchar := CCallout
		library: cLibrary
		name: 'putchar'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_putchar_unlocked := CCallout
		library: cLibrary
		name: 'putchar_unlocked'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.
	Function_putc_unlocked := CCallout
		library: cLibrary
		name: 'putc_unlocked'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_puts := CCallout
		library: cLibrary
		name: 'puts'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_putw := CCallout
		library: cLibrary
		name: 'putw'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_remove := CCallout
		library: cLibrary
		name: 'remove'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.
	Function_rename := CCallout
		library: cLibrary
		name: 'rename'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_renameat := CCallout
		library: cLibrary
		name: 'renameat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'const char*')
		varArgsAfter: -1.
	Function_rewind := CCallout
		library: cLibrary
		name: 'rewind'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_scanf := CCallout
		library: cLibrary
		name: 'scanf'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: 1.
	Function_setbuf := CCallout
		library: cLibrary
		name: 'setbuf'
		result: #'void'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.
	Function_setbuffer := CCallout
		library: cLibrary
		name: 'setbuffer'
		result: #'void'
		args: #(#'ptr' #'ptr' #'uint64')
		varArgsAfter: -1.
	Function_setlinebuf := CCallout
		library: cLibrary
		name: 'setlinebuf'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_setvbuf := CCallout
		library: cLibrary
		name: 'setvbuf'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'int32' #'uint64')
		varArgsAfter: -1.
	Function_snprintf := CCallout
		library: cLibrary
		name: 'snprintf'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'const char*')
		varArgsAfter: 3.
	Function_sprintf := CCallout
		library: cLibrary
		name: 'sprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.
	Function_sscanf := CCallout
		library: cLibrary
		name: 'sscanf'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.
	Function_tempnam := CCallout
		library: cLibrary
		name: 'tempnam'
		result: #'char*'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.
	Function_tmpfile := CCallout
		library: cLibrary
		name: 'tmpfile'
		result: #'ptr'
		args: #()
		varArgsAfter: -1.
	Function_tmpnam := CCallout
		library: cLibrary
		name: 'tmpnam'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_tmpnam_r := CCallout
		library: cLibrary
		name: 'tmpnam_r'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ungetc := CCallout
		library: cLibrary
		name: 'ungetc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_vdprintf := CCallout
		library: cLibrary
		name: 'vdprintf'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vfprintf := CCallout
		library: cLibrary
		name: 'vfprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vfscanf := CCallout
		library: cLibrary
		name: 'vfscanf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vprintf := CCallout
		library: cLibrary
		name: 'vprintf'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vscanf := CCallout
		library: cLibrary
		name: 'vscanf'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vsnprintf := CCallout
		library: cLibrary
		name: 'vsnprintf'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vsprintf := CCallout
		library: cLibrary
		name: 'vsprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vsscanf := CCallout
		library: cLibrary
		name: 'vsscanf'
		result: #'int32'
		args: #(#'const char*' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function___getdelim := CCallout
		library: cLibrary
		name: '__getdelim'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'int32' #'ptr')
		varArgsAfter: -1.
	Function___overflow := CCallout
		library: cLibrary
		name: '__overflow'
		result: #'int32'
		args: #(#'ptr' #'int32')
		varArgsAfter: -1.
	Function___uflow := CCallout
		library: cLibrary
		name: '__uflow'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
]

{ #category : 'Functions' }
_libc_stdio_Linux >> open_memstream: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'ptr' #'ptr')"

	^Function_open_memstream
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> pclose: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_pclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> perror: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'const char*')"

	^Function_perror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> popen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*' #'const char*')"

	^Function_popen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> printf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_printf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> putc_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_putc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> putc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_putc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> putchar_unlocked: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_putchar_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> putchar: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_putchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> puts: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_puts
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> putw: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_putw
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> remove: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_remove
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> rename: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_rename
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> renameat: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'int32' #'const char*')"

	^Function_renameat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> rewind: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_rewind
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> scanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_scanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> setbuf: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr' #'ptr')"

	^Function_setbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> setbuffer: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr' #'ptr' #'uint64')"

	^Function_setbuffer
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> setlinebuf: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_setlinebuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> setvbuf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr' #'int32' #'uint64')"

	^Function_setvbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> snprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64' #'const char*')"

	^Function_snprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> sprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_sprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> sscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_sscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> tempnam: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'const char*' #'const char*')"

	^Function_tempnam
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> tmpfile: args errno: errnoHolder [
	"Interpreted as #'ptr' from #()"

	^Function_tmpfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> tmpnam_r: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_tmpnam_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> tmpnam: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_tmpnam
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> ungetc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_ungetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vdprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'const char*' #'ptr')"

	^Function_vdprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vfprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*' #'ptr')"

	^Function_vfprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vfscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*' #'ptr')"

	^Function_vfscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_vprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_vscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vsnprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'uint64' #'const char*' #'ptr')"

	^Function_vsnprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vsprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*' #'ptr')"

	^Function_vsprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_Linux >> vsscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*' #'ptr')"

	^Function_vsscanf
		callWith: args
		errno: errnoHolder
]
