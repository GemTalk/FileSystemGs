"
Try and test file attribute access from FileReference.

As Pharo doesn't provide a mechanism to set the attributes, pick a few well known files and make sure they have reasonable attributes, e.g. the VM is executable, it isn't older than when the classes were first created or newer than today, etc.

"
Class {
	#name : 'FileReferenceAttributeTests',
	#superclass : 'TestCase',
	#category : 'FileSystem-Tests-Attributes'
}

{ #category : 'resources' }
FileReferenceAttributeTests class >> resources [

	^Array with: DiskFileAttributesTestsResources.
]

{ #category : 'asserting' }
FileReferenceAttributeTests >> assert: middle
between: min
and: max [

	^self assert: (middle between: min and: max)
]

{ #category : 'helper methods' }
FileReferenceAttributeTests >> shortDelay [

	(Delay forMilliseconds: 10) wait
]

{ #category : 'helper methods' }
FileReferenceAttributeTests >> tempFileResource [

	^DiskFileAttributesTestsResources current
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testAccessTime [

	| resource reference initialAccessTime |
	resource := self tempFileResource.
	reference := resource file.
	initialAccessTime := reference accessTime.
	(Delay forMilliseconds: 10) wait.
	"By default, it seems linux is configured to update access time
	only if it is older than modification time."
	reference binaryWriteStream nextPutAll: #[1 2 3 4]; close.
	reference binaryReadStream next: 1; close.
	self assert: reference accessTime > initialAccessTime
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testCreationTime [

	| reference |
	reference  := self tempFileResource file.
	self
		should: [reference creationTime]
		raise: UnsupportedFileReferenceAttribute.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testExists [

	self assert: self tempFileResource file exists
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testFileSize [

	self
		assert: self tempFileResource file size
		equals: 79
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsCharacter [

	self deny: self tempFileResource file isCharacter
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsDirectory [

	self deny: self tempFileResource file isDirectory.
	self assert: FileLocator temp isDirectory.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsFile [

	self assert: self tempFileResource file isFile.
	self deny: FileLocator temp isFile.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsReadable [

	self assert: self tempFileResource file isReadable.

]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsSymlink [

	self deny: self tempFileResource file resolve isSymlink.
]

{ #category : 'tests' }
FileReferenceAttributeTests >> testIsWriteable [

	self assert: self tempFileResource file isWritable.

]

{ #category : 'tests' }
FileReferenceAttributeTests >> testModificationTime [

	| resource reference |
	resource := self tempFileResource.
	reference := resource file.
	self
		assert: reference modificationTime
		between: resource beforeCreationTime
		and: resource afterCreationTime.
	self shortDelay.
	reference binaryWriteStream
		nextPutAll: (ByteArray new: 5);
		close.
	self shortDelay.
	self
		assert: reference modificationTime
		between: resource afterCreationTime
		and: DateAndTime now
]
