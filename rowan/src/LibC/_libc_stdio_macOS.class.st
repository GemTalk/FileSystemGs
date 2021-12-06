Class {
	#name : '_libc_stdio_macOS',
	#superclass : '_libc_stdio',
	#instVars : [
		'Function_clearerr',
		'Function_fclose',
		'Function_feof',
		'Function_ferror',
		'Function_fflush',
		'Function_fgetc',
		'Function_fgetpos',
		'Function_fgets',
		'Function_fopen',
		'Function_fprintf',
		'Function_fputc',
		'Function_fputs',
		'Function_fread',
		'Function_freopen',
		'Function_fscanf',
		'Function_fseek',
		'Function_fsetpos',
		'Function_ftell',
		'Function_fwrite',
		'Function_getc',
		'Function_getchar',
		'Function_gets',
		'Function_perror',
		'Function_printf',
		'Function_putc',
		'Function_putchar',
		'Function_puts',
		'Function_remove',
		'Function_rename',
		'Function_rewind',
		'Function_scanf',
		'Function_setbuf',
		'Function_setvbuf',
		'Function_sprintf',
		'Function_sscanf',
		'Function_tmpfile',
		'Function_tmpnam',
		'Function_ungetc',
		'Function_vfprintf',
		'Function_vprintf',
		'Function_vsprintf',
		'Function___sprintf_chk'
	],
	#category : 'LibC'
}

{ #category : 'initialization' }
_libc_stdio_macOS >> initialize [

	| cLibrary |
	cLibrary := CLibrary named: '/usr/lib/libSystem.dylib'.
	Function_clearerr := CCallout
		library: cLibrary
		name: 'clearerr'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fclose := CCallout
		library: cLibrary
		name: 'fclose'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_feof := CCallout
		library: cLibrary
		name: 'feof'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_ferror := CCallout
		library: cLibrary
		name: 'ferror'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fflush := CCallout
		library: cLibrary
		name: 'fflush'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_fgetc := CCallout
		library: cLibrary
		name: 'fgetc'
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
	Function_fwrite := CCallout
		library: cLibrary
		name: 'fwrite'
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
	Function_gets := CCallout
		library: cLibrary
		name: 'gets'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.
	Function_perror := CCallout
		library: cLibrary
		name: 'perror'
		result: #'void'
		args: #(#'const char*')
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
	Function_puts := CCallout
		library: cLibrary
		name: 'puts'
		result: #'int32'
		args: #(#'const char*')
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
	Function_setvbuf := CCallout
		library: cLibrary
		name: 'setvbuf'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'int32' #'uint64')
		varArgsAfter: -1.
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
	Function_ungetc := CCallout
		library: cLibrary
		name: 'ungetc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.
	Function_vfprintf := CCallout
		library: cLibrary
		name: 'vfprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vprintf := CCallout
		library: cLibrary
		name: 'vprintf'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.
	Function_vsprintf := CCallout
		library: cLibrary
		name: 'vsprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.
	Function___sprintf_chk := CCallout
		library: cLibrary
		name: '__sprintf_chk'
		result: #'int32'
		args: #(#'ptr' #'int32' #'uint64' #'const char*')
		varArgsAfter: 4.
]

{ #category : 'Functions' }
_libc_stdio_macOS >> clearerr: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_clearerr
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fclose: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> feof: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_feof
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> ferror: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_ferror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fflush: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fflush
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fgetc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_fgetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fgetpos: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr')"

	^Function_fgetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fgets: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr' #'int32' #'ptr')"

	^Function_fgets
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*' #'const char*')"

	^Function_fopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_fprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fputc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_fputc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fputs: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_fputs
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fread: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> freopen: args errno: errnoHolder [
	"Interpreted as #'ptr' from #(#'const char*' #'const char*' #'ptr')"

	^Function_freopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_fscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fseek: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int64' #'int32')"

	^Function_fseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fsetpos: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr')"

	^Function_fsetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> ftell: args errno: errnoHolder [
	"Interpreted as #'int64' from #(#'ptr')"

	^Function_ftell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> fwrite: args errno: errnoHolder [
	"Interpreted as #'uint64' from #(#'ptr' #'uint64' #'uint64' #'ptr')"

	^Function_fwrite
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> getc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr')"

	^Function_getc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> getchar: args errno: errnoHolder [
	"Interpreted as #'int32' from #()"

	^Function_getchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> gets: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_gets
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> perror: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'const char*')"

	^Function_perror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> printf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_printf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> putc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_putc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> putchar: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32')"

	^Function_putchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> puts: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_puts
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> remove: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_remove
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> rename: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_rename
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> rewind: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr')"

	^Function_rewind
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> scanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*')"

	^Function_scanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> setbuf: args errno: errnoHolder [
	"Interpreted as #'void' from #(#'ptr' #'ptr')"

	^Function_setbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> setvbuf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'ptr' #'int32' #'uint64')"

	^Function_setvbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> sprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*')"

	^Function_sprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> sscanf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'const char*')"

	^Function_sscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> tmpfile: args errno: errnoHolder [
	"Interpreted as #'ptr' from #()"

	^Function_tmpfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> tmpnam: args errno: errnoHolder [
	"Interpreted as #'char*' from #(#'ptr')"

	^Function_tmpnam
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> ungetc: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'int32' #'ptr')"

	^Function_ungetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> vfprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*' #'ptr')"

	^Function_vfprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> vprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'const char*' #'ptr')"

	^Function_vprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> vsprintf: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'const char*' #'ptr')"

	^Function_vsprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libc_stdio_macOS >> __sprintf_chk: args errno: errnoHolder [
	"Interpreted as #'int32' from #(#'ptr' #'int32' #'uint64' #'const char*')"

	^Function___sprintf_chk
		callWith: args
		errno: errnoHolder
]