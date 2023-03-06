"
Part of FileSystem

=========

Error raised when attempting to operate on an invalid FsFileDescriptor
"
Class {
	#name : 'FsFileDescriptorInvalid',
	#superclass : 'FsError',
	#instVars : [
		'fileDescriptor'
	],
	#category : 'FileDescriptor'
}

{ #category : 'instance creation' }
FsFileDescriptorInvalid class >> fileDescriptor: aFileDescriptor [

	^self new
		fileDescriptor: aFileDescriptor;
		yourself
]

{ #category : 'accessing' }
FsFileDescriptorInvalid >> fileDescriptor [
	"Returns the file descriptor associated with this error."

	^fileDescriptor
]

{ #category : 'accessing' }
FsFileDescriptorInvalid >> fileDescriptor: aFileDescriptor [
	"Sets the file descriptor associated with this error."

	fileDescriptor := aFileDescriptor
]

{ #category : 'accessing' }
FsFileDescriptorInvalid >> messageText [

	^super messageText ifNil: ['Cannot perform operations on invalid file descriptor.']
]
