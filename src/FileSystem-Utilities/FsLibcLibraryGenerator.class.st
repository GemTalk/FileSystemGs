"
FsLibraryGenerator is based upon the standard GemStone library generator function. The generated code is based on the default library generation patterns in GemStone. Instead of storing initialized functions in Class Variables, it stores them in instance variables which are initialized when an instance is created.

Usage:
| tonel |
tonel := FsLibcLibraryGenerator new
	name: 'stat';
	header: (CHeader path: '/usr/include/sys/stat.h');
	path: 'libc.so.6';
	platform: 'linux';
	generate.
"
Class {
	#name : 'FsLibcLibraryGenerator',
	#superclass : 'Object',
	#instVars : [
		'name',
		'header',
		'path',
		'platform'
	],
	#category : 'FileSystem-Utilities'
}

{ #category : 'accessing' }
FsLibcLibraryGenerator >> functionInstVarNames [

	^self functions collect: [:each | self functionNameFor: each]
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> functionNameFor: aCFunction [

	^'Function_', aCFunction name
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> functions [

	^self header functions sort: [:a :b | a name <= b name]
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> generate [

	^String
		new: 1024
		streamContents:
			[:stream |
			self generateClassOnto: stream.
			stream lf; lf.
			self generateMethodsOnto: stream]
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> generateClassOnto: aStream [

	aStream
		nextPutAll: 'Class {'; lf;
		tab; nextPutAll: '#name : '''; nextPutAll: self libraryClassName; nextPutAll: ''','; lf;
		tab; nextPutAll: '#superclass : ''_libc_'; nextPutAll: self name; nextPutAll: ''',';lf;
		tab; nextPutAll: '#instVars : ['; lf.
	self functionInstVarNames
		do: [:varName | aStream tab; tab; nextPutAll: ''''; nextPutAll: varName; nextPutAll: '''']
		separatedBy: [aStream nextPutAll: ','; lf].
	aStream
		lf;
		tab; nextPutAll: '],'; lf;
		tab; nextPutAll: '#category : ''LibC''';
		lf; nextPutAll: '}'
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> generateInitializerOnto: aStream [

	aStream
		nextPutAll: '{ #category : ''initialization'' }'; lf;
		nextPutAll: self libraryClassName; nextPutAll: ' >> initialize ['; lf; lf;
		tab; nextPutAll: '| cLibrary |'; lf;
		tab; nextPutAll: 'cLibrary := CLibrary named: '; print: self path; nextPutAll: '.'; lf.
	self functions
		do: [:function | self initializeFunction: function onto: aStream]
		separatedBy: [aStream lf].
	aStream
		lf;
		nextPutAll: ']'
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> generateInterfaceMethodFor: function
onto: aStream [

	| varName |
	varName := self functionNameFor: function.
	aStream
		nextPutAll: '{ #category : ''Functions'' }'; lf;
		nextPutAll: self libraryClassName; nextPutAll: ' >> '; nextPutAll: function name; nextPutAll: ': args errno: errnoHolder ['; lf;
		tab; nextPutAll: '"Interpreted as '; print: function resultType; nextPutAll: ' from #('.
	function parameters
		do: [:each | aStream print: each argumentType]
		separatedBy: [aStream nextPutAll: ' '].
	aStream
		nextPutAll: ')"'; lf; lf;
		tab; nextPutAll: '^'; nextPutAll: varName; lf;
		tab; tab; nextPutAll: 'callWith: args'; lf;
		tab; tab; nextPutAll: 'errno: errnoHolder'; lf;
		nextPutAll: ']'
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> generateMethodsOnto: aStream [

	self generateInitializerOnto: aStream.
	aStream lf; lf.
	self functions
		do: [:function | self generateInterfaceMethodFor: function onto: aStream]
		separatedBy: [aStream lf; lf]
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> header [

	^header
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> header: aCHeader [

	header := aCHeader
]

{ #category : 'generating' }
FsLibcLibraryGenerator >> initializeFunction: function
onto: aStream [

	| varName |
	varName := self functionNameFor: function.
	aStream
		tab; nextPutAll: varName; nextPutAll: ' := CCallout'; lf;
		tab; tab; nextPutAll: 'library: cLibrary'; lf;
		tab; tab; nextPutAll: 'name: '''; nextPutAll: function name; nextPutAll: ''''; lf;
		tab; tab; nextPutAll: 'result: '; print: function resultType; lf;
		tab; tab; nextPutAll: 'args: #('.
	function parameters
		do: [:each | aStream print: each argumentType]
		separatedBy: [aStream nextPutAll: ' '].
	aStream
		nextPutAll: ')'; lf;
		tab; tab; nextPutAll: 'varArgsAfter: '; print: function varArgsAfter; nextPutAll: '.'
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> libraryClassName [

	^'_libc_', self name, '_', self platform
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> name [

	^name
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> name: aString [

	name := aString
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> path [

	^path
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> path: aPathString [

	path := aPathString
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> platform [

	^platform
]

{ #category : 'accessing' }
FsLibcLibraryGenerator >> platform: aString [

	platform := aString
]