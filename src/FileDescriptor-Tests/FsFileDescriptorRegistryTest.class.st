Class {
	#name : 'FsFileDescriptorRegistryTest',
	#superclass : 'TestCase',
	#instVars : [
		'sandbox'
	],
	#category : 'FileDescriptor-Tests'
}

{ #category : 'creating' }
FsFileDescriptorRegistryTest >> createFile: aString [

	^self
		createFile: aString
		contents: 'Default file contents'
]

{ #category : 'creating' }
FsFileDescriptorRegistryTest >> createFile: aString
contents: contentsString [

	| reference |
	reference := sandbox / aString.
	reference parent ensureCreateDirectory.
	reference writeStreamDo: [:stream | stream nextPutAll: contentsString].
	self assert: reference isFile.
	^reference
]

{ #category : 'accessing' }
FsFileDescriptorRegistryTest >> ephemeronFor: aFileDescriptor [

	^self registry _list detect: [:each | each _isSmallInteger not and: [each _fileDescriptor = aFileDescriptor]]
]

{ #category : 'accessing' }
FsFileDescriptorRegistryTest >> maximumReclamation [

	System
		_generationScavenge_vmMarkSweep;
		_generationScavenge_vmMarkSweep
]

{ #category : 'accessing' }
FsFileDescriptorRegistryTest >> registry [

	^FsFileDescriptorRegistry current
]

{ #category : 'testing' }
FsFileDescriptorRegistryTest >> registryIncludes: anEphemeron [

	^anEphemeron _index
		ifNotNil: [:index | (self registry _list at: index) = anEphemeron]
		ifNil: [self registry _list includes: anEphemeron "Ensure we do not include the Ephemeron even if we no longer have an index."]
]

{ #category : 'running' }
FsFileDescriptorRegistryTest >> setUp [
	"initialize sandbox"

	super setUp.
	sandbox := FileLocator temp asFileReference / 'FsFileDescriptorRegistryTest-Sandbox'
]

{ #category : 'running' }
FsFileDescriptorRegistryTest >> tearDown [
	"initialize sandbox"

	sandbox deleteAll.
	super tearDown
]

{ #category : 'running' }
FsFileDescriptorRegistryTest >> testClose [
	"Ensure the Ephemeron is removed once the file descriptor is closed but not yet garbage collected."

	| ref fd unixFd ephemeron |
	ref := self createFile: 'file-a'.
	fd := ref openOptions: ref defaultOptionsForRead.
	ephemeron := self ephemeronFor: fd.
	self assert: (self registryIncludes: ephemeron).
	fd close.
	self deny: (self registryIncludes: ephemeron).
	self assert: unixFd = unixFd
]

{ #category : 'running' }
FsFileDescriptorRegistryTest >> testMourning [
	"Ensure that a FileDescriptor is automatically closed if I release my reference."

	| ref fd unixFd ephemeron |
	ref := self createFile: 'file-a'.
	fd := ref openOptions: ref defaultOptionsForRead.
	ephemeron := self ephemeronFor: fd.
	self assert: (self registryIncludes: ephemeron).
	unixFd := fd _fd.
	fd := nil.
	self maximumReclamation.
	self deny: (self registryIncludes: ephemeron).
	self
		should: [DiskStore current libcStat fstat: unixFd]
		raise: FsEBADF
]
