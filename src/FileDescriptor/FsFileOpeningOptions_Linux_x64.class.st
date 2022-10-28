"
Part of FileSystem

=========

Users of FileOpeningOptions should use the interface as defined in FsFileOpeningOptions, FsMemoryFileOpeningOptions, and FsUnixFileOpeningOptions. All subclasses of these classes are implementation-defined and subject to change at anytime.

This subclass provides the architecture-specific values for various constants.
"
Class {
	#name : 'FsFileOpeningOptions_Linux_x64',
	#superclass : 'FsFileOpeningOptions_Linux',
	#category : 'FileDescriptor'
}

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux_x64 >> O_DIRECTORY [
	"Fail opening a non-directory file."

	^8r000200000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux_x64 >> O_NOFOLLOW [
	"Don't follow symlinks"

	^8r000400000
]
