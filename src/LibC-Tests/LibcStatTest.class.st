Class {
	#name : 'LibcStatTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
LibcStatTest >> setUp [

	super setUp.
	instance := OSPlatform current libcStatClass new
]

{ #category : 'running' }
LibcStatTest >> testStatRootDirectory [

	| stat |
	stat := instance stat: '/'.
	self assert: stat isDirectory
]
