"
Part of FileSystem

=========

SUnit test for FileLocator
"
Class {
	#name : 'FileLocatorTest',
	#superclass : 'FsTestCase',
	#instVars : [
		'locator'
	],
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'asserting' }
FileLocatorTest >> assert: anObject
isKindOf: aClass [

	^self assert: (anObject isKindOf: aClass)
]

{ #category : 'accessing' }
FileLocatorTest >> exampleLocator [

	| example |
	example := FileLocator temp.
	self
		assert: example
		isKindOf: FileLocator.
	^example
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testAsAbsolute [
	locator := FileLocator workingDirectory.
	self assert: locator asAbsolute = locator
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testBasename [
	locator := FileLocator workingDirectory / 'griffle'.
	self assert: locator basename = 'griffle'
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testCommaAddsExtension [
	locator := FileLocator workingDirectory / 'griffle'.
	self assert: (locator , 'plonk') basename = 'griffle.plonk'
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testCommaAddsExtensionAgain [
	locator := FileLocator workingDirectory / 'griffle.plonk'.
	self assert: (locator , 'nurp') basename = 'griffle.plonk.nurp'
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testContainsLocator [
	locator := FileLocator workingDirectory.
	self assert: (locator contains: locator / 'griffle').
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testContainsPath [
	
	locator := FileLocator workingDirectory.
	self assert: (locator contains: (locator resolve / 'griffle') path).
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testContainsReference [
	locator := FileLocator workingDirectory.
	self assert: (locator contains: (locator resolve / 'griffle')).
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testDeviceId [

	self
		assert: self exampleLocator deviceId
		isKindOf: Integer
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testEqual [
	| a b |
	a := FileLocator workingDirectory.
	b := FileLocator workingDirectory.
	self deny: a == b.
	self assert: a = b.
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testExtension [
	locator := FileLocator extent1Directory, 'bak'.
	self assert: (locator basename endsWith: '.bak')
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testFileSystem [
	locator := FileLocator workingDirectory.
	self assert: (locator fileSystem isKindOf: FileSystem)
]

{ #category : 'resolution tests' }
FileLocatorTest >> testFromPathIfNone [

	| marker path |
	marker := Object new.
	path := '/foo' asPath.	
	locator := FileLocator fromPath: path ifNone: [marker].
	self
		assert: locator
		equals: marker.
	path := FileLocator temp resolve asPath.
	locator := FileLocator fromPath: path ifNone: [marker].
	self
		assert: locator
		equals: FileLocator temp
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testGid [

	self
		assert: self exampleLocator gid
		isKindOf: Integer
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testIfExistsIfAbsent [

	| marker file result |
	marker := Object new.
	file := FileLocator temp / 'ifExists-ifAbsent'.
	file ensureDelete.

	[self deny: file exists.
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
		equals: marker]
	ensure: [file ensureDelete]
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testInode [

	| temp |
	temp := FileLocator temp.
	self
		assert: temp inode
		isKindOf: Integer
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testIsAbsolute [
	locator := FileLocator root.
	self assert: locator isAbsolute
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testIsNotRoot [
	locator := FileLocator workingDirectory.
	self deny: locator isRoot
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testIsRelative [
	locator := FileLocator root.
	self deny: locator isRelative
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testIsRoot [

	self deny: FileLocator workingDirectory isRoot.
	self assert: FileLocator root isRoot.

	locator := FileLocator workingDirectory asAbsolute.
	(locator resolve path size) timesRepeat: [locator := locator / '..'].
	self assert: locator canonicalize isRoot.
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testMoveTo [
	| old new |
	[
		old := FileLocator temp / 'testMoveTo_old'.
		old ensureCreateFile.
		
		new := FileLocator temp / 'testMoveTo_new'.
		old moveTo: new.
		
		self deny: old exists.
		self assert: new exists.
	] ensure: [ 
		old ensureDelete.
		new ensureDelete.
	]
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testNumberOfHardLinks [

	| temp |
	temp := FileLocator temp.
	self assert: temp numberOfHardLinks > 0
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testOriginBasename [
	locator := FileLocator temp.
	self assert: locator basename = FileLocator temp resolve basename
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testParent [
	locator := FileLocator extent1.
	self assert: locator parent resolve = FileLocator extent1Directory resolve
]

{ #category : 'resolution tests' }
FileLocatorTest >> testResolveAbsoluteReference [
	| result reference |
	locator := FileLocator workingDirectory / 'plonk'.
	reference := FileSystem memory / 'griffle'.
	result := locator resolve: reference.
	self assert: result == reference
]

{ #category : 'resolution tests' }
FileLocatorTest >> testResolveCompoundString [
	| result compound |
	locator := FileLocator temp / 'plonk'.
	compound := 'griffle', locator fileSystem delimiter asString, 'nurp'.
	result := locator resolve: compound.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = ((Path * 'plonk') / 'griffle' / 'nurp')
]

{ #category : 'resolution tests' }
FileLocatorTest >> testResolvePath [
	| result path |
	locator := FileLocator temp / 'plonk'.
	result := locator resolve: (Path * 'griffle').
	path := (Path * 'plonk') / 'griffle'.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = path.
]

{ #category : 'resolution tests' }
FileLocatorTest >> testResolveRelativeReference [
	| result reference |
	locator := FileLocator temp / 'plonk'.
	reference := FileSystem memory * 'griffle'.
	result := locator resolve: reference.
	self assert: result class equals: locator class.
	self assert: result origin equals: locator origin.
	self assert: result path equals: reference path
]

{ #category : 'resolution tests' }
FileLocatorTest >> testResolveString [
	| result path |
	locator := FileLocator temp / 'plonk'.
	result := locator resolve: 'griffle'.
	path := (Path * 'plonk') / 'griffle'.
	self assert: result class = locator class.
	self assert: result origin = locator origin.
	self assert: result path = path.
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testSlash [
	locator := FileLocator temp / 'griffle'.
	self assert: locator = (FileLocator temp / 'griffle')
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testTargetPath [

	self
		should: [FileLocator temp targetPath]
		raise: FileAttributeNotSupported
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testUid [

	self
		assert: self exampleLocator uid
		isKindOf: Integer
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testWithExtensionAddsExtension [
	locator := FileLocator temp / 'griffle'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'
]

{ #category : 'compatibility tests' }
FileLocatorTest >> testWithExtensionReplacesExtension [
	locator := FileLocator temp / 'griffle.nurp'.
	self assert: (locator withExtension: 'plonk') basename = 'griffle.plonk'
]
