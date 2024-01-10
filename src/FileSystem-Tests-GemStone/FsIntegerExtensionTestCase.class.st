Class {
	#name : 'FsIntegerExtensionTestCase',
	#superclass : 'FsTestCase',
	#category : 'FileSystem-Tests-GemStone'
}

{ #category : 'running' }
FsIntegerExtensionTestCase >> testBinaryShiftRight [
	"Test >>"

	self
		assert: 137087381899686168693902789234916601184 >> 12
		equals: 33468599096603068528784860653055810.
	self
		assert: -137087381899686168693902789234916601184 >> 12
		equals: -33468599096603068528784860653055811.
	self
		assert: 0 >> 2
		equals: 0.
	self
		should: [3 >> -5]
		raise: Error.
	self
		assert: 12 >> 3
		equals: 1.
	self
		assert: -12 >> 3
		equals: -2
]
