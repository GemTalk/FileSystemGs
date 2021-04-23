"
FsLibraryGenerator is based upon the standard GemStone library generator function. The difference is that on the instance-side of the library, it generates a call which expects the arguments to already be in an array and exposes errno directly.

Usage:
| library |
library := FsLibraryGenerator new
	header: (CHeader path: '/usr/include/sys/stat.h');
	libraryPath: 'libc.so.6';
	generateInterfaceNamed: '_libcStat'.
UserGlobals at: library name put: library.
Rowan packageTools adopt
	adoptClass: library
	intoPackageNamed: 'LibC'
"
Class {
	#name : 'FsLibraryGenerator',
	#superclass : 'Object',
	#instVars : [
		'header',
		'libraryPath',
		'functionFilter'
	],
	#category : 'FileSystem-Utilities'
}

{ #category : 'instance creation' }
FsLibraryGenerator class >> new [

	^super new initialize
]

{ #category : 'generating' }
FsLibraryGenerator >> add: aCDeclaration
to: interface [

	interface addClassVarName: aCDeclaration asClassVarName.
	interface class
		compileMethod: aCDeclaration createFunctionInitializerCode
		dictionaries: GsCurrentSession currentSession symbolList
		category: 'Initializing - private'
		environmentId: 0.
	self
		generateFunctionInvocationFor: aCDeclaration
		in: interface
]

{ #category : 'accessing' }
FsLibraryGenerator >> functionFilter [

	^functionFilter
]

{ #category : 'accessing' }
FsLibraryGenerator >> functionFilter: aSelectionBlock [

	functionFilter := aSelectionBlock
]

{ #category : 'generating' }
FsLibraryGenerator >> generateFunctionInvocationFor: aCDeclaration
in: interface [

	| source |
	source := self generateInvokeFunctionFor: aCDeclaration.
	interface
		compileMethod: source
		dictionaries: SymbolList new
		category: 'Functions'
		environmentId: 0
]

{ #category : 'generating' }
FsLibraryGenerator >> generateFunctionsIn: interface [

	| functions |
	functions := self header functions select: self functionFilter.
	functions do: [:function | self add: function to: interface].
	self
		generateInitializerFor: functions
		in: interface
]

{ #category : 'generating' }
FsLibraryGenerator >> generateInitializerFor: functions
in: interface [

	| sourceStream |
	sourceStream := AppendStream on: String new.
	sourceStream
		nextPutAll: 'initializeFunctions'; lf; lf; tab;
		nextPutAll: '| library |'; lf; tab;
		nextPutAll: 'library := CLibrary named: ';
		print: self libraryPath;
		nextPut: $.; lf; tab;
		nextPutAll: 'self'; lf; tab; tab.
	functions
		do:
			[:function |
			sourceStream
				nextPutAll: function initializerFunctionName;
				nextPutAll: ' library;'; lf; tab; tab].
	sourceStream
		nextPutAll: 'yourself'.
	interface class
		compileMethod: sourceStream contents
		dictionaries: GsCurrentSession currentSession symbolList
		category: 'Initializing - private'
		environmentId: 0
]

{ #category : 'generating' }
FsLibraryGenerator >> generateInterfaceNamed: aSymbol [
	"Generate an interface to the associated library."

	| interface |
	interface := self newClassNamed: aSymbol.
	self generateFunctionsIn: interface.
	interface initializeFunctions.
	^interface
]

{ #category : 'generating' }
FsLibraryGenerator >> generateInvokeFunctionFor: aCDeclaration [

	| stream |
	stream := AppendStream on: String new.
	stream
		nextPutAll: aCDeclaration name;
		nextPutAll: ': args errno: errnoHolder'.
	"self addSourceTo: stream."
	stream
		lf; tab;
		nextPutAll: '"Interpreted as #';
		nextPutAll: aCDeclaration resultType;
		nextPutAll: ' from #(';
		yourself.
	aCDeclaration parameters
		do: [:each |
			stream space.
			each argumentType printOn: stream].
	stream
		nextPutAll: ' )';
		nextPut: $";
		lf; lf; tab;
		nextPut: $^;
		nextPutAll: aCDeclaration asClassVarName; lf; tab; tab;
		nextPutAll: 'callWith: args';
		lf; tab; tab;
		nextPutAll: 'errno: errnoHolder'.
	^stream contents
]

{ #category : 'accessing' }
FsLibraryGenerator >> header [

	^header
]

{ #category : 'accessing' }
FsLibraryGenerator >> header: aCHeader [

	header := aCHeader
]

{ #category : 'initialize' }
FsLibraryGenerator >> initialize [

	super initialize.
	functionFilter := [:function | true]
]

{ #category : 'accessing' }
FsLibraryGenerator >> libraryPath [

	^libraryPath
]

{ #category : 'accessing' }
FsLibraryGenerator >> libraryPath: aString [

	libraryPath := aString
]

{ #category : 'generating' }
FsLibraryGenerator >> newClassNamed: aSymbol [

	^Object
		subclass: aSymbol
		instVarNames: #()
		classVars: #()
		classInstVars: #()
		poolDictionaries: #()
		inDictionary: nil
		options: #()
]
