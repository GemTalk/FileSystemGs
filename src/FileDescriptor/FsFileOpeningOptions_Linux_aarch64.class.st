"
Part of FileSystem

=========

This subclass provides the architecture-specific values for various constants.
"
Class {
	#name : 'FsFileOpeningOptions_Linux_aarch64',
	#superclass : 'FsFileOpeningOptions_Linux',
	#category : 'FileDescriptor'
}

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux_aarch64 >> O_DIRECTORY [
	"Fail opening a non-directory file."

	^8r000040000
]

{ #category : 'private-constants' }
FsFileOpeningOptions_Linux_aarch64 >> O_NOFOLLOW [
	"Don't follow symlinks"

	^8r000100000
]
