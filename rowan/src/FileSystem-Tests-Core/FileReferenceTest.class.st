"
SUnit tests for file reference.

This test case assumes that #tearDown will appropriately cleanup the sandbox directory. Files placed anywhere else should be cleaned up by the test itself.
"
Class {
	#name : 'FileReferenceTest',
	#superclass : 'TestCase',
	#type : 'variable',
	#instVars : [
		'filesystem',
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

{ #category : 'tests' }
FileReferenceTest >> testAllChildren [
	"allChildren returns all the files and folders recursively nested in a reference"

	| alpha children |
	[alpha := self createDirectory: 'alpha'.
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
		equals: #('alpha' 'beta' 'gamma' 'delta') asSet]
		ensure: [ (filesystem / 'alpha') ensureDeleteAll ]
]

{ #category : 'tests' }
FileReferenceTest >> testAllDirectories [
	"allDirectories returns all folders recursively nested in a reference"

	| alpha children |
	[alpha := self createDirectory: 'alpha'.
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
		equals: #('alpha' 'beta' 'gamma' 'delta') asSet ]
		ensure: [ (filesystem / 'alpha') ensureDeleteAll ]
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
	| ref |
	ref := filesystem root.
	self assert: ref basename equals: '/'.
	ref := filesystem * 'plonk' / 'griffle'.
	self assert: ref basename equals: 'griffle'.
	ref := filesystem * 'plonk' / 'griffle.taz'.
	self assert: ref basename equals: 'griffle.taz'
]

{ #category : 'tests' }
FileReferenceTest >> testBasenameWithoutExtension [
	
	| ref |	
	ref := filesystem root.
	self assert: ref basename equals: '/'.
	
	ref := filesystem * 'plonk' / 'griffle'.
	self assert: ref basenameWithoutExtension equals: 'griffle'.
	self assert: (ref basenameWithoutExtension: 'griffle') equals: 'griffle'.
	self assert: (ref basenameWithoutExtension: 'taz') equals: 'griffle'.
	
	ref := filesystem * 'plonk' / 'griffle.taz'.
	self assert: ref basenameWithoutExtension equals: 'griffle'.
	self assert: (ref basenameWithoutExtension: 'taz') equals: 'griffle'.
	self assert: (ref basenameWithoutExtension: 'griffle.taz') equals: 'griffle.taz'.
	self assert: (ref basenameWithoutExtension: 'zork') equals: 'griffle.taz'.
	
	ref := filesystem * 'plonk' / 'griffle.taz.zork'.
	self assert: ref basenameWithoutExtension equals: 'griffle.taz'.
	self assert: (ref basenameWithoutExtension: 'zork') equals: 'griffle.taz'.
	self assert: (ref basenameWithoutExtension: 'taz.zork') equals: 'griffle'.
	self assert: (ref basenameWithoutExtension: 'griffle.taz.zork') equals: 'griffle.taz.zork'.
	self assert: (ref basenameWithoutExtension: 'taz') equals: 'griffle.taz.zork'.
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
FileReferenceTest >> testChildDirectories [

	| directories beta gamma delta epsilon |
	[beta := self createDirectory: 'beta'.
	gamma := self createDirectory: 'gamma'.
	delta := self createFile: 'delta'.
	epsilon := self createFile: 'epsilon'.
	directories := sandbox directories.
	self
		assert: directories size
		equals: 2.
	directories
		do: [ :each | 
			self
				assert: each class
				equals: FileReference.
			self
				assert: each isDirectory
				description: 'Collection should only contain references to directories.' ] ]
		ensure:
			[beta ensureDeleteAll.
			gamma ensureDeleteAll.
			delta ensureDelete.
			epsilon ensureDelete]
]

{ #category : 'tests' }
FileReferenceTest >> testChildFiles [

	| files beta gamma delta epsilon |
	[beta := self createDirectory: 'beta'.
	gamma := self createDirectory: 'gamma'.
	delta := self createFile: 'delta'.
	epsilon := self createFile: 'epsilon'.
	files := sandbox files.
	self
		assert: files size
		equals: 2.
	files
		do: [ :each | 
			self
				assert: each class
				equals: FileReference.
			self
				assert: each isFile
				description: 'Collection should only contain references to files.' ] ]
		ensure:
			[beta ensureDeleteAll.
			gamma ensureDeleteAll.
			delta ensureDelete.
			epsilon ensureDelete]
]

{ #category : 'tests' }
FileReferenceTest >> testChildOfPath [
	| parent  child |
	parent := Path / 'griffle'.
	child := filesystem / 'griffle' / 'nurb'.
	self deny: (child isChildOf: parent).
	self deny: (parent isChildOf: child).
]

{ #category : 'tests' }
FileReferenceTest >> testChildOfReference [
	| parent  child |
	parent := filesystem / 'griffle'.
	child := filesystem / 'griffle' / 'nurb'.
	self assert: (child isChildOf: parent).
	self deny: (parent isChildOf: child).
]

{ #category : 'tests' }
FileReferenceTest >> testChildren [

	| alpha children |
	alpha := self createDirectory: 'alpha'.
	self
		createFile: 'alpha/beta';
		createDirectory: 'alpha/gamma';
		createFile: 'alpha/gamma/delta'.
	children := alpha children.
	self assert: children size equals: 2.
	children
		do:
			[:child | 
			self assert: child class equals: FileReference.
			self assert: (child isChildOf: alpha).
			self assert: (#('beta' 'gamma') includes: child basename)]
]

{ #category : 'tests' }
FileReferenceTest >> testCommaAddsExtension [
	| ref result |
	ref := filesystem * 'plonk'.
	result := ref , 'griffle'.
	self assert: result basename equals: 'plonk.griffle'
]

{ #category : 'tests' }
FileReferenceTest >> testCommaAddsExtensionAgain [
	| ref result |
	ref := filesystem * 'plonk.griffle'.
	result := ref , 'nurp'.
	self assert: result basename equals: 'plonk.griffle.nurp'
]

{ #category : 'tests' }
FileReferenceTest >> testContainsLocator [
	| ref |
	ref := FileLocator imageDirectory resolve parent.
	self assert: (ref contains: FileLocator image)
]

{ #category : 'tests' }
FileReferenceTest >> testContainsPath [
	| ref |
	ref := filesystem  * 'griffle'.
	self assert: (ref contains: (ref / 'nurp') path)
]

{ #category : 'tests' }
FileReferenceTest >> testContainsReference [
	| ref |
	ref := filesystem * 'griffle'.
	self assert: (ref contains: ref / 'nurp')
]

{ #category : 'tests' }
FileReferenceTest >> testContents [
	| ref contents |
	contents := '12345 abcdf!'.
	ref := filesystem * 'file'.
	[ ref writeStreamDo: [ :stream | stream nextPutAll: contents ].
	self assert: ref contents asString equals: contents ]
		ensure: [ ref ensureDelete ]
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
FileReferenceTest >> testDoesContainReferenceFileSystem [
	| ref other |
	ref := filesystem * 'griffle'.
	other := filesystem / 'griffle' / 'nurp'.
	self assert: (ref contains: other)
]

{ #category : 'tests' }
FileReferenceTest >> testDoesNotContainReferenceWhenUsingDifferentInstancesOfMemoryFileSystem [
	| ref other |
	ref := filesystem * 'griffle'.
	other := FileSystem memory / 'griffle' / 'nurp'.
	self deny: (ref contains: other)
]

{ #category : 'tests' }
FileReferenceTest >> testDoesntContainLocator [
	| ref |
	ref := filesystem * 'griffle'. 
	self deny: (ref contains: FileLocator image)
]

{ #category : 'tests' }
FileReferenceTest >> testDoesntContainPath [
	| ref |
	ref := filesystem * 'griffle'.
	self deny: (ref contains: (Path * 'nurp'))
]

{ #category : 'tests' }
FileReferenceTest >> testDoesntContainReferencePath [
	| ref other |
	ref := filesystem * 'griffle'.
	other := filesystem * 'nurp'.
	self deny: (ref contains: other)
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
	| a b |
	a := filesystem * 'plonk'.
	b := filesystem * 'plonk'.
	self deny: a == b.
	self assert: a equals: b
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
FileReferenceTest >> testGrandchildOfReference [
	| griffle  nurb |
	griffle := filesystem / 'griffle'.
	nurb := filesystem / 'griffle' / 'plonk' / 'nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).
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
FileReferenceTest >> testIndicator [
	| ref |
	ref := filesystem * 'plonk' / 'griffle'.
	self deny: ref exists.
	self assert: ref indicator equals: '?'.
	ref := filesystem workingDirectory / 'plonk'.
	self deny: ref exists.
	ref createDirectory.
	[ self assert: ref exists.
	self assert: ref isDirectory.
	self assert: ref indicator equals: '/' ]
		ensure: [ ref delete ].
	ref := filesystem workingDirectory / 'plonk'.
	self deny: ref exists.
	[ref writeStreamDo: [ :stream | stream nextPutAll: 'foo' ].
	self assert: ref exists.
	self assert: ref isFile.
	self assert: ref indicator equals: '' ]
		ensure: [ ref delete ]
]

{ #category : 'tests' }
FileReferenceTest >> testIsAbsolute [
	self assert: (filesystem / 'plonk') isAbsolute
]

{ #category : 'tests' }
FileReferenceTest >> testIsNotAbsolute [
	self deny: (filesystem * 'plonk') isAbsolute
]

{ #category : 'tests' }
FileReferenceTest >> testIsNotRelative [
	self deny: (filesystem / 'plonk') isRelative
]

{ #category : 'tests' }
FileReferenceTest >> testIsNotRoot [
	self deny: (filesystem / 'plonk') isRoot
]

{ #category : 'tests' }
FileReferenceTest >> testIsRelative [
	self assert: (filesystem * 'plonk') isRelative
]

{ #category : 'tests' }
FileReferenceTest >> testIsRoot [
	self assert: (filesystem root) isRoot
]

{ #category : 'tests' }
FileReferenceTest >> testMakeRelative [

	| parent child relative |
	parent := filesystem / 'griffle'.
	child := filesystem / 'griffle' / 'plonk' / 'nurb'.
	relative := parent makeRelative: child.
	self assert: relative equals: (Path * 'plonk' / 'nurb')
]

{ #category : 'tests' }
FileReferenceTest >> testParent [
	| ref parent |
	ref := filesystem * 'plonk' / 'griffle'.
	parent := ref parent.
	self assert: parent class = ref class.
	self assert: (parent path at: 1) = 'plonk'
]

{ #category : 'tests' }
FileReferenceTest >> testParentResolutionWithAbsoluteReference [
	| base relative absolute |
	base := filesystem / '/plonk' / 'pinto'.
	relative := filesystem / 'griffle' / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute fileSystem == relative fileSystem.
	self assert: absolute isAbsolute.
	self assert: (absolute path at: 1) equals: 'griffle'.
	self assert: (absolute path at: 2) equals: 'zonk'
]

{ #category : 'tests' }
FileReferenceTest >> testParentResolutionWithPath [
	| base relative absolute |
	base := filesystem / 'plonk' / 'pinto'.
	relative := Path parent / 'griffle' / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: absolute path segments equals: #('plonk' 'pinto' '..' 'griffle' 'zonk').
	
]

{ #category : 'tests' }
FileReferenceTest >> testParentResolutionWithReference [
	| base relative absolute |
	base := (filesystem / 'plonk' / 'pinto').
	relative := (filesystem referenceTo: '../griffle/zonk').
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: absolute path segments equals: #('plonk' 'pinto' '..' 'griffle' 'zonk').
	
	
]

{ #category : 'tests' }
FileReferenceTest >> testParentResolutionWithRemoteReference [
	| base relative absolute |
	base := filesystem / 'plonk' / 'pinto'.
	relative := filesystem referenceTo: '../griffle/zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: absolute path segments equals: #('plonk' 'pinto' '..' 'griffle' 'zonk')
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
		equals: filesystem root.
]

{ #category : 'tests' }
FileReferenceTest >> testPathRelativeTo [
	| parent childPath relative |
	parent := filesystem / 'griffle'.
	childPath := Path / 'griffle' / 'plonk' / 'nurb'.
	relative := childPath relativeTo: parent.
	self assert: relative = (Path * 'plonk' / 'nurb')
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
		raise: FileDoesNotExistException
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
		raise: FileDoesNotExistException
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

{ #category : 'tests stream' }
FileReferenceTest >> testReadStreamDoNotFound [
	| ref |
	ref := filesystem / 'plonk'.
	self
		should: [ref readStreamDo: [:s|]]
		raise: FileDoesNotExistException
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
FileReferenceTest >> testRelativeToPath [
	| parentPath child relative |
	parentPath := Path / 'griffle'.
	child := filesystem / 'griffle' / 'plonk' / 'nurb'.
	relative := child relativeTo: parentPath.
	self assert: relative = (Path * 'plonk' / 'nurb')
]

{ #category : 'tests' }
FileReferenceTest >> testRelativeToReference [
	| parent child relative |
	parent := filesystem / 'griffle'.
	child := filesystem  / 'griffle' / 'plonk' / 'nurb'.
	relative := child relativeTo: parent.
	self assert: relative = (Path * 'plonk' / 'nurb')
]

{ #category : 'tests' }
FileReferenceTest >> testRename [
	| file tmp originalFullName |
	[ file := (FileLocator imageDirectory / 'oldName') ensureCreateFile.
	originalFullName := file fullName.
	tmp := (FileLocator imageDirectory / 'tmp') ensureCreateDirectory.
	file renameTo: 'newName'.
	self deny: originalFullName asFileReference exists.
	self assert: file basename equals: 'newName'.
	self assert: (originalFullName asFileReference parent / 'newName') exists ]
		ensure: [ file delete.
			tmp deleteAll ]
]

{ #category : 'tests' }
FileReferenceTest >> testRenameTargetExists [

	| existingFile fileToRename |
	[
"		existingFile := 'existingFile' asFileReference ensureCreateFile.
		fileToRename := 'fileToRename' asFileReference ensureCreateFile."
		existingFile := (FileSystem disk referenceTo: 'existingFile') ensureCreateFile.
		fileToRename := (FileSystem disk referenceTo: 'fileToRename') ensureCreateFile.
		self should: [ fileToRename renameTo: existingFile basename ] raise: FileExists ]
		ensure: [
			existingFile delete.
			fileToRename delete ].
]

{ #category : 'tests' }
FileReferenceTest >> testResolve [
	| ref |
	ref := filesystem / 'griffle'.
	self assert: ref resolve == ref
]

{ #category : 'tests' }
FileReferenceTest >> testRootIsDirectory [

	self assert: (filesystem root) isDirectory
]

{ #category : 'tests' }
FileReferenceTest >> testRootParent [
	| root |
	root := filesystem root.
	self assert: root parent == root
]

{ #category : 'tests' }
FileReferenceTest >> testSiblingOfReference [
	| griffle  nurb |
	griffle := filesystem / 'griffle'.
	nurb := filesystem / 'nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).
]

{ #category : 'tests' }
FileReferenceTest >> testSimpleResolution [
	| base relative absolute |
	base := filesystem / 'plonk'.
	relative := (Path * 'griffle') / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: (absolute path at: 1) = 'plonk'.
	self assert: (absolute path at: 2) = 'griffle'.
	self assert: (absolute path at: 3) = 'zonk'.
	
	
]

{ #category : 'tests' }
FileReferenceTest >> testSlash [
	| ref result |
	ref := filesystem * 'plonk'.
	result := ref / 'griffle'.
	self assert: result class = ref class.
	self assert: result  isRelative.
	self assert: (result path at: 1) = 'plonk'.
	self assert: (result path at: 2) = 'griffle'.

]

{ #category : 'tests' }
FileReferenceTest >> testTempFilePrefixSuffix [
	| fileRef |
	fileRef := FileReference newTempFilePrefix: 'FileReference' suffix: 'Test'.
	self assert: (fileRef isKindOf: FileReference).
	self assert: fileRef exists not.
]

{ #category : 'tests' }
FileReferenceTest >> testUnequalContent [
	| a b |
	a := filesystem * 'plonk'.
	b := filesystem * 'griffle'.
	self deny: a = b.
]

{ #category : 'tests' }
FileReferenceTest >> testUnequalSize [
	| a b |
	a := filesystem * 'plonk'.
	b := filesystem / 'plonk' / 'griffle'.
	self deny: a = b.
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
FileReferenceTest >> testWithExtentionAddsExtension [
	| ref result |
	ref := filesystem * 'plonk'.
	result := ref withExtension: 'griffle'.
	self assert: result isRelative.
	self assert: result basename = 'plonk.griffle'
]

{ #category : 'tests' }
FileReferenceTest >> testWithExtentionReplacesExtension [
	| ref result |
	ref := filesystem * 'plonk.griffle'.
	result := ref withExtension: 'nurp'.
	self assert: result isRelative.
	self assert: result basename = 'plonk.nurp'
]

{ #category : 'tests' }
FileReferenceTest >> testWithoutExtension [
	| ref newRef |
	ref := filesystem * 'plonk' / 'griffle.txt'.
	newRef := ref withoutExtension.
	self assert: newRef parent equals: ref parent.
	self assert: newRef basename equals: 'griffle'
]

{ #category : 'tests' }
FileReferenceTest >> testWorkingDirectoryParent [
	| wd |
	wd := filesystem referenceTo: Path workingDirectory.
	self assert: wd parent path size = 1.
	self assert: (wd parent path at: 1) = '..'.
]

{ #category : 'tests' }
FileReferenceTest >> testWriteStream [

	| file directory stream |
	file := sandbox / 'file'.
	directory := self createDirectory: 'directory'.

	"Ensure file is created by #writeStream."
	stream := file writeStream.
	stream
		nextPutAll: 'abcdef';
		flush;
		close.
	self assert: file isFile.
	self
		assert: file contents
		equals: 'abcdef'.

	"Ensure #writeStream begins at start of file."
	"Should the following fails in against the memory file system.
	Should we ensure this behaves the same in all file systems?"
	"stream := file writeStream.
	stream
		nextPutAll: '123';
		flush;
		close.
	self
		assert: file contents
		equals: '123def'."

	"Ensure #writeStream send to a directory raises an exception."
	self
		should: [directory writeStream]
		raise: FileDoesNotExistException
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
		raise: FileDoesNotExistException
]
