Class {
	#name : 'MacOSFileOpeningOptions',
	#superclass : 'UnixFileOpeningOptions',
	#category : 'FileDescriptor'
}

{ #category : 'private constants' }
MacOSFileOpeningOptions >> O_CREAT [
	^ 8r1000
]
