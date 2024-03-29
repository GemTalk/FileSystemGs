"
Part of FileSystem

=========

SUnit tests for file reference.

This test case assumes that #tearDown will appropriately cleanup the sandbox directory. Files placed anywhere else should be cleaned up by the test itself.
"
Class {
	#name : 'FileReferenceTest',
	#superclass : 'FsTestCase',
	#type : 'variable',
	#instVars : [
		'sandbox'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'tesing' }
FileReferenceTest class >> isAbstract [

	^self == FileReferenceTest
]

{ #category : 'tesing' }
FileReferenceTest class >> shouldInheritSelectors [

	^true
]

{ #category : 'asserting' }
FileReferenceTest >> assert: anObject
identicalTo: bObject [

	^self assert: anObject == bObject
]

{ #category : 'asserting' }
FileReferenceTest >> assert: anObject
isKindOf: aClass [

	^self assert: (anObject isKindOf: aClass)
]

{ #category : 'support' }
FileReferenceTest >> binaryContentsOf: aReference [

	| contents |
	aReference binaryReadStreamDo: [:stream | contents := stream contents].
	^contents
]

{ #category : 'support' }
FileReferenceTest >> createDirectory: aString [

	| reference |
	reference := sandbox / aString.
	reference ensureCreateDirectory.
	self assert: reference isDirectory.
	^reference
]

{ #category : 'support' }
FileReferenceTest >> createFile: aString [

	^self
		createFile: aString
		contents: self defaultFileContents
]

{ #category : 'support' }
FileReferenceTest >> createFile: aString
contents: contentsString [

	| reference |
	reference := sandbox / aString.
	reference parent ensureCreateDirectory.
	reference writeStreamDo: [:stream | stream nextPutAll: contentsString].
	self assert: reference isFile.
	^reference
]

{ #category : 'support' }
FileReferenceTest >> defaultFileContents [

	^self class name asString, '>>', self selector asString
]

{ #category : 'asserting' }
FileReferenceTest >> deny: anObject
identicalTo: bObject [

	^self deny: anObject == bObject
]

{ #category : 'other' }
FileReferenceTest >> fileSystem [

	^sandbox fileSystem
]

{ #category : 'accessing' }
FileReferenceTest >> fsType [

	^self fileSystem isDiskFileSystem
		ifTrue: ['disk']
		ifFalse: ['memory'].
]

{ #category : 'accessing' }
FileReferenceTest >> sandboxName [
	"name of the sandbox directory"

	^String new, self class name, '-', self selector, '-Sandbox'
]

{ #category : 'tests' }
FileReferenceTest >> testAccessTime [
	"See subclass implementations if supported."

	self
		should: [sandbox accessTime]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testAllChildren [
	"allChildren returns all the files and folders recursively nested in a reference"

	| alpha children |
	alpha := self createDirectory: 'alpha'.
	self
		createDirectory: 'alpha/beta';
		createDirectory: 'alpha/beta/delta';
		createDirectory: 'alpha/gamma'.
	children := alpha allChildren.
	"all children returns the nodes: '/alpha', '/alpha/beta',  '/alpha/beta/delta', and '/alpha/gamma'."
	self assert: children size equals: 4.
	children
		do: [ :child | 
			self assert: child class equals: FileReference.
			self assert: (alpha = child or: [ alpha contains: child ]) ].
	self
		assert: (children collect: [ :ea | ea basename ]) asSet
		equals: #('alpha' 'beta' 'gamma' 'delta') asSet
]

{ #category : 'tests' }
FileReferenceTest >> testAllDirectories [
	"allDirectories returns all folders recursively nested in a reference"

	| alpha children |
	alpha := self createDirectory: 'alpha'.
	self
		createDirectory: 'alpha/beta';
		createDirectory: 'alpha/beta/delta';
		createDirectory: 'alpha/gamma'.
	children := alpha allDirectories.
	"all children returns the directories: '/alpha', '/alpha/beta', and '/alpha/gamma'."
	self assert: children size equals: 4.
	children
		do: [ :child | 
			self assert: child class equals: FileReference.
			self assert: (alpha = child or: [ alpha contains: child ]) ].
	self
		assert: (children collect: [ :ea | ea basename ]) asSet
		equals: #('alpha' 'beta' 'gamma' 'delta') asSet
]

{ #category : 'tests' }
FileReferenceTest >> testAppendStream [

	| ref stream |
	ref := sandbox / 'testAppendStream.file'.
	self deny: ref exists.
	stream := ref appendStream.
	[stream nextPutAll: '1234']
		ensure: [stream close].
	self
		assert: ref contents
		equals: '1234'.
	stream := ref appendStream.
	[stream nextPutAll: '5678']
		ensure: [stream close].
	self
		assert: ref contents
		equals: '12345678'.
]

{ #category : 'tests' }
FileReferenceTest >> testAppendStreamDo [

	| ref |
	ref := sandbox / 'testAppendStreamDo.file'.
	self deny: ref exists.
	ref appendStreamDo: [:stream | stream nextPutAll: '1234'].
	self assert: ref exists.
	self
		assert: ref contents
		equals: '1234'.
	ref appendStreamDo: [:stream | stream nextPutAll: '5678'].
	self
		assert: ref contents
		equals: '12345678'
]

{ #category : 'tests' }
FileReferenceTest >> testAppendStreamEncoded [

	| ref stream |
	ref := sandbox / 'testAppendStreamEncoded.file'.
	self deny: ref exists.
	stream := ref appendStreamEncoded: 'utf8'.
	[stream nextPutAll: '1234']
		ensure: [stream close].
	self
		assert: (self binaryContentsOf: ref)
		equals: #[49 50 51 52].
	stream := ref appendStreamEncoded: '8bit'.
	[stream nextPutAll: '5678']
		ensure: [stream close].
	self
		assert:(self binaryContentsOf: ref)
		equals: #[49 50 51 52 53 54 55 56].
]

{ #category : 'tests' }
FileReferenceTest >> testAppendStreamEncodedDo [

	| ref  |
	ref := sandbox / 'testAppendStreamEncoded.file'.
	self deny: ref exists.
	ref
		appendStreamEncoded: 'utf8'
		do: [:stream | stream nextPutAll: '1234'].
	self
		assert: (self binaryContentsOf: ref)
		equals: #[49 50 51 52].
	ref
		appendStreamEncoded: 'utf8'
		do: [:stream | stream nextPutAll: '5678'].
	self
		assert:(self binaryContentsOf: ref)
		equals: #[49 50 51 52 53 54 55 56].
]

{ #category : 'tests' }
FileReferenceTest >> testAsAbsoluteConverted [
	"Converts a relative reference to absolute, and asserts
	that it's absolute and still has the same path."

	| ref absolute absolutePath |
	ref := sandbox / 'plonk'.
	absolute := ref asAbsolute.
	self assert: absolute isAbsolute.
	absolutePath := absolute path.
	self assert: (absolutePath at: absolutePath size) equals: 'plonk'
]

{ #category : 'tests' }
FileReferenceTest >> testAsAbsoluteIdentity [
	| ref |
	ref := sandbox / 'plonk'.
	self assert: ref asAbsolute == ref
]

{ #category : 'tests' }
FileReferenceTest >> testAsJson [
	"Ensure that a resonable JSON string is generated for instances
	with both AbsolutePath and RelativePath paths."

	| reference expected |
	reference := FileReference
		fileSystem: self fileSystem
		path: Path / 'absolute' / 'path'.
	expected := '{"path":"/absolute/path","filesystem":"', self fsType, '"}'.
	self
		assert: reference asJson
		equals: expected.
	reference := FileReference
		fileSystem: self fileSystem
		path: Path * 'relative' / 'path'.
	expected := '{"path":"relative/path","filesystem":"', self fsType, '"}'.
	self
		assert: reference asJson
		equals: expected
]

{ #category : 'tests' }
FileReferenceTest >> testAsReference [
	| ref |
	ref := sandbox / 'plonk'.
	self assert: ref asFileReference == ref
]

{ #category : 'tests' }
FileReferenceTest >> testBaseAndExtension [
	| noExtension simpleExtension complexExtension |
	noExtension := sandbox / 'plonk'.
	self assert: noExtension extension equals: ''.

	"We create a reference to the plonk/griffle.taz in the context of filesystem"
	simpleExtension := sandbox / 'plonk' / 'griffle.taz'.
	self assert: simpleExtension base equals: 'griffle'.
	self assert: simpleExtension extension equals: 'taz'.

	"Note that the extension of a complex extension starts after the last extension delimiter"
	complexExtension := sandbox / 'plonk' / 'griffle.taz.txt'.
	self assert: complexExtension base equals: 'griffle.taz'.
	self assert: complexExtension extension equals: 'txt'
]

{ #category : 'tests' }
FileReferenceTest >> testBasename [

	| alpha beta gamma |
	alpha := sandbox / 'alpha'.
	beta := alpha / 'beta'.
	gamma := alpha / 'gamma.delta'.
	self
		assert: sandbox basename
		equals: self sandboxName.
	self
		assert: beta basename
		equals: 'beta'.
	self
		assert: gamma basename
		equals: 'gamma.delta'
]

{ #category : 'other' }
FileReferenceTest >> testBasenameWithoutExtension [
	
	| alpha beta |
	alpha := sandbox / 'alpha'.
	beta := alpha / 'beta.gamma.delta'.
	self
		assert: alpha basenameWithoutExtension
		equals: 'alpha'.
	self
		assert: (alpha basenameWithoutExtension: 'alpha')
		equals: 'alpha'.
	self
		assert: (alpha basenameWithoutExtension: 'epsilon')
		equals: 'alpha'.
	self
		assert: beta basenameWithoutExtension
		equals: 'beta.gamma'.
	self
		assert: (beta basenameWithoutExtension: 'delta')
		equals: 'beta.gamma'.
	self
		assert: (beta basenameWithoutExtension: 'gamma.delta')
		equals: 'beta'.
	self
		assert: (beta basenameWithoutExtension: 'gamma')
		equals: 'beta.gamma.delta'.
	self
		assert: (beta basenameWithoutExtension: 'epsilon')
		equals: 'beta.gamma.delta'
]

{ #category : 'tests' }
FileReferenceTest >> testBinaryReadStream [

	| plonk absent directory |
	plonk := self createFile: 'plonk'.
	plonk binaryReadStream
		ifNil: [self assert: false]
		ifNotNil:
			[:stream |
			[self
				assert: stream contents
				equals: self defaultFileContents encodeAsUTF8 asByteArray]
					ensure: [stream close]].
	absent := sandbox / 'absent'.
	self
		should: [absent readStream]
		raise: FileDoesNotExistException.
	directory := self createDirectory: 'directory'.
	self
		should: [directory readStream]
		raise: FileRequired
]

{ #category : 'tests' }
FileReferenceTest >> testBinaryWriteStream [
	"See subclass implementations. Semantics differ to as this reflects Pharo."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testCanonicalization [

	| ref |

	ref := 'a/b/c' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'b' 'c').

	ref := '/a/b/c' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'b' 'c').

	ref := '../a/b/c' asFileReference canonicalize.
	self assert: ref path segments equals: #('..' 'a' 'b' 'c').

	ref := 'a/b/c/..' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'b').

	ref := '/a/b/c/..' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'b').

	ref := 'a/b/../c' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'c').

	ref := '/a/b/../c' asFileReference canonicalize.
	self assert: ref path segments equals: #('a' 'c').

]

{ #category : 'tests' }
FileReferenceTest >> testChangeTime [

	self
		assert: sandbox changeTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
FileReferenceTest >> testChildDirectories [

	| alpha beta gamma delta epsilon |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'beta'.
	gamma := self createFile: 'gamma'.
	delta := self createFile: 'delta'.

	"Ensure sending to a directory returns correct results."
	self
		assert: sandbox directories asSet
		equals: {alpha. beta.} asSet.
	
	"Ensure DirectoryDoesNotExist is signaled when the directory does not exist."
	epsilon := sandbox / 'epsilon'.
	self
		should: [epsilon children]
		raise: DirectoryDoesNotExist.

	"Ensure DirectoryRequired is signaled when sent to something that isn't a directory."
	self
		should: [gamma children]
		raise: DirectoryRequired
]

{ #category : 'tests' }
FileReferenceTest >> testChildFiles [

	| alpha beta gamma delta epsilon |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'beta'.
	gamma := self createFile: 'gamma'.
	delta := self createFile: 'delta'.

	"Ensure sending to a directory returns correct results."
	self
		assert: sandbox files asSet
		equals: {gamma. delta.} asSet.

	"Ensure DirectoryDoesNotExist is signaled when the directory does not exist."
	epsilon := sandbox / 'epsilon'.
	self
		should: [epsilon children]
		raise: DirectoryDoesNotExist.

	"Ensure DirectoryRequired is signaled when sent to something that isn't a directory."
	self
		should: [gamma children]
		raise: DirectoryRequired
]

{ #category : 'tests' }
FileReferenceTest >> testChildren [

	| alpha beta gamma epsilon |
	alpha := self createDirectory: 'alpha'.
	beta := self createFile: 'alpha/beta'.
	gamma := self createDirectory: 'alpha/gamma'.
	self createFile: 'alpha/gamma/delta'.

	"Ensure correct set of children is returned."
	self
		assert: alpha children asSet
		equals: { beta. gamma. } asSet.

	"Ensure DirectoryDoesNotExist is signaled when the directory does not exist."
	epsilon := sandbox / 'epsilon'.
	self
		should: [epsilon children]
		raise: DirectoryDoesNotExist.

	"Ensure DirectoryRequired is signaled when sent to something that isn't a directory."
	self
		should: [beta children]
		raise: DirectoryRequired
]

{ #category : 'tests' }
FileReferenceTest >> testCommaAddsExtension [

	| justName withExtension doubleExtension |
	justName := sandbox / 'just-name'.
	withExtension := justName , 'extension'.
	doubleExtension := withExtension , 'extension'.
	self
		assert: withExtension basename
		equals: 'just-name.extension'.
	self
		assert: doubleExtension basename
		equals: 'just-name.extension.extension'
]

{ #category : 'tests' }
FileReferenceTest >> testContains [

	| alpha beta secondFileSystem secondAlpha locator |
	alpha := self fileSystem root / 'alpha'.
	beta := alpha / 'beta'.
	self
		assert: (alpha contains: beta);
		assert: (alpha contains: beta path);
		deny: (beta contains: alpha);
		deny: (beta contains: alpha path).
	secondFileSystem := FileSystem store: MemoryStore new.
	secondAlpha := secondFileSystem root / 'alpha'.
	self
		deny: (secondAlpha contains: beta);
		assert: (secondAlpha contains: beta path).
	locator := FileLocator workingDirectory.
	self
		assert: (locator resolve parent contains: locator);
		deny: (alpha contains: locator)
]

{ #category : 'tests' }
FileReferenceTest >> testContainsLocator [
	| ref |
	ref := FileLocator workingDirectory resolve parent.
	self assert: (ref contains: FileLocator workingDirectory)
]

{ #category : 'tests' }
FileReferenceTest >> testContents [

	| contents file |
	contents := 'Hello, Smalltalk!'.
	file := self
		createFile: 'file'
		contents: contents.
	self
		assert: file contents
		equals: contents
]

{ #category : 'tests' }
FileReferenceTest >> testCopyAllTo [
	"Ensure #copyAllTo: results in mirroring of directories."

	| source destination |
	self 
		createDirectory: 'alpha';
		createDirectory: 'alpha/beta';
		createFile: 'alpha/theta';
		createFile: 'alpha/beta/gamma';
		createFile: 'alpha/beta/delta';
		createDirectory: 'alpha/epsilon';
		createFile: 'alpha/epsilon/zeta'.
	source := sandbox / 'alpha'.
	destination := sandbox / 'iota'.
	source copyAllTo: destination.
	self
		assert: source isDirectory;
		assert: destination isDirectory;
		assert: (destination / 'beta') isDirectory;
		assert: (destination / 'theta') isFile.
	self
		assert: source allChildren size
		equals: destination allChildren size
]

{ #category : 'tests' }
FileReferenceTest >> testCopyTo [

	| src dst |
	src := self
		createFile: 'testCopy-src-file'
		contents: 'This is a file used to test #copyTo:'.
	dst := src parent / 'testCopy-dst-file'.
	self
		assert: src exists;
		deny: dst exists.
	src copyTo: dst.
	self
		assert: src exists;
		assert: dst exists.
	self
		assert: (src binaryReadStreamDo: [:stream | stream contents])
		equals: (dst binaryReadStreamDo: [:stream | stream contents]).
	src delete.
	dst delete.
	src := self createDirectory: 'testCopy-src-directory'.
	dst := src parent / 'testCopy-dst-directory'.
	self
		assert: src exists;
		deny: dst exists.
	src copyTo: dst.
	self
		assert: src exists;
		assert: dst exists;
		assert: dst isDirectory
]

{ #category : 'tests' }
FileReferenceTest >> testCreationTime [
	"See subclass implementations if supported."

	self
		should: [sandbox creationTime]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testDelete [

	| file dir dirWithChildren |
	file := self
		createFile: 'testDelete-file'
		contents: 'testDelete file'.
	dir := self createDirectory: 'testDelete-directory'.
	dirWithChildren := self createDirectory: 'testDelete-directory-with-children'.
	self createDirectory: 'testDelete-directory-with-children/child'.
	self
		assert: file exists;
		assert: dir exists;
		deny: dir hasChildren;
		assert: dirWithChildren exists;
		assert: dirWithChildren hasChildren.
	file delete.
	self deny: file exists.
	dir delete.
	self deny: dir exists.
	self
		should: [dirWithChildren delete]
		raise: DirectoryIsNotEmpty.
]

{ #category : 'tests' }
FileReferenceTest >> testDeleteAll [
	"Ensure that #delteAll deletes all a folder and all of its transitive contents."

	| alpha beta delta gamma |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'alpha/beta'.
	delta := self createDirectory: 'alpha/beta/delta'.
	gamma := self createDirectory: 'alpha/gamma'.
	alpha deleteAll.
	self
		deny: alpha exists;
		deny: beta exists;
		deny: delta exists;
		deny: gamma exists
]

{ #category : 'tests' }
FileReferenceTest >> testDeleteAllChildren [
	"Ensure that #delteAllChildren deletes all of its transitive contents but not the folder itself."

	| alpha beta delta gamma |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'alpha/beta'.
	delta := self createDirectory: 'alpha/beta/delta'.
	gamma := self createDirectory: 'alpha/gamma'.
	alpha deleteAllChildren.
	self
		assert: alpha exists;
		deny: beta exists;
		deny: delta exists;
		deny: gamma exists
]

{ #category : 'tests' }
FileReferenceTest >> testDeleteIfAbsent [

	| wasAbsent alpha |
	wasAbsent := false.
	alpha := self createFile: 'alpha'.
	alpha deleteIfAbsent: [wasAbsent := true].
	self
		deny: wasAbsent;
		deny: alpha exists.
	alpha deleteIfAbsent: [wasAbsent := true].
	self assert: wasAbsent
]

{ #category : 'tests' }
FileReferenceTest >> testDeviceId [
	"See subclass implementations if supported."

	self
		should: [sandbox deviceId]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testDirectoryNames [

	| a b directoryNames |
	self
		assert: sandbox directoryNames size
		equals: 0.
	a := self createDirectory: 'a'.
	b := self createDirectory: 'b'.
	directoryNames := sandbox directoryNames.
	self
		assert: directoryNames size
		equals: 2.
	self
		assert: (directoryNames includes: 'a');
		assert: (directoryNames includes: 'b')
]

{ #category : 'tests' }
FileReferenceTest >> testEnsureDelete [

	| plonk |
	plonk := self createFile: 'plonk'.
	plonk ensureDelete.
	self deny: plonk exists.
	self
		shouldnt: [plonk ensureDelete]
		raise: Error
]

{ #category : 'tests' }
FileReferenceTest >> testEnsureDeleteAll [

	| parent child |
	parent := self createDirectory: 'parent'.
	child := self createFile: 'parent/child'.
	parent ensureDeleteAll.
	self
		deny: parent exists;
		deny: child exists.
	self
		shouldnt: [parent ensureDeleteAll]
		raise: Error
]

{ #category : 'tests' }
FileReferenceTest >> testEnsureDeleteNonEmptyDirectory [

	| parent child |
	parent := self createDirectory: 'parent'.
	child := self createFile: 'parent/child'.
	self
		should: [parent ensureDelete]
		raise: DirectoryIsNotEmpty
]

{ #category : 'tests' }
FileReferenceTest >> testEqual [

	| alpha alpha2 beta |
	alpha := sandbox / 'alpha'.
	alpha2 := sandbox / 'alpha'.
	beta := alpha / 'beta'.
	self
		deny: alpha
		identicalTo: alpha2.
	self
		assert: alpha
		equals: alpha2.
	self
		deny: alpha
		equals: beta
]

{ #category : 'tests' }
FileReferenceTest >> testEqualityRelativeVsAbsolute [

	| f1 f2 |

	f1 := FileLocator workingDirectory / 'pharo-local'.
	f2 := f1 asAbsolute.
	self assert: f1 equals: f2
]

{ #category : 'tests' }
FileReferenceTest >> testExists [

	| alpha |
	alpha := sandbox / 'alpha'.
	"Test file"
	self deny: alpha exists.
	alpha createFile.
	self assert: alpha exists.
	alpha delete.
	self deny: alpha exists.
	"Test directory"
	alpha createDirectory.
	self assert: alpha exists.
	alpha delete.
	self deny: alpha exists
]

{ #category : 'tests' }
FileReferenceTest >> testFileNames [

	| childA childB fileNames |
	self
		assert: sandbox fileNames size
		equals: 0.
	childA := self createFile: 'childA'.
	childB := self createFile: 'childB'.
	fileNames := sandbox fileNames.
	self
		assert: fileNames size
		equals: 2.
	self
		assert: (fileNames includes: 'childA');
		assert: (fileNames includes: 'childB')
]

{ #category : 'tests' }
FileReferenceTest >> testFileOpeningOptionsClass [
	"This test shoud be handled in a subclass"

	self subclassResponsibility
]

{ #category : 'tests' }
FileReferenceTest >> testFullName [

	| pathString ref |
	pathString := '/tmp/testFullName'.
	ref := self fileSystem referenceTo: pathString.
	self
		assert: ref fullName
		equals: pathString
]

{ #category : 'tests' }
FileReferenceTest >> testFullPath [

	| pathString expectedPath ref |
	pathString := '/tmp/testFullPath'.
	expectedPath := Path from: pathString.
	ref := self fileSystem referenceTo: pathString.
	self
		assert: ref fullPath
		equals: expectedPath
]

{ #category : 'tests' }
FileReferenceTest >> testGid [
	"See subclass implementations if supported."

	self
		should: [sandbox gid]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testHasChildren [

	| alpha beta delta gamma |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'alpha/beta'.
	delta := self createFile: 'alpha/beta/delta'.
	gamma := self createDirectory: 'alpha/gamma'.
	self
		assert: alpha hasChildren;
		assert: beta hasChildren;
		deny: delta hasChildren;
		deny: gamma hasChildren
]

{ #category : 'tests' }
FileReferenceTest >> testHasDirectories [

	| alpha beta delta gamma |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'alpha/beta'.
	delta := self createFile: 'alpha/beta/delta'.
	gamma := self createDirectory: 'alpha/gamma'.
	self
		assert: alpha hasDirectories;
		deny: beta hasDirectories;
		deny: delta hasChildren;
		deny: gamma hasChildren
]

{ #category : 'tests' }
FileReferenceTest >> testHasFiles [

	| alpha beta delta gamma |
	alpha := self createDirectory: 'alpha'.
	beta := self createDirectory: 'alpha/beta'.
	delta := self createFile: 'alpha/beta/delta'.
	gamma := self createDirectory: 'alpha/gamma'.
	self
		deny: alpha hasFiles;
		assert: beta hasFiles;
		deny: delta hasFiles;
		deny: gamma hasFiles
]

{ #category : 'tests' }
FileReferenceTest >> testHash [

	| refA refB |
	refA := sandbox / 'testHash'.
	refB := sandbox / 'testHash'.
	self
		assert: refA hash
		equals: refB hash
]

{ #category : 'tests' }
FileReferenceTest >> testIfExistsIfAbsent [

	| marker file result |
	marker := Object new.
	file := sandbox / 'ifExists-ifAbsent'.

	self deny: file exists.
	result := file ifAbsent: [marker].
	self
		assert: result
		equals: marker.
	result := file ifExists: [marker].
	self
		assert: result
		equals: file.
	result := file
		ifExists: [self assert: false]
		ifAbsent: [marker].
	self
		assert: result
		equals: marker.

	file createFile.
	self assert: file exists.
	result := file ifAbsent: [self assert: false].
	self
		assert: result
		equals: file.
	result := file ifExists: [marker].
	self
		assert: result
		equals: marker.
	result := file
		ifExists: [marker]
		ifAbsent: [self assert: false].
	self
		assert: result
		equals: marker
]

{ #category : 'tests' }
FileReferenceTest >> testIndicator [

	| referenceToNothing file |
	referenceToNothing := sandbox / 'do-not-create-this-file-or-you-will-break-tests'.
	file := self createFile: 'file'.
	self
		assert: sandbox indicator
		equals: '/'.
	self
		assert: referenceToNothing indicator
		equals: '?'.
	self
		assert: file indicator
		equals: ''
]

{ #category : 'tests' }
FileReferenceTest >> testInode [
	"See subclass implementations."

	self
		should: [sandbox inode]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testIsAbsolute [

	self
		assert: (sandbox / 'plonk') isAbsolute;
		deny: (self fileSystem referenceTo: '..') isAbsolute
]

{ #category : 'tests' }
FileReferenceTest >> testIsBlock [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsCharacter [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsChildOf [

	| alpha beta gamma alphaPath |
	alpha := sandbox / 'alpha'.
	beta := alpha / 'beta'.
	gamma := alpha / 'gamma'.
	alphaPath := alpha path.
	self
		assert: (alpha isChildOf: sandbox);
		deny: (alpha isChildOf: beta);
		assert: (beta isChildOf: alpha);
		deny: (beta isChildOf: sandbox);
		deny: (beta isChildOf: alphaPath);
		deny: (gamma isChildOf: beta);
		deny: (beta isChildOf: gamma)
]

{ #category : 'tests' }
FileReferenceTest >> testIsDirectory [

	| doesNotExist file |
	doesNotExist := sandbox / 'do-not-create-or-you-will-break-a-test'.
	file := self createFile: 'file'.
	self
		assert: self fileSystem root isDirectory;
		assert: sandbox isDirectory;
		deny: doesNotExist isDirectory;
		deny: file isDirectory
]

{ #category : 'tests' }
FileReferenceTest >> testIsExecutable [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsFifo [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsFile [

	| doesNotExist file |
	doesNotExist := sandbox / 'do-not-create-or-you-will-break-a-test'.
	file := self createFile: 'file'.
	self
		deny: self fileSystem root isFile;
		deny: sandbox isFile;
		deny: doesNotExist isFile;
		assert: file isFile
]

{ #category : 'tests' }
FileReferenceTest >> testIsReadable [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsRegular [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsRelative [

	self
		assert: (self fileSystem referenceTo: '..') isRelative;
		deny: (sandbox / 'plonk') isRelative
]

{ #category : 'tests' }
FileReferenceTest >> testIsRoot [

	self
		assert: self fileSystem root isRoot;
		deny: sandbox isRoot
]

{ #category : 'tests' }
FileReferenceTest >> testIsSocket [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testIsWritable [
	"See subclass implementations."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testMakeRelative [

	| parent child relative |
	parent := sandbox / 'griffle'.
	child := sandbox / 'griffle' / 'plonk' / 'nurb'.
	relative := parent makeRelative: child.
	self assert: relative equals: (Path * 'plonk' / 'nurb')
]

{ #category : 'tests' }
FileReferenceTest >> testModificationTime [

	self
		assert: sandbox modificationTime
		isKindOf: DateAndTime
]

{ #category : 'compatibility tests' }
FileReferenceTest >> testNumberOfHardLinks [
	"See subclass implementations"

	| file |
	file := self createFile: 'hard-links'.
	self
		should: [file numberOfHardLinks]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testParent [

	| root reference |
	root := self fileSystem root.
	reference := sandbox / 'target'.
	self
		assert: root parent
		equals: root.
	self
		assert: reference parent
		equals: sandbox
]

{ #category : 'tests' }
FileReferenceTest >> testParentUpTo [

	| a b c d |
	a := self createDirectory: 'a'.
	b := self createDirectory: 'a/b'.
	c := self createDirectory: 'a/b/c'.
	d := self createFile: 'a/b/c/d'.

	self
		assert: (d parentUpTo: 'a')
		equals: a.
	self
		assert: (b parentUpTo: 'b')
		equals: b.
	self
		assert: (c parentUpTo: 'd')
		equals: self fileSystem root.
]

{ #category : 'tests' }
FileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testPosition [

	| file binaryStream |
	file := self
		createFile: 'file-size-10'
		contents: '1234567890'.
	binaryStream := file binaryReadStream.
	[binaryStream position: 5.
	self assert: binaryStream next equals: $6 codePoint]
		ensure: [binaryStream close]
]

{ #category : 'tests' }
FileReferenceTest >> testPrintString [

	| ref expected |
	ref := FileReference
		fileSystem: self fileSystem
		path: Path / 'absolute' / 'path'.
	expected := 'FileReference ', self fsType, ' @ ''/absolute/path'''.
	self
		assert: ref printString
		equals: expected.

	ref := FileReference
		fileSystem: self fileSystem
		path: Path * 'relative' / 'path'.
	expected := 'FileReference ', self fsType, ' @ ''relative/path'''.
	self
		assert: ref printString
		equals: expected.
]

{ #category : 'tests' }
FileReferenceTest >> testReadStream [

	| plonk absent directory |
	plonk := self createFile: 'plonk'.
	plonk readStream
		ifNil: [self assert: false]
		ifNotNil:
			[:stream |
			[self
				assert: stream contents
				equals: self defaultFileContents]
					ensure: [stream close]].
	absent := sandbox / 'absent'.
	self
		should: [absent readStream]
		raise: FileDoesNotExistException.
	directory := self createDirectory: 'directory'.
	self
		should: [directory readStream]
		raise: FileRequired
]

{ #category : 'tests' }
FileReferenceTest >> testReadStreamDo [

	| plonk absent directory |
	plonk := self createFile: 'plonk'.
	plonk readStreamDo:
		[:stream |
		self
			assert: stream contents
			equals: self defaultFileContents].
	absent := sandbox / 'absent'.
	self
		should: [absent readStreamDo: [:stream |]]
		raise: FileDoesNotExistException.
	directory := self createDirectory: 'directory'.
	self
		should: [directory readStreamDo: [:stream |]]
		raise: FileRequired
]

{ #category : 'tests' }
FileReferenceTest >> testReadStreamDoIfAbsent [

	| plonk doesNotExist result |
	plonk := self createFile: 'plonk'.
	plonk
		readStreamDo:
			[:stream |
			self
				assert: stream contents
				equals: self defaultFileContents]
		ifAbsent: [self assert: false].
	doesNotExist := sandbox / 'does-not-exist'.
	result := doesNotExist
		readStreamDo: [:stream | self assert: false]
		ifAbsent: [#'test-pass-marker'].
	self
		assert: result
		equals: #'test-pass-marker'
]

{ #category : 'tests' }
FileReferenceTest >> testReadStreamIfAbsent [

	| plonk absent directory stream executed |
	plonk := self createFile: 'plonk'.
	stream := plonk readStreamIfAbsent: [self assert: false].
	[self
		assert: stream contents
		equals: self defaultFileContents]
			ensure: [stream close].

	absent := sandbox / 'absent'.
	executed := false.
	absent readStreamIfAbsent: [executed := true].
	self assert: executed.

	directory := self createDirectory: 'directory'.
	executed := false.
	directory readStreamIfAbsent: [executed := true].
	self assert: executed
]

{ #category : 'tests' }
FileReferenceTest >> testRelativeTo [

	| alpha beta |
	alpha := sandbox / 'alpha'.
	beta := alpha / 'beta'.
	self
		assert: (beta relativeTo: sandbox)
		equals: Path * 'alpha' / 'beta'.
	self
		assert: (beta relativeTo: sandbox path)
		equals: Path * 'alpha' / 'beta'.
	self
		assert: (alpha relativeTo: beta)
		equals: Path * '..'
]

{ #category : 'tests' }
FileReferenceTest >> testRename [

	| file alpha beta delta |
	file := self createFile: 'alpha'.
	alpha := sandbox / 'alpha'.
	beta := sandbox / 'beta'.
	delta := self createFile: 'delta'.

	"Valid rename"
	file renameTo: beta basename.
	self
		deny: alpha exists;
		assert: beta exists;
		assert: file exists.
	self
		assert: file basename
		equals: beta basename.

	"Rename to existing file"
	self
		should: [file renameTo: delta basename]
		raise: FileExists
]

{ #category : 'tests' }
FileReferenceTest >> testResolve [

	| targetReference absolutePath relativePath absoluteReference relativeReference |
	targetReference := sandbox / 'target'.
	self
		assert: targetReference resolve
		identicalTo: targetReference.
	absolutePath := targetReference absolutePath.
	self
		assert: (sandbox resolve: absolutePath)
		equals: targetReference.
	relativePath := Path * 'target'.
	self
		assert: (sandbox resolve: relativePath)
		equals: targetReference.
	absoluteReference := sandbox / 'target'.
	self
		assert: (sandbox resolve: absoluteReference)
		equals: targetReference.
	relativeReference := self fileSystem referenceTo: relativePath.
	self assert: relativeReference isRelative.
	self
		assert: (sandbox resolve: relativeReference)
		equals: targetReference
]

{ #category : 'tests' }
FileReferenceTest >> testSetAsWorkingDirectory [
	"See subclass implementations for supported filesystems"

	self
		should: [sandbox setAsWorkingDirectory]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testSize [

	| file0 file10 |
	file0 := self
		createFile: 'file-size-0'
		contents: ''.
	file10 := self
		createFile: 'file-size-10'
		contents: '1234567890'.
	self
		assert: file0 size
		equals: 0.
	self
		assert: file10 size
		equals: 10
]

{ #category : 'tests' }
FileReferenceTest >> testSlash [

	| alpha |
	alpha := sandbox / 'alpha'.
	self
		assert: alpha parent
		equals: sandbox.
	self
		assert: sandbox / ''
		equals: sandbox
]

{ #category : 'compatibility tests' }
FileReferenceTest >> testSymlinkTo [
	"Test creating symlinks."
	"Not all FileSystems support symlinks.
	By default we should ensure attempts to create
	symlinks signal an error."

	| target symlink |
	"Existing file"
	target := self
		createFile: 'testSymlinkTo-file'
		contents: 'this is a file'.
	symlink := sandbox / 'testSymlinkTo-file-symlink'.
	self
		should: [symlink symlinkTo: target]
		raise: Error.

	"Existing directory"
	target := self createDirectory: 'testSymlinkTo-directory'.
	symlink := sandbox / 'testSymlinkTo-directory-symlink'.
	self
		should: [symlink symlinkTo: target]
		raise: Error.

	"Target which does not exist."
	target := sandbox / 'creating' / 'this' / 'will' / 'break' / 'testSymlinkTo'.
	symlink := sandbox / 'dne-symlink'.
	self
		should: [symlink symlinkTo: target]
		raise: Error.

	"Ensure an appropropriate error if the symlink location has already exists."
	target := self
		createFile: 'testSymlinkTo-symlink-reference-already-exists'
		contents: 'The symlink reference will already exist'.
	symlink := self
		createFile: 'testSymlinkTo-symlink'
		contents: 'This is already a file.'.
	self
		should: [symlink symlinkTo: target]
		raise: Error
]

{ #category : 'compatibility tests' }
FileReferenceTest >> testTargetPath [
	"See subclass implementations"

	| file |
	file := self createFile: 'target-path'.
	self
		should: [file targetPath]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testTempFilePrefixSuffix [
	| fileRef |
	fileRef := FileReference newTempFilePrefix: 'FileReference' suffix: 'Test'.
	self assert: (fileRef isKindOf: FileReference).
	self assert: fileRef exists not.
]

{ #category : 'tests' }
FileReferenceTest >> testUid [
	"See subclass implementations if supported."

	self
		should: [sandbox uid]
		raise: FileAttributeNotSupported
]

{ #category : 'tests' }
FileReferenceTest >> testUnicodeFilenames [
	"Test various unicode file names"

	| names |
	names := {
		'file'.
		(Character codePoint: 16r263A) asString.
		(Character codePoint: 16r1F600) asString.
	}.
	String isInUnicodeComparisonMode
		ifTrue:
			[names
				add: 'file' asUnicodeString;
				add: (Character codePoint: 16r263A) asUnicodeString;
				add: (Character codePoint: 16r1F600) asUnicodeString].
	names
		do:
			[:name | | ref |
			ref := self
				createFile: name
				contents: name.
			self
				assert: ref exists;
				assert: (sandbox files includes: ref).
			self
				assert: ref basename
				equals: name.
			self
				assert: ref contents
				equals: name.
			ref delete]
]

{ #category : 'tests' }
FileReferenceTest >> testUpToAll [

	| testString fileRef |
	testString := 'ße'.
	fileRef := FileReference newTempFilePrefix: 'FileReference' suffix: 'Test'.
	[fileRef
		writeStreamEncoded: 'utf8'
		do: [:stream | stream nextPutAll: testString].
	fileRef readStreamDo: [:stream | self assert: (stream upToAll: 'e') equals: 'ß']]
		ensure: [fileRef ensureDelete]
]

{ #category : 'tests' }
FileReferenceTest >> testWithExtension [

	| name withExtension replacedExtension |
	name := sandbox / 'name'.
	withExtension := name withExtension: 'extension'.
	replacedExtension := withExtension withExtension: 'replaced'.
	self
		assert: withExtension
		equals: sandbox / 'name.extension'.
	self
		assert: replacedExtension
		equals: sandbox / 'name.replaced'
]

{ #category : 'tests' }
FileReferenceTest >> testWithoutExtension [

	| reference |
	reference := sandbox / 'alpha.beta.gamma'.
	reference := reference withoutExtension.
	self
		assert: reference
		equals: sandbox / 'alpha.beta'.
	reference := reference withoutExtension.
	self
		assert: reference
		equals: sandbox / 'alpha'.
	reference := reference withoutExtension.
	self
		assert: reference
		equals: sandbox / 'alpha'
]

{ #category : 'tests' }
FileReferenceTest >> testWorkingDirectoryParent [

	| wd  parent |
	wd := self fileSystem referenceTo: Path workingDirectory.
	parent := wd parent.
	self
		assert: parent
		equals: (self fileSystem referenceTo: Path * '..')
]

{ #category : 'tests' }
FileReferenceTest >> testWriteStream [
	"See subclass implementations. Semantics differ between Disk and Memory variants in Pharo."

	self assert: false
]

{ #category : 'tests' }
FileReferenceTest >> testWriteStreamDo [

	| file directory |
	file := sandbox / 'file'.
	directory := self createDirectory: 'directory'.

	"Ensure file is created by #writeStreamDo:."
	file writeStreamDo: [:stream | stream nextPutAll: 'abcdef'].
	self assert: file isFile.
	self
		assert: file contents
		equals: 'abcdef'.

	"Ensure #writeStreamDo: send to a directory raises an exception."
	self
		should: [directory writeStreamDo: [:stream | ]]
		raise: FileRequired
]

{ #category : 'tests' }
FileReferenceTest >> testWriteStreamTruncate [
	"Ensure truncating a stream removes all contents."

	| file |
	file := self
		createFile: '', self class name, '>>#testTruncatedStream'
		contents: ''.
	file writeStreamDo: [:stream | stream truncate].
	self
		assert: file contents
		equals: ''.
	file writeStreamDo: [:stream | stream nextPutAll: 'hello'; flush; truncate].
	self
		assert: file contents
		equals: ''
]
