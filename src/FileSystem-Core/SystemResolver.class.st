"
Part of FileSystem

=========

I resolve origins that are related to the currently running Smalltalk system, using primitives provided by the VM.
"
Class {
	#name : 'SystemResolver',
	#superclass : 'FileSystemResolver',
	#category : 'FileSystem-Core'
}

{ #category : 'origins' }
SystemResolver >> gemLogDirectory [
	"Answer the path to the gem log directory"

	| pathString |
	pathString := System gemLogPath.
	^pathString = ''
		ifTrue: [nil]
		ifFalse: [self  resolveString: pathString]
]

{ #category : 'private' }
SystemResolver >> gemLogDirectoryDefined [

	^System gemLogPath ~= ''
]

{ #category : 'resolving' }
SystemResolver >> supportedOrigins [

	^self gemLogDirectoryDefined
		ifTrue: [#( workingDirectory gemLogDirectory )]
		ifFalse: [#( workingDirectory )]
]

{ #category : 'origins' }
SystemResolver >> workingDirectory [
	"Returns the current working directory"

	^FileSystem disk workingDirectory
]
