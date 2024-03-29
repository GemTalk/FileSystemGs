"
Part of FileSystem

=========

I am an abstract superclass for FileLocator and FileReference. By implementing most of the methods on myself most code duplication between the locator and the reference can be avoided
"
Class {
	#name : 'AbstractFileReference',
	#superclass : 'Object',
	#instVars : [
		'path'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'copying' }
AbstractFileReference >> , extension [
	^ self resolve, extension
]

{ #category : 'navigating' }
AbstractFileReference >> / aString [
	"aString is either a file or path.  If aString is relative, it is appended to the receiver, if it is absolute, an instance of the receiver with the path is answered.
	To mimick the behavior of unix, if aString is empty, ignore it.
	/tmp// is equivalent to /tmp/."

	^aString = ''
		ifTrue: [self copy]
		ifFalse: [self withPath: (self path resolvePath: (self fileSystem pathFromString: aString))]
]

{ #category : 'comparing' }
AbstractFileReference >> <= other [
	^ self path <= other path
]

{ #category : 'accessing' }
AbstractFileReference >> absolutePath [
	"Returns the absolute path"
	
	^ self subclassResponsibility
]

{ #category : 'accessing' }
AbstractFileReference >> accessTime [
	"Returns the access time for the referenced file."

	^self resolve accessTime
]

{ #category : 'enumerating' }
AbstractFileReference >> allChildren [
	"Returns all children of the receiver."

	| children |
	children := {}.
	self allChildrenDo: [:each | children add: each].
	^children
]

{ #category : 'enumerating' }
AbstractFileReference >> allChildrenDo: aBlock [
	"If the receiver is a file, evaluate aBlock w/ the receiver.
	If the receiver is a directory, evaluate aBlock with the receiver and all children in breadth-first order."

	| toEnumerate |
	toEnumerate := { self resolve }.
	[toEnumerate isEmpty]
		whileFalse:
			[| each |
			each := toEnumerate removeFirst.
			aBlock value: each.
			each isDirectory
				ifTrue: [toEnumerate addAll: each children]]
]

{ #category : 'enumerating' }
AbstractFileReference >> allChildrenSelect: aBlock [
	"Return all selected blocks."

	| selected |
	selected := {}.
	self allChildrenDo: [:each | (aBlock value: each) ifTrue: [selected add: each]].
	^selected
]

{ #category : 'enumerating' }
AbstractFileReference >> allDirectories [
	"Return all the directories recursively nested in the receiver."

	^self allChildrenSelect: [:each | each isDirectory]
]

{ #category : 'enumerating' }
AbstractFileReference >> allFiles [
	"Return all the files (not directories) recursively nested in the receiver."

	^self allChildrenSelect: [:each | each isFile]
]

{ #category : 'streams' }
AbstractFileReference >> appendStream [
	"Returns a stream which, if written to, will append any written
	data to the end of the file."

	^self appendStreamEncoded: self defaultEncoding
]

{ #category : 'streams' }
AbstractFileReference >> appendStreamDo: aBlock [
	"Pass a write stream to aBlock which appends to the backing file."

	| stream |
	stream := self appendStream.
	^[aBlock value: stream]
		ensure: [stream flush; close]
]

{ #category : 'streams' }
AbstractFileReference >> appendStreamEncoded: encoding [
	"Returns a stream which, if written to, will append any written
	data to the end of the file. The specified encoding should be
	used for any data written to the stream.

	Using FileOpeningOptions is likely the better choice but it is not
	supported by memory-based file systems yet"

	^(self writeStreamEncoded: encoding)
		setToEnd;
		yourself
]

{ #category : 'streams' }
AbstractFileReference >> appendStreamEncoded: encoding
do: aBlock [
	"Pass a write stream to aBlock which appends to the backing file."

	| stream |
	stream := self appendStreamEncoded: encoding.
	^[aBlock value: stream]
		ensure: [stream flush; close]
]

{ #category : 'converting' }
AbstractFileReference >> asAbsolute [ 
	self subclassResponsibility
]

{ #category : 'converting' }
AbstractFileReference >> asFileReference [ 
	self subclassResponsibility 
]

{ #category : 'converting' }
AbstractFileReference >> asPath [
	"Answer the receiver's path"

	self subclassResponsibility 
]

{ #category : 'delegated' }
AbstractFileReference >> asPathWith: anObject [
	^ self resolve asPathWith: anObject
]

{ #category : 'resolving' }
AbstractFileReference >> asResolvedBy: anObject [
	^ anObject resolveReference: self
]

{ #category : 'accessing' }
AbstractFileReference >> base [
	"Returns the base of the basename, i.e. /foo/gloops.taz base is 'gloops'"
	^ self fullPath base
]

{ #category : 'accessing' }
AbstractFileReference >> basename [
	"Returns the basename, i.e. /foo/gloops.taz basename is 'gloops.taz'"
	^ self fullPath basename
]

{ #category : 'accessing' }
AbstractFileReference >> basenameWithIndicator [
	"Returns the basename with the indicator appended, i.e. /foo/gloops.taz basenameWithIndicator is 'gloops.taz', whereras /foo basenameWithIndicator is 'foo/'" 
	^ self basename, self indicator   
]

{ #category : 'accessing' }
AbstractFileReference >> basenameWithoutExtension [
	"Returns the basename, i.e. /foo/gloops.taz basenameWithoutExtension is 'gloops'"
	^ self fullPath basenameWithoutExtension
]

{ #category : 'accessing' }
AbstractFileReference >> basenameWithoutExtension: anExtension [
	"Returns the basename without specified extension (if any)
	('/foo/gloops.taz' asFileReference basenameWithoutExtension: 'taz') = 'gloops'
	"
	^ self fullPath basenameWithoutExtension: anExtension
]

{ #category : 'streams' }
AbstractFileReference >> binaryReadStream [

	^self resolve binaryReadStreamOptions: self defaultOptionsForRead
]

{ #category : 'streams' }
AbstractFileReference >> binaryReadStreamDo: aBlock [

	| stream |
	stream := self binaryReadStream.
	^[aBlock value: stream]
		ensure: [stream close]
]

{ #category : 'streams' }
AbstractFileReference >> binaryReadStreamDo: doBlock
ifAbsent: absentBlock [

	^self isFile
		ifTrue: [self binaryReadStreamDo: doBlock]
		ifFalse: [absentBlock value]
]

{ #category : 'streams' }
AbstractFileReference >> binaryReadStreamIfAbsent: absentBlock [

	^self isFile
		ifTrue: [self binaryReadStream]
		ifFalse: [absentBlock value]
]

{ #category : 'streams' }
AbstractFileReference >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStreamOptions: self defaultOptionsForWrite.
]

{ #category : 'streams' }
AbstractFileReference >> binaryWriteStreamDo: aBlock [
	"Pass a binary write stream on the receiver to the supplied block, and ensure that the stream is closed after evaluation."

	| stream |
	stream := self binaryWriteStream.
	^[aBlock value: stream]
		ensure: [stream close]
]

{ #category : 'streams' }
AbstractFileReference >> binaryWriteStreamDo: doBlock
ifPresent: presentBlock [

	^self isFile
		ifTrue: [presentBlock value]
		ifFalse: [self binaryWriteStreamDo: doBlock]
]

{ #category : 'delegated' }
AbstractFileReference >> canonicalize [
	"Answer the receiver with references to the current folder (.) and parent folder (..) removed"

	^ self withPath: self resolve path canonicalize
]

{ #category : 'accessing' }
AbstractFileReference >> changeTime [
	"Returns the change time for the referenced file."

	^self resolve changeTime
]

{ #category : 'enumerating' }
AbstractFileReference >> childNames [
	"Return the names of entries in a directory."

	| reference fileSystem names |
	reference := self resolve.
	fileSystem := reference fileSystem.
	names := {}.
	fileSystem
		childNamesAt: reference path
		ifAbsent: [fileSystem signalDirectoryDoesNotExist: reference path]
		ifNotDirectory: [DirectoryRequired signalWith: reference]
		do: [:name | names add: name].
	^names
]

{ #category : 'enumerating' }
AbstractFileReference >> children [
	"Answer an array containing references to the direct children of this reference."

	^self childNames collect: [:name | self / name]
]

{ #category : 'comparing' }
AbstractFileReference >> contains: anObject [
	"Return true if anObject is in a subfolder of me"
	^ anObject isContainedBy: self resolve
]

{ #category : 'comparing' }
AbstractFileReference >> containsPath: aPath [
	^ self fullPath containsPath: aPath
]

{ #category : 'accessing' }
AbstractFileReference >> contents [

	self readStreamDo: [ :stream | ^stream contents ]
]

{ #category : 'operations' }
AbstractFileReference >> copyAllTo: aResolvable [
	"Performs a deep copy of the receiver, to a location specified by the argument. If the receiver is a file, the file will be copied; if a directory, the directory and its contents will be copied recursively. The argument must be a reference that doesn't exist; it will be created by the copy."
	
	^self asFileReference copyAllTo: aResolvable
]

{ #category : 'delegated' }
AbstractFileReference >> copyTo: aReference [
	^ self resolve copyTo: aReference resolve
]

{ #category : 'copying' }
AbstractFileReference >> copyWithPath: newPath [
	self subclassResponsibility
]

{ #category : 'enumerating' }
AbstractFileReference >> createDirectory [
	"Verifies that the directory does not exist and only creates if necessary. Do not remove files contained if they exist.If the parents does not exist return an exception"
	self parent exists ifFalse:[DirectoryDoesNotExist signalWith: self parent path].
	^ self resolve ensureCreateDirectory
]

{ #category : 'enumerating' }
AbstractFileReference >> createFile [
	"Create if necessary a file for the receiver. If the parent does not exist return an exception"
	self parent exists ifFalse:[DirectoryDoesNotExist signalWith: self parent path].
	self writeStream close.
	
]

{ #category : 'accessing' }
AbstractFileReference >> creationTime [
	^ self resolve creationTime 
]

{ #category : 'accessing' }
AbstractFileReference >> defaultEncoding [

	^'utf8'
]

{ #category : 'accessing' }
AbstractFileReference >> defaultOptionsForRead [
	"Return the default options used when reading a file."

	^self fileOpeningOptionsClass readOnly
]

{ #category : 'accessing' }
AbstractFileReference >> defaultOptionsForWrite [
	"Return the default options used when writing a file."

	^self fileOpeningOptionsClass writeOnly
		create;
		yourself
]

{ #category : 'accessing' }
AbstractFileReference >> defaultStringClassForReading [

	^String isInUnicodeComparisonMode
		ifTrue: [Unicode7]
		ifFalse: [String]
]

{ #category : 'operations' }
AbstractFileReference >> delete [
	"Delete the receiver, does raise an error if it is not present."
	
	^ self resolve delete
]

{ #category : 'operations' }
AbstractFileReference >> deleteAll [
	"Delete this directory and all children of it, raise an error if the file does not exist."

	^self asFileReference deleteAll
]

{ #category : 'operations' }
AbstractFileReference >> deleteAllChildren [
	"delete all children of the receiver, raise an error if the receiver does not exist"
	
	self children do: [:aReference | aReference deleteAll ]
]

{ #category : 'operations' }
AbstractFileReference >> deleteIfAbsent: aBlock [
	"Delete the receiver, when it does not exist evaluate the block"
	self resolve deleteIfAbsent: aBlock
]

{ #category : 'accessing' }
AbstractFileReference >> deviceId [
	"Returns the device identifier associated with this reference."

	^self resolve deviceId
]

{ #category : 'enumerating' }
AbstractFileReference >> directories [
	"Return all the directories (by opposition to files) contained in the receiver"

	| reference fileSystem parentPath directories |
	reference := self resolve.
	fileSystem := reference fileSystem.
	parentPath := reference path.
	directories := {}.
	fileSystem
		directoryNamesAt: parentPath
		ifAbsent: [fileSystem signalDirectoryDoesNotExist: parentPath]
		ifNotDirectory: [fileSystem signalDirectoryDoesNotExist: parentPath]
		do: [:name | directories add: (self withPath: parentPath / name)].
	^directories
]

{ #category : 'enumerating' }
AbstractFileReference >> directoryNames [

	^ self directories collect: [:each | each basename]
]

{ #category : 'operations' }
AbstractFileReference >> ensureCreateDirectory [
	"Verifies that the directory does not exist and only creates if necessary. Do not remove files contained if they exist.Creates the parents if needed"
	^ self resolve ensureCreateDirectory
]

{ #category : 'operations' }
AbstractFileReference >> ensureCreateFile [
	"Create if necessary a file for the receiver. If the parent does not exist creates it"

	| fileDescriptor |
	(self exists and: [self isFile not])
		ifTrue: [].
	self parent ensureCreateDirectory.
	fileDescriptor := self openOptions: self defaultOptionsForWrite.
	fileDescriptor close
]

{ #category : 'operations' }
AbstractFileReference >> ensureDelete [
	"Delete the file and does not raise exception if it does not exist contrary to delete.
	However if it is a directory and it has children an error is signaled. If it is required to 
	delete even with children, use #ensureDeleteAll."
	
	self deleteIfAbsent: [].
]

{ #category : 'operations' }
AbstractFileReference >> ensureDeleteAll [
	"Delete this directory and all children of it, and does not raise an error if the file does not exist."
	
	self exists ifFalse: [^self].
	self deleteAll
	
]

{ #category : 'operations' }
AbstractFileReference >> ensureDeleteAllChildren [
	"delete all children of the receiver and does not raise an error if the receiver does not exist"
	
	self exists ifFalse: [ ^ self  ].
	self deleteAllChildren
]

{ #category : 'delegated' }
AbstractFileReference >> exists [
	"Return true if the file reference exist (e.g., if there is a file on the hard disk pointed by the file reference)
	
	E.g., (if you are on Unix or OSX)
	'/tmp/' asFileReference exists => true
	'/tmp/zorkbar' asFileReference exists => false
	"
	^ self resolve exists
]

{ #category : 'accessing' }
AbstractFileReference >> extension [
	
	^ self fullPath extension.
]

{ #category : 'accessing' }
AbstractFileReference >> extensions [
	  "#('foo' 'foo.tar' 'foo.tar.gz' 'foo.1.tar' 'foo.1.tar.gz') collect: [:thing| thing extensions] => #(#() #('tar') #('tar' 'gz') #('1' 'tar') #('1' 'tar' 'gz'))"
	
        ^ self fullPath extensions
]

{ #category : 'enumerating' }
AbstractFileReference >> fileNames [
	^ self files collect: [:each | each basename]
]

{ #category : 'accessing' }
AbstractFileReference >> fileOpeningOptionsClass [

	^self resolve fileOpeningOptionsClass
]

{ #category : 'enumerating' }
AbstractFileReference >> files [
	"Return all the files (as opposed to folders) contained in the receiver"
	
	| reference fileSystem parentPath files |
	reference := self resolve.
	fileSystem := reference fileSystem.
	parentPath := reference path.
	files := {}.
	fileSystem
		fileNamesAt: parentPath
		ifAbsent: [fileSystem signalDirectoryDoesNotExist: parentPath]
		ifNotDirectory: [DirectoryRequired signalWith: reference]
		do: [:name | files add: (self withPath: parentPath / name)].
	^files
]

{ #category : 'accessing' }
AbstractFileReference >> fileSystem [
	^ self resolve fileSystem
]

{ #category : 'delegated' }
AbstractFileReference >> fullName [

	^ self resolve fullName
]

{ #category : 'accessing' }
AbstractFileReference >> fullNameWithIndicator [
	"Returns the basename with the indicator appended, i.e. /foo/gloops.taz basenameWithIndicator is '/foo/gloops.taz', whereras /foo basenameWithIndicator is '/foo/'" 
	^ self fullName, self indicator   
]

{ #category : 'accessing' }
AbstractFileReference >> fullPath [
	"Returns the absolute path, better use absolutePath"
	
	^self resolve path
]

{ #category : 'accessing' }
AbstractFileReference >> gid [
	"Return the group id associated with this file."

	^self resolve gid
]

{ #category : 'testing' }
AbstractFileReference >> hasChildren [
	^self resolve hasChildren
]

{ #category : 'testing' }
AbstractFileReference >> hasDirectories [
	^self resolve hasDirectories
]

{ #category : 'testing' }
AbstractFileReference >> hasFiles [
	^self resolve hasFiles
]

{ #category : 'comparing' }
AbstractFileReference >> hash [
	"Hash is reimplemented because #= is reimplemented"
	^ self path  hash
]

{ #category : 'controlling' }
AbstractFileReference >> ifAbsent: aBlock [
	"Return self, or evaluate the block if I do not exist"

	^ self exists ifTrue: [ self ] ifFalse: [ aBlock cull: self ]
]

{ #category : 'controlling' }
AbstractFileReference >> ifExists: aBlock [
	"Evaluate the block, unless I do not exist. If the receiver exists, pass it as argument to the block."

	^ self exists ifTrue: [ aBlock cull: self ] ifFalse: [ self ]
]

{ #category : 'controlling' }
AbstractFileReference >> ifExists: aBlock ifAbsent: anotherBlock [
	"If the receiver exists, pass it as argument to aBlock. Else execute anotherBlock "

	^ self exists ifTrue: [ aBlock cull: self ] ifFalse: [ anotherBlock cull: self ]
]

{ #category : 'controlling' }
AbstractFileReference >> ifFile: fBlock ifDirectory: dBlock ifAbsent: aBlock [
	^ self isFile
		ifTrue: fBlock
		ifFalse: [
			self isDirectory
				ifTrue: dBlock
				ifFalse: aBlock ]
]

{ #category : 'printing' }
AbstractFileReference >> indicator [
	"Returns a string indicating the type of reference:
	- '?' for a non existing reference',
	- '/' for a directory,
	- the empty string for a file."
	"When this framework gets more complete, it is possible to extend this behavior with the following indicators (taken from unix ls utility):
	- '*' for a regular file that is executable
	- '@' for a symbolic link
	- '|' for FIFOs
	- '=' for sockets
	- '>' for doors"
	^ self exists
		ifTrue: [self isDirectory ifTrue: ['/'] ifFalse: ['']  ]
		ifFalse: ['?']
]

{ #category : 'initialization' }
AbstractFileReference >> initialize [
]

{ #category : 'testing' }
AbstractFileReference >> isAbsolute [ 
	self subclassResponsibility 
]

{ #category : 'testing' }
AbstractFileReference >> isBlock [
	"Is this reference to a block device?"

	^self resolve isBlock
]

{ #category : 'testing' }
AbstractFileReference >> isCharacter [
	"Is this reference to a character device?"

	^self resolve isCharacter
]

{ #category : 'testing' }
AbstractFileReference >> isChildOf: anObject [
	^ self parent = anObject
]

{ #category : 'comparing' }
AbstractFileReference >> isContainedBy: anObject [
	"DoubleDispatch helper for #contains:"
	^ anObject containsReference: self resolve
]

{ #category : 'testing' }
AbstractFileReference >> isDirectory [
	^ self resolve isDirectory
]

{ #category : 'testing' }
AbstractFileReference >> isExecutable [
	"Is this reference to a something that is executable?"
	"This probably needs to take into account whether the 
	file owner is the process owner."

	^self permissions ownerExecute
]

{ #category : 'testing' }
AbstractFileReference >> isFifo [
	"Is this reference to a fifo file?"

	^self resolve isFifo
]

{ #category : 'testing' }
AbstractFileReference >> isFile [
	^ self resolve isFile
]

{ #category : 'testing' }
AbstractFileReference >> isReadable [
	^ self resolve isReadable
]

{ #category : 'testing' }
AbstractFileReference >> isRegular [
	"Is this reference to a regular file?"

	^self resolve isRegular
]

{ #category : 'testing' }
AbstractFileReference >> isRelative [ 
	self subclassResponsibility 
]

{ #category : 'testing' }
AbstractFileReference >> isRoot [
	^ self resolve isRoot
]

{ #category : 'testing' }
AbstractFileReference >> isSocket [
	"Is this reference to a socket?"

	^self resolve isSocket
]

{ #category : 'testing' }
AbstractFileReference >> isWritable [
	^ self resolve isWritable
]

{ #category : 'accessing' }
AbstractFileReference >> item [
	^ self
]

{ #category : 'navigating' }
AbstractFileReference >> makeRelative: anObject [
	^ anObject relativeToReference: self resolve
]

{ #category : 'accessing' }
AbstractFileReference >> modificationTime [
	^ self resolve modificationTime 
]

{ #category : 'operations' }
AbstractFileReference >> moveTo: aReference [
	"Move the receiver in the location passed as argument.
	
	(FileSystem disk workingDirectory / 'paf' ) ensureCreateFile.
	(FileSystem disk workingDirectory / 'fooFolder') ensureCreateDirectory. 
	(FileSystem disk workingDirectory / 'paf' ) moveTo: (FileSystem disk workingDirectory / 'fooFolder' / 'paf')
	"
	^ self resolve moveTo: aReference
]

{ #category : 'accessing' }
AbstractFileReference >> numberOfHardLinks [
	"Returns the number of hard links to this file."

	^self resolve numberOfHardLinks
]

{ #category : 'streams' }
AbstractFileReference >> openWritable: aBoolean [

	^self resolve openWritable: aBoolean
]

{ #category : 'delegated' }
AbstractFileReference >> parent [

	^self resolve parent
]

{ #category : 'delegated' }
AbstractFileReference >> parentUpTo: aParentDirName [
	^ self withPath: (self path parentUpTo: aParentDirName)
]

{ #category : 'accessing' }
AbstractFileReference >> path [
	"Return the path internal representation that denotes the receiver in the context of its filesystem. "
	^ path
]

{ #category : 'accessing' }
AbstractFileReference >> pathSegments [
	^ self fullPath segments
]

{ #category : 'delegated' }
AbstractFileReference >> pathString [
	^ self resolve pathString
]

{ #category : 'accessing' }
AbstractFileReference >> permissions [
	"Return the FileSystemPermission for this node"
	^ self resolve permissions
]

{ #category : 'streams' }
AbstractFileReference >> readStream [

	^self readStreamEncoded: self defaultEncoding
]

{ #category : 'streams' }
AbstractFileReference >> readStreamDo: aBlock [

	| stream |
	stream := self readStream.
	^[aBlock value: stream]
		ensure: [stream close]
]

{ #category : 'streams' }
AbstractFileReference >> readStreamDo: doBlock ifAbsent: absentBlock [

	^self isFile 
		ifTrue: [self readStreamDo: doBlock]
		ifFalse: [absentBlock value]
]

{ #category : 'streams' }
AbstractFileReference >> readStreamEncoded: anEncoding [

	^self
		readStreamEncoded: anEncoding
		options: self defaultOptionsForRead
]

{ #category : 'streams' }
AbstractFileReference >> readStreamEncoded: anEncoding
do: aBlock [

	| stream |
	stream := self readStreamEncoded: anEncoding.
	^[aBlock value: stream] 
		ensure: [stream close]
]

{ #category : 'streams' }
AbstractFileReference >> readStreamEncoded: anEncoding
options: openingOptions [

	| binaryStream stream |
	binaryStream := self binaryReadStreamOptions: openingOptions.
	stream := self fileSystem isDiskFileSystem
		ifTrue: [ZnBufferedReadStream on: binaryStream]
		ifFalse: [binaryStream].
	^ ZnCharacterReadStream
		on: stream
		encoding: anEncoding
		stringClass: self defaultStringClassForReading
]

{ #category : 'streams' }
AbstractFileReference >> readStreamIfAbsent: absentBlock [

	^self isFile
		ifTrue: [self readStream]
		ifFalse: [absentBlock value]
]

{ #category : 'navigating' }
AbstractFileReference >> relativeTo: landmark [
	"Answer a new path relative to landmark."
	
	"parent/child/grandChild relativeTo: parent returns child/grandChild
	(Filesystem disk / 'griffle' / 'plonk' / 'nurp') relativeTo: (Filesystem disk / 'griffle') 
	returns plonk/nurp"

	^ landmark makeRelative: self resolve
]

{ #category : 'navigating' }
AbstractFileReference >> relativeToPath: landmarkPath [ 
	
	^ self fullPath relativeTo: landmarkPath
]

{ #category : 'navigating' }
AbstractFileReference >> relativeToReference: landmarkReference [
	"Return the path of the receiver relative to landmarkReference."
	
	^ self fullPath relativeTo: landmarkReference path
]

{ #category : 'operations' }
AbstractFileReference >> renameTo: newBasename [
	self subclassResponsibility
]

{ #category : 'navigating' }
AbstractFileReference >> resolve [
	^ self subclassResponsibility 
]

{ #category : 'navigating' }
AbstractFileReference >> resolve: anObject [
	^ anObject asResolvedBy: self
]

{ #category : 'navigating' }
AbstractFileReference >> resolvePath: aPath [
	^ self withPath: (self path resolvePath: aPath)
]

{ #category : 'navigating' }
AbstractFileReference >> resolveReference: aReference [
	^ aReference isAbsolute
		ifTrue: [ aReference ]
		ifFalse: [ self withPath: aReference path ]
]

{ #category : 'navigating' }
AbstractFileReference >> resolveString: aString [ 
	self subclassResponsibility
]

{ #category : 'accessing' }
AbstractFileReference >> size [
	"Return the size of the file in bytes."
	
	^ self resolve size
]

{ #category : 'streams' }
AbstractFileReference >> streamWritable: writable
do: aBlock [

	^writable
		ifTrue: [self writeStreamDo: aBlock]
		ifFalse: [self readStreamDo: aBlock]
]

{ #category : 'accessing' }
AbstractFileReference >> targetPath [
	"Return the part for this file. If this file is a symbolic link, return the path of the file being pointed at."

	^self resolve targetPath
]

{ #category : 'accessing' }
AbstractFileReference >> uid [
	"Return the user id associated with this file."

	^self resolve uid
]

{ #category : 'navigating' }
AbstractFileReference >> withExtension: aString [
	^ self withPath: (self path withExtension: aString)
]

{ #category : 'copying' }
AbstractFileReference >> withoutExtension [
  "Returns the new reference based on receiver with fullname without its extension"

  ^  (self parent / self basenameWithoutExtension)
]

{ #category : 'navigating' }
AbstractFileReference >> withPath: newPath [
	^ self path == newPath
		ifTrue: [ self ]
		ifFalse: [ self copyWithPath: newPath ]
]

{ #category : 'streams' }
AbstractFileReference >> writeStream [
	
	^self writeStreamEncoded: self defaultEncoding
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamDo: aBlock [

	| stream |
	stream := self writeStream.
	^[aBlock value: stream]
		ensure: [stream flush; close]
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamDo: doBlock
ifPresent: presentBlock [

	^self isFile
		ifTrue: [presentBlock value]
		ifFalse: [self writeStreamDo: doBlock]
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamEncoded: anEncoding [

	^self
		writeStreamEncoded: anEncoding
		options: self defaultOptionsForWrite
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamEncoded: anEncoding
do: aBlock [

	| stream |
	stream := self writeStreamEncoded: anEncoding.
	^[aBlock value: stream]
		ensure: [stream flush; close]
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamEncoded: anEncoding
options: openingOptions [

	| binaryStream |
	binaryStream := self binaryWriteStreamOptions: openingOptions.
	^ZnCharacterWriteStream
		on: binaryStream
		encoding: anEncoding
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamIfPresent: presentBlock [

	^self isFile 
		ifTrue: [presentBlock value]
		ifFalse: [self writeStream]
]

{ #category : 'streams' }
AbstractFileReference >> writeStreamOptions: openingOptions [
	
	^self
		writeStreamEncoded: self defaultEncoding
		options: openingOptions
]
