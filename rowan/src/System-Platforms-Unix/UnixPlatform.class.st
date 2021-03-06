"
I am a an object representing a Unix platform. Use myself to access platform specific features.

Please keep me polymorphic to the the other platform objects.

To get the current platform, you can evaluate:

OSPlatform current.
"
Class {
	#name : 'UnixPlatform',
	#superclass : 'OSPlatform',
	#instVars : [
		'libcDirent',
		'libcFcntl',
		'libcUnistd'
	],
	#category : 'System-Platforms-Unix'
}

{ #category : 'accessing' }
UnixPlatform >> defaultMaximumPathLength [
	"This method returns the default maximum path length for the getCurrentWorkingDirectory implementation. 
Unix default PATH_MAX is 4096.  PATH_MAX is needed to avoid buffer overflow. In case PATH_MAX is not sufficient the method  currentWorkingDirectoryWithBufferSize: can be used to give desired buffer size."
	^4096

]

{ #category : 'accessing' }
UnixPlatform >> family [
	^#Unix
]

{ #category : 'accessing' }
UnixPlatform >> getPwdViaFFI: buffer size: bufferSize [
	"This method calls the Standard C Library getcwd() function. The name of the argument (arg1) should fit decompiled version.This method is used in getting the current working directory. getcwd is preffered over pwd because getcwd takes care of re-initialization of environment variables, whereas pwd needs implict re- initialization.
	
	We use FFI-Kernel for this because this is required for bootstrapping, and we ensure minimal dependencies."
	self fixMe.
	self halt: 'Need to get this done through a Libc class.'
	"^ (ExternalLibraryFunction 
			name: 'getcwd'
			module: 'libc.so.6'
			callType: 1
			returnType: ExternalType char asPointerType
			argumentTypes: {
				ExternalType char asPointerType.
				ExternalType long })
					invokeWith: buffer with: bufferSize."
]

{ #category : 'initialization' }
UnixPlatform >> initialize [
	libcDirent := LibcDirent new.
	libcFcntl := LibcFcntl new.
	libcUnistd := LibcUnistd new
]

{ #category : 'testing' }
UnixPlatform >> isUnix [
	^ true
]

{ #category : 'accessing' }
UnixPlatform >> libcDirent [
	^libcDirent
]

{ #category : 'accessing' }
UnixPlatform >> libcFcntl [
	^libcFcntl
]

{ #category : 'accessing' }
UnixPlatform >> libcUnistd [
	^libcUnistd
]

{ #category : 'accessing' }
UnixPlatform >> lineEnding [

	^ String lf
]
