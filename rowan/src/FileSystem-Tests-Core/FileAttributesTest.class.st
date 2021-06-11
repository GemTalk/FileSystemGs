Class {
	#name : 'FileAttributesTest',
	#superclass : 'TestCase',
	#instVars : [
		'filesystem',
		'sandbox'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'testing' }
FileAttributesTest class >> isAbstract [

	^self == FileAttributesTest
]

{ #category : 'testing' }
FileAttributesTest class >> shouldInheritSelectors [

	^true
]

{ #category : 'initialize-release' }
FileAttributesTest >> cleanupSandbox [
	"Cleanup the sandbox after running tests."

	sandbox deleteAll
]

{ #category : 'initialize-release' }
FileAttributesTest >> initializeSanbox [
	"initialize the test sandbox"

	self subclassResponsibility
]

{ #category : 'accessing' }
FileAttributesTest >> sandboxDirectoryName [
	"The name of the sandbox directory."

	^'FileAttributesTest-Sandbox'
]

{ #category : 'running' }
FileAttributesTest >> setUp [

	super setUp.
	self initializeSanbox
]

{ #category : 'running' }
FileAttributesTest >> tearDown [

	self cleanupSandbox.
	super tearDown
]

{ #category : 'running' }
FileAttributesTest >> testBasename [

	| sandboxAttributes |
	sandboxAttributes := sandbox attributes.
	self
		assert: sandboxAttributes basename
		equals: self sandboxDirectoryName.
	self
		assert: sandboxAttributes name
		equals: self sandboxDirectoryName.
]

{ #category : 'running' }
FileAttributesTest >> testCreationTime [

	| sandboxAttributes exception |
	sandboxAttributes := sandbox attributes.
	exception := [sandboxAttributes creationTime.
		self assert: false]
		on: FileAttributeNotSupported
		do: [:ex | ex return: ex].
	self
		assert: exception attribute
		equals: #creationTime
]

{ #category : 'running' }
FileAttributesTest >> testDirectory [

	| testDirectory attributes |
	testDirectory := sandbox / 'test-directory'.
	attributes := testDirectory attributes.
	"Assert properties prior to creation."
	self
		deny: attributes isDirectory;
		deny: attributes isFile;
		deny: attributes isSymlink.
	"Assert properties after creation. Note, attributes reflects the updated state."
	testDirectory createDirectory.
	self
		assert: attributes isDirectory;
		deny: attributes isFile;
		deny: attributes isSymlink
]

{ #category : 'running' }
FileAttributesTest >> testFile [

	| testFile attributes |
	testFile := sandbox / 'test-file'.
	attributes := testFile attributes.
	"Assert properties prior to creation."
	self
		deny: attributes isDirectory;
		deny: attributes isFile;
		deny: attributes isSymlink.
	"Assert properties after creation. Note, attributes reflects the updated state."
	testFile createFile.
	self
		deny: attributes isDirectory;
		assert: attributes isFile;
		deny: attributes isSymlink
]

{ #category : 'running' }
FileAttributesTest >> testModificationTime [

	| attributes |
	attributes := sandbox attributes.
	self assert: (attributes modificationTime isKindOf: DateAndTime)
]

{ #category : 'running' }
FileAttributesTest >> testSymlink [

	| testSymlink attributes |
	testSymlink := sandbox / 'test-symlink'.
	attributes := testSymlink attributes.
	"Assert properties prior to creation."
	self
		deny: attributes isDirectory;
		deny: attributes isFile;
		deny: attributes isSymlink.
	"Assert properties after creation. Note, attributes reflects the updated state."
	"Create symlink not yet implemented."
	self
		deny: attributes isDirectory;
		deny: attributes isFile;
		assert: attributes isSymlink
]
