Class {
	#name : '_libcStdio',
	#superclass : 'Object',
	#classVars : [
		'Functionclearerr',
		'Functionclearerr_unlocked',
		'Functionctermid',
		'Functiondprintf',
		'Functionfclose',
		'Functionfdopen',
		'Functionfeof',
		'Functionfeof_unlocked',
		'Functionferror',
		'Functionferror_unlocked',
		'Functionfflush',
		'Functionfflush_unlocked',
		'Functionfgetc',
		'Functionfgetc_unlocked',
		'Functionfgetpos',
		'Functionfgets',
		'Functionfileno',
		'Functionfileno_unlocked',
		'Functionflockfile',
		'Functionfmemopen',
		'Functionfopen',
		'Functionfprintf',
		'Functionfputc',
		'Functionfputc_unlocked',
		'Functionfputs',
		'Functionfread',
		'Functionfread_unlocked',
		'Functionfreopen',
		'Functionfscanf',
		'Functionfseek',
		'Functionfseeko',
		'Functionfsetpos',
		'Functionftell',
		'Functionftello',
		'Functionftrylockfile',
		'Functionfunlockfile',
		'Functionfwrite',
		'Functionfwrite_unlocked',
		'Functiongetc',
		'Functiongetchar',
		'Functiongetchar_unlocked',
		'Functiongetc_unlocked',
		'Functiongetdelim',
		'Functiongetline',
		'Functiongetw',
		'Functionopen_memstream',
		'Functionpclose',
		'Functionperror',
		'Functionpopen',
		'Functionprintf',
		'Functionputc',
		'Functionputchar',
		'Functionputchar_unlocked',
		'Functionputc_unlocked',
		'Functionputs',
		'Functionputw',
		'Functionremove',
		'Functionrename',
		'Functionrenameat',
		'Functionrewind',
		'Functionscanf',
		'Functionsetbuf',
		'Functionsetbuffer',
		'Functionsetlinebuf',
		'Functionsetvbuf',
		'Functionsnprintf',
		'Functionsprintf',
		'Functionsscanf',
		'Functiontempnam',
		'Functiontmpfile',
		'Functiontmpnam',
		'Functiontmpnam_r',
		'Functionungetc',
		'Functionvdprintf',
		'Functionvfprintf',
		'Functionvfscanf',
		'Functionvprintf',
		'Functionvscanf',
		'Functionvsnprintf',
		'Functionvsprintf',
		'Functionvsscanf',
		'Function__getdelim',
		'Function__overflow',
		'Function__uflow'
	],
	#category : 'LibC'
}

{ #category : 'Initializing - private' }
_libcStdio class >> initialize [

  self initializeFunctions
]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction___getdelim_inLibrary: cLibrary [

	Function__getdelim := CCallout
		library: cLibrary
		name: '__getdelim'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction___overflow_inLibrary: cLibrary [

	Function__overflow := CCallout
		library: cLibrary
		name: '__overflow'
		result: #'int32'
		args: #(#'ptr' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction___uflow_inLibrary: cLibrary [

	Function__uflow := CCallout
		library: cLibrary
		name: '__uflow'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_clearerr_inLibrary: cLibrary [

	Functionclearerr := CCallout
		library: cLibrary
		name: 'clearerr'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_clearerr_unlocked_inLibrary: cLibrary [

	Functionclearerr_unlocked := CCallout
		library: cLibrary
		name: 'clearerr_unlocked'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ctermid_inLibrary: cLibrary [

	Functionctermid := CCallout
		library: cLibrary
		name: 'ctermid'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_dprintf_inLibrary: cLibrary [

	Functiondprintf := CCallout
		library: cLibrary
		name: 'dprintf'
		result: #'int32'
		args: #(#'int32' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fclose_inLibrary: cLibrary [

	Functionfclose := CCallout
		library: cLibrary
		name: 'fclose'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fdopen_inLibrary: cLibrary [

	Functionfdopen := CCallout
		library: cLibrary
		name: 'fdopen'
		result: #'ptr'
		args: #(#'int32' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_feof_inLibrary: cLibrary [

	Functionfeof := CCallout
		library: cLibrary
		name: 'feof'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_feof_unlocked_inLibrary: cLibrary [

	Functionfeof_unlocked := CCallout
		library: cLibrary
		name: 'feof_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ferror_inLibrary: cLibrary [

	Functionferror := CCallout
		library: cLibrary
		name: 'ferror'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ferror_unlocked_inLibrary: cLibrary [

	Functionferror_unlocked := CCallout
		library: cLibrary
		name: 'ferror_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fflush_inLibrary: cLibrary [

	Functionfflush := CCallout
		library: cLibrary
		name: 'fflush'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fflush_unlocked_inLibrary: cLibrary [

	Functionfflush_unlocked := CCallout
		library: cLibrary
		name: 'fflush_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fgetc_inLibrary: cLibrary [

	Functionfgetc := CCallout
		library: cLibrary
		name: 'fgetc'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fgetc_unlocked_inLibrary: cLibrary [

	Functionfgetc_unlocked := CCallout
		library: cLibrary
		name: 'fgetc_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fgetpos_inLibrary: cLibrary [

	Functionfgetpos := CCallout
		library: cLibrary
		name: 'fgetpos'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fgets_inLibrary: cLibrary [

	Functionfgets := CCallout
		library: cLibrary
		name: 'fgets'
		result: #'char*'
		args: #(#'ptr' #'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fileno_inLibrary: cLibrary [

	Functionfileno := CCallout
		library: cLibrary
		name: 'fileno'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fileno_unlocked_inLibrary: cLibrary [

	Functionfileno_unlocked := CCallout
		library: cLibrary
		name: 'fileno_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_flockfile_inLibrary: cLibrary [

	Functionflockfile := CCallout
		library: cLibrary
		name: 'flockfile'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fmemopen_inLibrary: cLibrary [

	Functionfmemopen := CCallout
		library: cLibrary
		name: 'fmemopen'
		result: #'ptr'
		args: #(#'ptr' #'uint64' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fopen_inLibrary: cLibrary [

	Functionfopen := CCallout
		library: cLibrary
		name: 'fopen'
		result: #'ptr'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fprintf_inLibrary: cLibrary [

	Functionfprintf := CCallout
		library: cLibrary
		name: 'fprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fputc_inLibrary: cLibrary [

	Functionfputc := CCallout
		library: cLibrary
		name: 'fputc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fputc_unlocked_inLibrary: cLibrary [

	Functionfputc_unlocked := CCallout
		library: cLibrary
		name: 'fputc_unlocked'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fputs_inLibrary: cLibrary [

	Functionfputs := CCallout
		library: cLibrary
		name: 'fputs'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fread_inLibrary: cLibrary [

	Functionfread := CCallout
		library: cLibrary
		name: 'fread'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fread_unlocked_inLibrary: cLibrary [

	Functionfread_unlocked := CCallout
		library: cLibrary
		name: 'fread_unlocked'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_freopen_inLibrary: cLibrary [

	Functionfreopen := CCallout
		library: cLibrary
		name: 'freopen'
		result: #'ptr'
		args: #(#'const char*' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fscanf_inLibrary: cLibrary [

	Functionfscanf := CCallout
		library: cLibrary
		name: 'fscanf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fseek_inLibrary: cLibrary [

	Functionfseek := CCallout
		library: cLibrary
		name: 'fseek'
		result: #'int32'
		args: #(#'ptr' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fseeko_inLibrary: cLibrary [

	Functionfseeko := CCallout
		library: cLibrary
		name: 'fseeko'
		result: #'int32'
		args: #(#'ptr' #'int64' #'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fsetpos_inLibrary: cLibrary [

	Functionfsetpos := CCallout
		library: cLibrary
		name: 'fsetpos'
		result: #'int32'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ftell_inLibrary: cLibrary [

	Functionftell := CCallout
		library: cLibrary
		name: 'ftell'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ftello_inLibrary: cLibrary [

	Functionftello := CCallout
		library: cLibrary
		name: 'ftello'
		result: #'int64'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ftrylockfile_inLibrary: cLibrary [

	Functionftrylockfile := CCallout
		library: cLibrary
		name: 'ftrylockfile'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_funlockfile_inLibrary: cLibrary [

	Functionfunlockfile := CCallout
		library: cLibrary
		name: 'funlockfile'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fwrite_inLibrary: cLibrary [

	Functionfwrite := CCallout
		library: cLibrary
		name: 'fwrite'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_fwrite_unlocked_inLibrary: cLibrary [

	Functionfwrite_unlocked := CCallout
		library: cLibrary
		name: 'fwrite_unlocked'
		result: #'uint64'
		args: #(#'ptr' #'uint64' #'uint64' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getc_inLibrary: cLibrary [

	Functiongetc := CCallout
		library: cLibrary
		name: 'getc'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getc_unlocked_inLibrary: cLibrary [

	Functiongetc_unlocked := CCallout
		library: cLibrary
		name: 'getc_unlocked'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getchar_inLibrary: cLibrary [

	Functiongetchar := CCallout
		library: cLibrary
		name: 'getchar'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getchar_unlocked_inLibrary: cLibrary [

	Functiongetchar_unlocked := CCallout
		library: cLibrary
		name: 'getchar_unlocked'
		result: #'int32'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getdelim_inLibrary: cLibrary [

	Functiongetdelim := CCallout
		library: cLibrary
		name: 'getdelim'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getline_inLibrary: cLibrary [

	Functiongetline := CCallout
		library: cLibrary
		name: 'getline'
		result: #'int64'
		args: #(#'ptr' #'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_getw_inLibrary: cLibrary [

	Functiongetw := CCallout
		library: cLibrary
		name: 'getw'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_open_memstream_inLibrary: cLibrary [

	Functionopen_memstream := CCallout
		library: cLibrary
		name: 'open_memstream'
		result: #'ptr'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_pclose_inLibrary: cLibrary [

	Functionpclose := CCallout
		library: cLibrary
		name: 'pclose'
		result: #'int32'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_perror_inLibrary: cLibrary [

	Functionperror := CCallout
		library: cLibrary
		name: 'perror'
		result: #'void'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_popen_inLibrary: cLibrary [

	Functionpopen := CCallout
		library: cLibrary
		name: 'popen'
		result: #'ptr'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_printf_inLibrary: cLibrary [

	Functionprintf := CCallout
		library: cLibrary
		name: 'printf'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: 1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_putc_inLibrary: cLibrary [

	Functionputc := CCallout
		library: cLibrary
		name: 'putc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_putc_unlocked_inLibrary: cLibrary [

	Functionputc_unlocked := CCallout
		library: cLibrary
		name: 'putc_unlocked'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_putchar_inLibrary: cLibrary [

	Functionputchar := CCallout
		library: cLibrary
		name: 'putchar'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_putchar_unlocked_inLibrary: cLibrary [

	Functionputchar_unlocked := CCallout
		library: cLibrary
		name: 'putchar_unlocked'
		result: #'int32'
		args: #(#'int32')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_puts_inLibrary: cLibrary [

	Functionputs := CCallout
		library: cLibrary
		name: 'puts'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_putw_inLibrary: cLibrary [

	Functionputw := CCallout
		library: cLibrary
		name: 'putw'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_remove_inLibrary: cLibrary [

	Functionremove := CCallout
		library: cLibrary
		name: 'remove'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_rename_inLibrary: cLibrary [

	Functionrename := CCallout
		library: cLibrary
		name: 'rename'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_renameat_inLibrary: cLibrary [

	Functionrenameat := CCallout
		library: cLibrary
		name: 'renameat'
		result: #'int32'
		args: #(#'int32' #'const char*' #'int32' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_rewind_inLibrary: cLibrary [

	Functionrewind := CCallout
		library: cLibrary
		name: 'rewind'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_scanf_inLibrary: cLibrary [

	Functionscanf := CCallout
		library: cLibrary
		name: 'scanf'
		result: #'int32'
		args: #(#'const char*')
		varArgsAfter: 1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_setbuf_inLibrary: cLibrary [

	Functionsetbuf := CCallout
		library: cLibrary
		name: 'setbuf'
		result: #'void'
		args: #(#'ptr' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_setbuffer_inLibrary: cLibrary [

	Functionsetbuffer := CCallout
		library: cLibrary
		name: 'setbuffer'
		result: #'void'
		args: #(#'ptr' #'ptr' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_setlinebuf_inLibrary: cLibrary [

	Functionsetlinebuf := CCallout
		library: cLibrary
		name: 'setlinebuf'
		result: #'void'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_setvbuf_inLibrary: cLibrary [

	Functionsetvbuf := CCallout
		library: cLibrary
		name: 'setvbuf'
		result: #'int32'
		args: #(#'ptr' #'ptr' #'int32' #'uint64')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_snprintf_inLibrary: cLibrary [

	Functionsnprintf := CCallout
		library: cLibrary
		name: 'snprintf'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'const char*')
		varArgsAfter: 3.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_sprintf_inLibrary: cLibrary [

	Functionsprintf := CCallout
		library: cLibrary
		name: 'sprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_sscanf_inLibrary: cLibrary [

	Functionsscanf := CCallout
		library: cLibrary
		name: 'sscanf'
		result: #'int32'
		args: #(#'const char*' #'const char*')
		varArgsAfter: 2.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_tempnam_inLibrary: cLibrary [

	Functiontempnam := CCallout
		library: cLibrary
		name: 'tempnam'
		result: #'char*'
		args: #(#'const char*' #'const char*')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_tmpfile_inLibrary: cLibrary [

	Functiontmpfile := CCallout
		library: cLibrary
		name: 'tmpfile'
		result: #'ptr'
		args: #()
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_tmpnam_inLibrary: cLibrary [

	Functiontmpnam := CCallout
		library: cLibrary
		name: 'tmpnam'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_tmpnam_r_inLibrary: cLibrary [

	Functiontmpnam_r := CCallout
		library: cLibrary
		name: 'tmpnam_r'
		result: #'char*'
		args: #(#'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_ungetc_inLibrary: cLibrary [

	Functionungetc := CCallout
		library: cLibrary
		name: 'ungetc'
		result: #'int32'
		args: #(#'int32' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vdprintf_inLibrary: cLibrary [

	Functionvdprintf := CCallout
		library: cLibrary
		name: 'vdprintf'
		result: #'int32'
		args: #(#'int32' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vfprintf_inLibrary: cLibrary [

	Functionvfprintf := CCallout
		library: cLibrary
		name: 'vfprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vfscanf_inLibrary: cLibrary [

	Functionvfscanf := CCallout
		library: cLibrary
		name: 'vfscanf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vprintf_inLibrary: cLibrary [

	Functionvprintf := CCallout
		library: cLibrary
		name: 'vprintf'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vscanf_inLibrary: cLibrary [

	Functionvscanf := CCallout
		library: cLibrary
		name: 'vscanf'
		result: #'int32'
		args: #(#'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vsnprintf_inLibrary: cLibrary [

	Functionvsnprintf := CCallout
		library: cLibrary
		name: 'vsnprintf'
		result: #'int32'
		args: #(#'ptr' #'uint64' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vsprintf_inLibrary: cLibrary [

	Functionvsprintf := CCallout
		library: cLibrary
		name: 'vsprintf'
		result: #'int32'
		args: #(#'ptr' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunction_vsscanf_inLibrary: cLibrary [

	Functionvsscanf := CCallout
		library: cLibrary
		name: 'vsscanf'
		result: #'int32'
		args: #(#'const char*' #'const char*' #'ptr')
		varArgsAfter: -1.

]

{ #category : 'Initializing - private' }
_libcStdio class >> initializeFunctions [

	| library |
	library := CLibrary named: 'libc.so.6'.
	self
		initializeFunction_ftello_inLibrary: library;
		initializeFunction_ftell_inLibrary: library;
		initializeFunction_getline_inLibrary: library;
		initializeFunction_fgetc_unlocked_inLibrary: library;
		initializeFunction_snprintf_inLibrary: library;
		initializeFunction_fopen_inLibrary: library;
		initializeFunction_dprintf_inLibrary: library;
		initializeFunction_clearerr_inLibrary: library;
		initializeFunction_getdelim_inLibrary: library;
		initializeFunction_getchar_unlocked_inLibrary: library;
		initializeFunction_rename_inLibrary: library;
		initializeFunction_remove_inLibrary: library;
		initializeFunction_fflush_unlocked_inLibrary: library;
		initializeFunction_vprintf_inLibrary: library;
		initializeFunction_feof_inLibrary: library;
		initializeFunction_fgets_inLibrary: library;
		initializeFunction_vscanf_inLibrary: library;
		initializeFunction_vfscanf_inLibrary: library;
		initializeFunction_ctermid_inLibrary: library;
		initializeFunction_fseeko_inLibrary: library;
		initializeFunction_perror_inLibrary: library;
		initializeFunction_vsprintf_inLibrary: library;
		initializeFunction_setvbuf_inLibrary: library;
		initializeFunction_putw_inLibrary: library;
		initializeFunction_printf_inLibrary: library;
		initializeFunction_ferror_unlocked_inLibrary: library;
		initializeFunction_fread_inLibrary: library;
		initializeFunction_fseek_inLibrary: library;
		initializeFunction_putc_inLibrary: library;
		initializeFunction_fgetpos_inLibrary: library;
		initializeFunction_fmemopen_inLibrary: library;
		initializeFunction_ferror_inLibrary: library;
		initializeFunction___overflow_inLibrary: library;
		initializeFunction_fwrite_unlocked_inLibrary: library;
		initializeFunction_scanf_inLibrary: library;
		initializeFunction_renameat_inLibrary: library;
		initializeFunction_feof_unlocked_inLibrary: library;
		initializeFunction_sprintf_inLibrary: library;
		initializeFunction_fread_unlocked_inLibrary: library;
		initializeFunction___getdelim_inLibrary: library;
		initializeFunction_putc_unlocked_inLibrary: library;
		initializeFunction_putchar_inLibrary: library;
		initializeFunction_putchar_unlocked_inLibrary: library;
		initializeFunction_puts_inLibrary: library;
		initializeFunction_fwrite_inLibrary: library;
		initializeFunction_setbuf_inLibrary: library;
		initializeFunction_fputc_inLibrary: library;
		initializeFunction_fprintf_inLibrary: library;
		initializeFunction_fclose_inLibrary: library;
		initializeFunction_vdprintf_inLibrary: library;
		initializeFunction_getw_inLibrary: library;
		initializeFunction___uflow_inLibrary: library;
		initializeFunction_fileno_inLibrary: library;
		initializeFunction_popen_inLibrary: library;
		initializeFunction_tempnam_inLibrary: library;
		initializeFunction_fsetpos_inLibrary: library;
		initializeFunction_vsnprintf_inLibrary: library;
		initializeFunction_pclose_inLibrary: library;
		initializeFunction_sscanf_inLibrary: library;
		initializeFunction_open_memstream_inLibrary: library;
		initializeFunction_fflush_inLibrary: library;
		initializeFunction_flockfile_inLibrary: library;
		initializeFunction_clearerr_unlocked_inLibrary: library;
		initializeFunction_getc_inLibrary: library;
		initializeFunction_rewind_inLibrary: library;
		initializeFunction_fscanf_inLibrary: library;
		initializeFunction_ungetc_inLibrary: library;
		initializeFunction_fputc_unlocked_inLibrary: library;
		initializeFunction_ftrylockfile_inLibrary: library;
		initializeFunction_setbuffer_inLibrary: library;
		initializeFunction_tmpnam_r_inLibrary: library;
		initializeFunction_fgetc_inLibrary: library;
		initializeFunction_funlockfile_inLibrary: library;
		initializeFunction_getchar_inLibrary: library;
		initializeFunction_freopen_inLibrary: library;
		initializeFunction_tmpfile_inLibrary: library;
		initializeFunction_getc_unlocked_inLibrary: library;
		initializeFunction_fputs_inLibrary: library;
		initializeFunction_fileno_unlocked_inLibrary: library;
		initializeFunction_tmpnam_inLibrary: library;
		initializeFunction_setlinebuf_inLibrary: library;
		initializeFunction_vfprintf_inLibrary: library;
		initializeFunction_fdopen_inLibrary: library;
		initializeFunction_vsscanf_inLibrary: library;
		yourself
]

{ #category : 'Functions' }
_libcStdio >> __getdelim: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' #'ptr' #'int32' #'ptr' )"

	^Function__getdelim
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> __overflow: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'int32' )"

	^Function__overflow
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> __uflow: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Function__uflow
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> clearerr_unlocked: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionclearerr_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> clearerr: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionclearerr
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ctermid: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' )"

	^Functionctermid
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> dprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' )"

	^Functiondprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fclose: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fdopen: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'int32' #'const char*' )"

	^Functionfdopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> feof_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfeof_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> feof: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfeof
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ferror_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionferror_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ferror: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionferror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fflush_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfflush_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fflush: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfflush
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fgetc_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfgetc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fgetc: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfgetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fgetpos: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'ptr' )"

	^Functionfgetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fgets: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' #'int32' #'ptr' )"

	^Functionfgets
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fileno_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfileno_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fileno: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionfileno
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> flockfile: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionflockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fmemopen: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'ptr' #'uint64' #'const char*' )"

	^Functionfmemopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fopen: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'const char*' #'const char*' )"

	^Functionfopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' )"

	^Functionfprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fputc_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionfputc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fputc: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionfputc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fputs: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionfputs
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fread_unlocked: args errno: errnoHolder [
	"Interpreted as #uint64 from #( #'ptr' #'uint64' #'uint64' #'ptr' )"

	^Functionfread_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fread: args errno: errnoHolder [
	"Interpreted as #uint64 from #( #'ptr' #'uint64' #'uint64' #'ptr' )"

	^Functionfread
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> freopen: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'const char*' #'const char*' #'ptr' )"

	^Functionfreopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fscanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' )"

	^Functionfscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fseek: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'int64' #'int32' )"

	^Functionfseek
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fseeko: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'int64' #'int32' )"

	^Functionfseeko
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fsetpos: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'ptr' )"

	^Functionfsetpos
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ftell: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' )"

	^Functionftell
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ftello: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' )"

	^Functionftello
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ftrylockfile: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionftrylockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> funlockfile: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionfunlockfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fwrite_unlocked: args errno: errnoHolder [
	"Interpreted as #uint64 from #( #'ptr' #'uint64' #'uint64' #'ptr' )"

	^Functionfwrite_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> fwrite: args errno: errnoHolder [
	"Interpreted as #uint64 from #( #'ptr' #'uint64' #'uint64' #'ptr' )"

	^Functionfwrite
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getc_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functiongetc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getc: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functiongetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getchar_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetchar_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getchar: args errno: errnoHolder [
	"Interpreted as #int32 from #( )"

	^Functiongetchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getdelim: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' #'ptr' #'int32' #'ptr' )"

	^Functiongetdelim
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getline: args errno: errnoHolder [
	"Interpreted as #int64 from #( #'ptr' #'ptr' #'ptr' )"

	^Functiongetline
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> getw: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functiongetw
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> open_memstream: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'ptr' #'ptr' )"

	^Functionopen_memstream
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> pclose: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' )"

	^Functionpclose
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> perror: args errno: errnoHolder [
	"Interpreted as #void from #( #'const char*' )"

	^Functionperror
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> popen: args errno: errnoHolder [
	"Interpreted as #ptr from #( #'const char*' #'const char*' )"

	^Functionpopen
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> printf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> putc_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionputc_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> putc: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionputc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> putchar_unlocked: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionputchar_unlocked
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> putchar: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' )"

	^Functionputchar
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> puts: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionputs
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> putw: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionputw
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> remove: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionremove
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> rename: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionrename
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> renameat: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'int32' #'const char*' )"

	^Functionrenameat
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> rewind: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionrewind
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> scanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' )"

	^Functionscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> setbuf: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' #'ptr' )"

	^Functionsetbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> setbuffer: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' #'ptr' #'uint64' )"

	^Functionsetbuffer
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> setlinebuf: args errno: errnoHolder [
	"Interpreted as #void from #( #'ptr' )"

	^Functionsetlinebuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> setvbuf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'ptr' #'int32' #'uint64' )"

	^Functionsetvbuf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> snprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' #'const char*' )"

	^Functionsnprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> sprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' )"

	^Functionsprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> sscanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' )"

	^Functionsscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> tempnam: args errno: errnoHolder [
	"Interpreted as #char* from #( #'const char*' #'const char*' )"

	^Functiontempnam
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> tmpfile: args errno: errnoHolder [
	"Interpreted as #ptr from #( )"

	^Functiontmpfile
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> tmpnam_r: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' )"

	^Functiontmpnam_r
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> tmpnam: args errno: errnoHolder [
	"Interpreted as #char* from #( #'ptr' )"

	^Functiontmpnam
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> ungetc: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'ptr' )"

	^Functionungetc
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vdprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'int32' #'const char*' #'ptr' )"

	^Functionvdprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vfprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' #'ptr' )"

	^Functionvfprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vfscanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' #'ptr' )"

	^Functionvfscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionvprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vscanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'ptr' )"

	^Functionvscanf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vsnprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'uint64' #'const char*' #'ptr' )"

	^Functionvsnprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vsprintf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'ptr' #'const char*' #'ptr' )"

	^Functionvsprintf
		callWith: args
		errno: errnoHolder
]

{ #category : 'Functions' }
_libcStdio >> vsscanf: args errno: errnoHolder [
	"Interpreted as #int32 from #( #'const char*' #'const char*' #'ptr' )"

	^Functionvsscanf
		callWith: args
		errno: errnoHolder
]
