"
Part of FileSystem

=========

Users of FileOpeningOptions should use the interface as defined in FsFileOpeningOptions, FsMemoryFileOpeningOptions, and FsUnixFileOpeningOptions. All subclasses of these classes are implementation-defined and subject to change at anytime.

This class provides constant values specific to macOS.
"
Class {
	#name : 'FsFileOpeningOptions_macOS',
	#superclass : 'FsUnixFileOpeningOptions',
	#category : 'FileSystem-FileDescriptor'
}

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_ACCMODE [

	^8r000000003
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_APPEND [

	^8r000000010
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_CLOEXEC [

	^8r100000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_CREAT [

	^8r000001000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_DIRECTORY [

	^8r004000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_DSYNC [

	^8r020000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_EXCL [

	^8r4000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_NOCTTY [

	^8r400000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_NOFOLLOW [

	^8r400
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_NONBLOCK [

	^8r000000004
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_RDONLY [

	^8r000000000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_RDWR [

	^8r000000002
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_SYNC [

	^8r000000200
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_TRUNC [

	^8r000002000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_macOS >> O_WRONLY [

	^8r000000001
]
