"
Part of FileSystem

=========

Try and test file attribute access from FileReference.

As Pharo doesn't provide a mechanism to set the attributes, pick a few well known files and make sure they have reasonable attributes, e.g. the VM is executable, it isn't older than when the classes were first created or newer than today, etc.
"
Class {
	#name : 'FileReferenceAttributeTests',
	#superclass : 'FsTestCase',
	#instVars : [
		'reference',
		'afterCreationTime',
		'beforeCreationTime'
	],
	#category : 'FileSystem-Tests-Attributes'
}

{ #category : 'accessing' }
FileReferenceAttributeTests >> afterCreationTime [

	^afterCreationTime
]

{ #category : 'asserting' }
FileReferenceAttributeTests >> assert: middle
between: min
and: max [

	^self assert: (middle between: min and: max)
]

{ #category : 'accessing' }
FileReferenceAttributeTests >> beforeCreationTime [

	^beforeCreationTime
]

{ #category : 'accessing' }
FileReferenceAttributeTests >> reference [

	^reference
]

{ #category : 'initializing' }
FileReferenceAttributeTests >> setUp [

	| ws bufferedStream |
	reference := FileLocator workingDirectory asFileReference
		/ ('FileAttributesTests-' , GsUuidV4 new asInteger asString , '.txt').
	beforeCreationTime := DateAndTime now.
	self shortDelay.
	ws := reference writeStream.
	bufferedStream := ZnBufferedWriteStream on: ws.
	[ 
	bufferedStream nextPutAll: 'Created by FileAttributesTestsResources>>setUp '.
	beforeCreationTime printOn: bufferedStream ]
		ensure: [ bufferedStream close ].
	self shortDelay.
	afterCreationTime := DateAndTime now
]

{ #category : 'helper methods' }
FileReferenceAttributeTests >> shortDelay [

	(Delay forMilliseconds: 10) wait
]

{ #category : 'initializing' }
FileReferenceAttributeTests >> tearDown [

	reference delete
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testAccessTime [

	| initialAccessTime |
	initialAccessTime := self reference accessTime.
	(Delay forMilliseconds: 10) wait.
	"By default, it seems linux is configured to update access time
	only if it is older than modification time."
	self reference binaryWriteStream nextPutAll: #[1 2 3 4]; close.
	self reference binaryReadStream next: 1; close.
	self assert: self reference accessTime > initialAccessTime
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testCreationTime [

	self
		should: [self reference creationTime]
		raise: FileAttributeNotSupported.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testExists [

	self assert: self reference exists
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testFileSize [

	self
		assert: self reference size
		equals: 79
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsCharacter [

	self deny: self reference isCharacter
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsDirectory [

	self deny: self reference isDirectory.
	self assert: FileLocator workingDirectory isDirectory.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsFile [

	self assert: self reference isFile.
	self deny: FileLocator workingDirectory isFile.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsReadable [

	self assert: self reference isReadable.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsSymlink [

	self deny: self reference isSymlink.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsWriteable [

	self assert: self reference isWritable.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testModificationTime [

	self
		assert: self reference modificationTime
		between: self beforeCreationTime
		and: self afterCreationTime.
	self shortDelay.
	self reference binaryWriteStream
		nextPutAll: (ByteArray new: 5);
		close.
	self shortDelay.
	self
		assert: self reference modificationTime
		between: self afterCreationTime
		and: DateAndTime now
]
