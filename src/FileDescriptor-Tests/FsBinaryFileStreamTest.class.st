Class {
	#name : 'FsBinaryFileStreamTest',
	#superclass : 'TestCase',
	#instVars : [
		'sandbox'
	],
	#category : 'FileDescriptor-Tests'
}

{ #category : 'accessing' }
FsBinaryFileStreamTest >> createFile: aString
contents: contentBytes [

	| reference |
	reference := sandbox / aString.
	reference parent ensureCreateDirectory.
	reference binaryWriteStreamDo: [:stream | stream nextPutAll: contentBytes].
	self assert: reference isFile.
	^reference
]

{ #category : 'accessing' }
FsBinaryFileStreamTest >> sandboxName [

	^'FsFibaryFileStreamTest-Sandbox'
]

{ #category : 'running' }
FsBinaryFileStreamTest >> setUp [

	| fileSystem |
	super setUp.
	fileSystem := FileSystem disk.
	sandbox := FileLocator temp asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: fileSystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
FsBinaryFileStreamTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'running' }
FsBinaryFileStreamTest >> testContents [

	| contents ref stream |
	contents := #[84 104 101 115 101 32 98 121 116 101 115 32 97 114 101 32 42 100 101 102 105 110 105 116 101 108 121 42 32 114 97 110 100 111 109 108 121 32 103 101 110 101 114 97 116 101 100 46].
	ref := self
		createFile: 'testContents'
		contents: contents.
	stream := ref binaryReadStream.
	self
		assert: stream next
		equals: 84.
	self
		assert: (stream next: 3)
		equals: #[104 101 115].
	self
		assert: stream contents
		equals: contents
]

{ #category : 'running' }
FsBinaryFileStreamTest >> testNext [

	| ref stream |
	ref := self
		createFile: 'testNext'
		contents: ByteArray new.
	stream := ref binaryReadStream.
	self
		assert: stream next
		equals: nil
]
