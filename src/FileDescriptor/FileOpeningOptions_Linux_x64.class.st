Class {
	#name : 'FileOpeningOptions_Linux_x64',
	#superclass : 'FileOpeningOptions_Linux',
	#category : 'FileDescriptor'
}

{ #category : 'private-constants' }
FileOpeningOptions_Linux_x64 >> O_DIRECTORY [
	"Fail opening a non-directory file."

	^8r000200000
]

{ #category : 'private-constants' }
FileOpeningOptions_Linux_x64 >> O_NOFOLLOW [
	"Don't follow symlinks"

	^8r000400000
]
