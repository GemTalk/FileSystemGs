Class {
	#name : 'FsTestCase',
	#superclass : 'GsTestCase',
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'testing' }
FsTestCase class >> isAbstract [
	^ self name = #FsTestCase
]
