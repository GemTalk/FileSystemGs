"
I am a late-bound reference. I refer to a file or directory in relation to a well-known location on the filesystem, called an origin. When asked to perform concrete operation, I look up the current location of my origin, and resolve my path against it. 

Usage
----------
FileLocator vmDirectory parent pathString
	> '/Applications'


FileLocator desktop.
FileLocator desktop basename.

FileLocator home basename.
FileLocator image.
FileLocator vmBinary asAbsolute pathString 
	>  '/Applications/CogVM.app/Contents/MacOS/CogVM'
FileLocator vmBinary pathString 
	> '/Applications/CogVM.app/Contents/MacOS/CogVM'
		




Implementation
------------------------
origin 
	A symbolic name for base reference I use to resolve myself.

path
	A relative path that is resolved against my origin""
	
	
"
Class {
	#name : 'FileLocator',
	#superclass : 'AbstractFileReference',
	#instVars : [
		'origin'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'adding' }
FileLocator class >> addResolver: aResolver [
	self resolver addResolver: aResolver
]

{ #category : 'origins' }
FileLocator class >> cache [
	^ self origin: #cache
]

{ #category : 'origins' }
FileLocator class >> cwd [
	^ self workingDirectory
]

{ #category : 'gemstone-origins' }
FileLocator class >> dbfScratchDir [
	"Answer the path to the DBF_SCRATCH_DIR"

	^ self origin: #dbfScratchDir
]

{ #category : 'origins' }
FileLocator class >> desktop [
	^ self origin: #desktop
]

{ #category : 'origins' }
FileLocator class >> documents [
	^ self origin: #documents
]

{ #category : 'gemstone-origins' }
FileLocator class >> extent: extentIndex [
	"Answer the path to the extent at extentIndex in DBF_EXTENT_NAMES: (System stoneConfigurationReport at: #DBF_EXTENT_NAMES) at: extentIndex"

	^ self origin: ('extent', extentIndex printString) asSymbol
]

{ #category : 'gemstone-origins' }
FileLocator class >> extent1 [
	"Answer the path to the first exent extent"

	^ self origin: #extent1
]

{ #category : 'gemstone-origins' }
FileLocator class >> extent1Directory [

	^ self origin: #extent1Directory
]

{ #category : 'flushing' }
FileLocator class >> flushCaches [
	self resolver flushCaches
]

{ #category : 'instance creation' }
FileLocator class >> fromPath: aPath ifNone: notFoundBlock [
	"Returns a file locator if aPath is a reference to a supported origin or is a child of an origin.
	If no locator matches, return the result of the evaluation of notFoundBlock.
	Locators are sorted so that the deepest matching origin path is returned.
	Ex: '/Users/me/Documents/foo.txt' will return a locator 
		with #documents origin (path /Users/me/Documents) and not #home (path /Users/me).
	Should not be called direcly. Prefer the use of Path or String>>#asFileLocatorOrReference. "

	| locators locatorsPaths |
	locators := self supportedOrigins collect: [ :origin | self origin: origin ].
	locatorsPaths := (locators collect: [ :e | e -> e asPath ]) asDictionary.
	(locators sort:	[ :a :b | (locatorsPaths at: b) <= (locatorsPaths at: a) ])
		do: [ :locator | 
			((locatorsPaths at: locator) = aPath or: [ (locatorsPaths at: locator) containsPath: aPath ])
				ifTrue: [ ^ locator resolve: (aPath relativeToPath: (locatorsPaths at: locator)) ] ].
	^ notFoundBlock value
]

{ #category : 'gemstone-origins' }
FileLocator class >> gemLogDirectory [
	"locator for the log directory (parent directory of gemLog)"

	^ self origin: #gemLogDirectory
]

{ #category : 'origins' }
FileLocator class >> home [
	^ self origin: #home
]

{ #category : 'gemstone-origins' }
FileLocator class >> image [
	"commonly used, so we need to define it, but the closest that GemStone comes is the #dbfScratchDir"

	^ self dbfScratchDir
]

{ #category : 'gemstone-origins' }
FileLocator class >> imageDirectory [
	"commonly used, so we need to define it, but the closest that GemStone comes is the #dbfScratchDir"

	^ self dbfScratchDir
]

{ #category : 'instance creation' }
FileLocator class >> origin: aSymbol [ 
	^ self origin: aSymbol path: Path workingDirectory
]

{ #category : 'instance creation' }
FileLocator class >> origin: aSymbol path: aPath [
	^ self basicNew 
			initializeWithOrigin: aSymbol path: aPath
]

{ #category : 'origins' }
FileLocator class >> preferences [
	^ self origin: #preferences
]

{ #category : 'accessing' }
FileLocator class >> resolver [

	^SystemResolver new
		addResolver: PlatformResolver forCurrentPlatform;
		yourself
]

{ #category : 'origins' }
FileLocator class >> root [
	^ FileSystem disk root
]

{ #category : 'accessing' }
FileLocator class >> supportedOrigins [
	| origins current |
	origins := IdentitySet new.
	current := self resolver.
	[current notNil] whileTrue:
		[origins addAll: current supportedOrigins.
		current := current next].
	^ origins
]

{ #category : 'mac-origins' }
FileLocator class >> systemApplicationSupport [
	^ self origin: #systemApplicationSupport
]

{ #category : 'mac-origins' }
FileLocator class >> systemLibrary [
	^ self origin: #systemLibrary
]

{ #category : 'origins' }
FileLocator class >> temp [
	^ self origin: #temp
]

{ #category : 'gemstone-origins' }
FileLocator class >> tranlog [
	"Answer the path to the current tranlog directory"

	^ self origin: #tranlog
]

{ #category : 'mac-origins' }
FileLocator class >> userApplicationSupport [
	^ self origin: #userApplicationSupport
]

{ #category : 'unix-origins' }
FileLocator class >> userData [
	^ self origin: #userData
]

{ #category : 'mac-origins' }
FileLocator class >> userLibrary [
	^ self origin: #userLibrary
]

{ #category : 'origins' }
FileLocator class >> workingDirectory [
	^ FileSystem disk referenceTo: RelativePath new
]

{ #category : 'comparing' }
FileLocator >> = other [
	^ self species = other species
		and: [origin = other origin
			and: [path = other path]]
]

{ #category : 'accessing' }
FileLocator >> absolutePath [
	"Return the absolute path"
	^ self resolve path
]

{ #category : 'converting' }
FileLocator >> asAbsolute [
	^ self 
]

{ #category : 'converting' }
FileLocator >> asFileReference [
	^ self resolve
]

{ #category : 'converting' }
FileLocator >> asPath [
	"Answer the receiver's path"

	^self resolve asPath
]

{ #category : 'streams-compatibility' }
FileLocator >> binaryReadStream [
	^ self resolve binaryReadStream
]

{ #category : 'streams-compatibility' }
FileLocator >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStream
]

{ #category : 'copying' }
FileLocator >> copyWithPath: newPath [
	^ self class origin: origin path: newPath
]

{ #category : 'error handling' }
FileLocator >> doesNotUnderstand: aMessage [
	"Redirect message to the resolved version of this FileLocator.
	If FileReference won't understand the message send a normal DNU."

	| resolved |
	
	resolved := self resolve.
	(resolved respondsTo: aMessage selector)
		ifTrue: [ ^ resolved perform: aMessage selector withArguments: aMessage arguments ].
	
	^ super doesNotUnderstand: aMessage.
]

{ #category : 'comparing' }
FileLocator >> hash [
	^ origin hash bitXor: path hash
]

{ #category : 'initialize-release' }
FileLocator >> initializeWithOrigin: aSymbol path: aPath [
	self initialize.
	origin := aSymbol.
	path := aPath.
]

{ #category : 'testing' }
FileLocator >> isAbsolute [
	^ true
]

{ #category : 'testing' }
FileLocator >> isRelative [
	^ false
]

{ #category : 'accessing' }
FileLocator >> origin [
	^ origin
]

{ #category : 'printing' }
FileLocator >> printOn: aStream [
	| fs |
	aStream
		nextPut: ${;
		nextPutAll: origin;
		nextPut: $}.
	path isWorkingDirectory
		ifTrue: [ ^ self ].
	fs := self fileSystem.
	aStream nextPut: fs delimiter.
	fs printPath: path on: aStream
]

{ #category : 'streams' }
FileLocator >> readStream [
	^ self resolve readStream 
]

{ #category : 'operations' }
FileLocator >> renameTo: newBasename [
	
	| result |
	result := self resolve renameTo: newBasename.
	path size > 0
		ifTrue: [ path basename: newBasename ]
		ifFalse: [ path := result path ]
]

{ #category : 'navigating' }
FileLocator >> resolve [
	^ (self class resolver resolve: origin) resolve: path
]

{ #category : 'navigating' }
FileLocator >> resolveString: aString [
	| filesystem thePath |
	filesystem := (self class resolver resolve: origin) fileSystem.
	thePath := filesystem pathFromString: aString.
	^ self withPath: (path resolvePath: thePath)
]

{ #category : 'streams' }
FileLocator >> writeStream [
	^ self resolve writeStream 
]
