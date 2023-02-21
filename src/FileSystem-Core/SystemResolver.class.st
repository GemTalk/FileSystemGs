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

{ #category : 'private' }
SystemResolver >> _extent: extentIndex [
	"Answer the path to the extent at extentIndex in DBF_EXTENT_NAMES: (System stoneConfigurationReport at: #DBF_EXTENT_NAMES) at: extentIndex"

	| extentNames extentName |
	extentNames := System stoneConfigurationAt: #DBF_EXTENT_NAMES.
	extentNames _isArray
		ifTrue: [  
			extentIndex > extentNames size ifTrue: [  self error: 'Requested extent index (', extentIndex printString, ') exceeds number of extents present in system (', extentNames size printString, ')'  ].
			extentName := extentNames at: extentIndex ]
		ifFalse: [ 
			extentIndex ~= 1 ifTrue: [  self error: 'Requested extent index (', extentIndex printString, ') exceeds number of extents present in system (1)'  ].
			extentName := extentNames ].
	^ self  resolveString: extentName
]

{ #category : 'origins' }
SystemResolver >> extent1 [

	^ self _extent: 1
]

{ #category : 'origins' }
SystemResolver >> extent1Directory [

	^ self extent1 parent
]

{ #category : 'origins' }
SystemResolver >> gemLogDirectory [
	"Answer the path to the gem log directory"

	^ self  resolveString: (System gemLogPath)
]

{ #category : 'resolving' }
SystemResolver >> supportedOrigins [
	^ #( extent1 extent1Directory tranlog workingDirectory )
]

{ #category : 'origins' }
SystemResolver >> tranlog [
	"Answer the path to the current tranlog"

	^ self  resolveString: (System stoneConfigurationAt: #StnCurrentTranLogNames)
]

{ #category : 'origins' }
SystemResolver >> workingDirectory [
	"Returns the current working directory"

	^FileSystem disk workingDirectory
]
