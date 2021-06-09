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
