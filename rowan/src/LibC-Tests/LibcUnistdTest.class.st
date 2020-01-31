Class {
	#name : 'LibcUnistdTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
LibcUnistdTest >> setUp [
	instance := LibcUnistd new
]

{ #category : 'tests' }
LibcUnistdTest >> testEbadf [
	"This test relies on the gem not having a file descriptor numbered 123.
	This should be true most of the time, but is not guaranteed."

	| buf |
	buf := CByteArray gcMalloc: 10.
	self
		should: [ instance readFromFileDescriptor: 123 toBuffer: buf count: 0 ]
		raise: EBADF
]
