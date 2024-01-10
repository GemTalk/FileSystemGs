"
Part of FileSystem

=========

Test cases specific to disk-backed FileReferences.
"
Class {
	#name : 'FsDiskFileReferenceTest',
	#superclass : 'FileReferenceTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'utilities' }
FsDiskFileReferenceTest >> blockDeviceReference [
	"Return a reference to a block device."

	| devices |
	devices := #( '/dev/sda' '/dev/disk0' '/dev/nvme0' '/dev/mmcblk0' '/dev/loop0' '/dev/vda' ) collect: [:each | self fileSystem referenceTo: each].
	^devices detect: [:each | each exists] ifNone: [self assert: false]
]

{ #category : 'utilities' }
FsDiskFileReferenceTest >> characterDeviceReference [
	"Return a reference to a block device."

	^self fileSystem referenceTo: '/dev/null'
]

{ #category : 'running' }
FsDiskFileReferenceTest >> setUp [

	| fileSystem |
	super setUp.
	fileSystem := FileSystem disk.
	sandbox := FileLocator workingDirectory asFileReference / self sandboxName.
	self
		assert: sandbox fileSystem
		equals: fileSystem.
	self deny: sandbox exists.
	sandbox createDirectory
]

{ #category : 'running' }
FsDiskFileReferenceTest >> tearDown [

	sandbox deleteAll.
	super tearDown
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testAccessTime [

	self
		assert: sandbox accessTime
		isKindOf: DateAndTime
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testBinaryWriteStream [

	| file directory stream |
	file := sandbox / 'file'.
	directory := self createDirectory: 'directory'.

	"Ensure file is created by #binaryWriteStream."
	stream := file binaryWriteStream.
	stream
		nextPutAll: #[72 101 108 108 111 44 32 70 105 108 101 83 121 115 116 101 109 33];
		flush;
		close.
	self assert: file isFile.
	self
		assert: file contents
		equals: 'Hello, FileSystem!'.

	"Ensure #writeStream begins at start of file and truncates the file."
	stream := file binaryWriteStream.
	stream
		nextPutAll: #[65 66 67];
		flush;
		close.
	self
		assert: file contents
		equals: 'ABClo, FileSystem!'.

	"Ensure #writeStream send to a directory raises an exception."
	self
		should: [directory writeStream]
		raise: FileRequired
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testCreateDirectoryInReadOnlyDirectory [

	| readOnlyDirectory targetDirectory |
	readOnlyDirectory := self createDirectory: 'read-only'.
	targetDirectory := readOnlyDirectory / 'target'.
	readOnlyDirectory permissions: (FileSystemPermission posixPermissions: 8r555).
	self
		should: [targetDirectory createDirectory]
		raise: FilePermissionDenied.
	readOnlyDirectory delete
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testDeviceId [

	self
		assert: sandbox deviceId
		isKindOf: Integer
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testEnsureDeleteAllDoesNotFollowSymlinks [
	"sandbox
		|_targetDirectory
			|_someFile
		|_someDirectory
			|_symlink
	Ensure that when another-directory is send #ensureDeleteAll,
	symlink is deleted. In the process, ensure it does not delete
	symlink-target-directory or some-file."

	| targetDirectory someFile someDirectory symlink |
	targetDirectory := self createDirectory: 'targetDirectory'.
	someFile := self
		createFile: 'targetDirectory/someFile'
		contents: 'someFile contents'.
	someDirectory := self createDirectory: 'someDirectory'.
	symlink := someDirectory / 'symlink'.
	symlink symlinkTo: targetDirectory.
	self
		assert: targetDirectory exists;
		assert: someFile exists;
		assert: someDirectory exists;
		assert: symlink exists.
	someDirectory ensureDeleteAll.
	self
		assert: targetDirectory exists;
		assert: someFile exists;
		deny: someDirectory exists;
		deny: symlink exists.
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testFileOpeningOptionsClass [
	"This test shoud be handled in a subclass"

	| theClass |
	theClass := sandbox fileOpeningOptionsClass.
	self assert: ({FsFileOpeningOptions_Linux_aarch64. FsFileOpeningOptions_Linux_x64. FsFileOpeningOptions_macOS} includes: theClass)
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testGid [

	self
		assert: sandbox gid
		isKindOf: Integer
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testInode [

	self
		assert: sandbox inode
		isKindOf: Integer
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsBlock [
	"Several potential block devices are searched to find one.
	It is possble the test could fail because one of these block devices is not available."

	self
		assert: self blockDeviceReference isBlock;
		deny: self characterDeviceReference isBlock;
		deny: ((self createFile: 'not-block') isBlock);
		deny: sandbox isBlock
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsCharacter [
	"/dev/null should be on every supported system."

	self
		deny: self blockDeviceReference isCharacter;
		assert: self characterDeviceReference isCharacter;
		deny: ((self createFile: 'not-character') isCharacter);
		deny: sandbox isCharacter
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsExecutable [
	"I expect /usr/bin/env to be on every system we support.
	Even non-FHS linux distros like NixOS have this file."

	| exe file |
	exe := self fileSystem referenceTo: '/usr/bin/env'.
	file := self createFile: 'not-executable'.
	self
		assert: exe isExecutable;
		deny: file isExecutable;
		assert: sandbox isExecutable
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsFifo [
	"I don't know of a good way to test the positive case.
	I just test the negative cases here."

	self
		deny: self blockDeviceReference isFifo;
		deny: self characterDeviceReference isFifo;
		deny: ((self createFile: 'not-fifo') isFifo);
		deny: sandbox isFifo
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsReadable [
	"Ensure #isReadable returns correct results"

	| file permissions |
	file := self
		createFile: 'testIsReadable'
		contents: 'Permissions are tricky.'.
	self assert: file isReadable.

	permissions := FileSystemPermission posixPermissions: 8r000.
	file permissions: permissions.
	self deny: file isReadable.

	permissions := FileSystemPermission posixPermissions: 8r600.
	file permissions: permissions.
	file delete
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsRegular [
	"See subclass implementations."

	self
		assert: ((self createFile: 'regular-file') isRegular);
		deny: sandbox isRegular;
		deny: self blockDeviceReference isRegular;
		deny: self characterDeviceReference isRegular
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsSocket [
	"I don't know of a good way to test the positive case.
	I just test the negative cases here."

	self
		deny: self blockDeviceReference isSocket;
		deny: self characterDeviceReference isSocket;
		deny: ((self createFile: 'not-fifo') isSocket);
		deny: sandbox isSocket
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testIsWritable [
	"Ensure #isWritable returns correct results"

	| file permissions |
	file := self
		createFile: 'testIsWriteable'
		contents: 'Permissions are tricky.'.
	self assert: file isWritable.

	permissions := FileSystemPermission posixPermissions: 8r000.
	file permissions: permissions.
	self deny: file isWritable.

	permissions := FileSystemPermission posixPermissions: 8r600.
	file permissions: permissions.
	file delete
]

{ #category : 'compatibility tests' }
FsDiskFileReferenceTest >> testNumberOfHardLinks [
	"See subclass implementations"

	| file |
	file := self createFile: 'hard-links'.
	self
		assert: file numberOfHardLinks
		equals: 1
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testPermissions [
	"See subclasses implementations if supported."

	| rw rwe original |
	rw := FileSystemPermission posixPermissions: 8r666.
	rwe := FileSystemPermission posixPermissions: 8r777.
	original := sandbox permissions.
	self
		assert: original
		isKindOf: FileSystemPermission.
	sandbox permissions: rw.
	self
		assert: sandbox permissions
		equals: rw.
	sandbox permissions: rwe.
	self
		assert: sandbox permissions
		equals: rwe.
	sandbox permissions: original
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testSetAsWorkingDirectory [

	| diskStore initialWD targetWD file |
	diskStore := FileSystem disk.
	initialWD := diskStore workingDirectory.
	targetWD := sandbox.
	self
		assert: targetWD
		isKindOf: FileReference.
	self
		deny: initialWD
		equals: targetWD.
	[targetWD setAsWorkingDirectory.
	self
		assert: diskStore workingDirectory
		equals: targetWD]
		ensure: [initialWD setAsWorkingDirectory].
	file := self createFile: 'hello-world'.
	self
		should: [file setAsWorkingDirectory]
		raise: DirectoryRequired.
	self
		should: [self characterDeviceReference setAsWorkingDirectory]
		raise: DirectoryRequired.
	self
		should: ['/does/not/exist' asFileReference setAsWorkingDirectory]
		raise: DirectoryDoesNotExist
]

{ #category : 'compatibility tests' }
FsDiskFileReferenceTest >> testSymlinkTo [
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
	symlink symlinkTo: target.
	self assert: symlink isSymlink.
	self assert: symlink isFile.
	self deny: symlink isDirectory.
	self
		assert: target contents
		equals: symlink contents.

	"Existing directory"
	target := self createDirectory: 'testSymlinkTo-directory'.
	symlink := sandbox / 'testSymlinkTo-directory-symlink'.
	symlink symlinkTo: target.
	self assert: symlink isSymlink.
	self deny: symlink isFile.
	self assert: symlink isDirectory.

	"Target which does not exist."
	target := sandbox / 'creating' / 'this' / 'will' / 'break' / 'testSymlinkTo'.
	symlink := sandbox / 'dne-symlink'.
	symlink symlinkTo: target.
	self assert: symlink isSymlink.
	self deny: symlink isFile.
	self deny: symlink isDirectory.

	"Ensure an appropropriate error if the symlink location has already exists."
	target := self
		createFile: 'testSymlinkTo-symlink-reference-already-exists'
		contents: 'The symlink reference will already exist'.
	symlink := self
		createFile: 'testSymlinkTo-symlink'
		contents: 'This is already a file.'.
	self
		should: [symlink symlinkTo: target]
		raise: FileExists
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testUid [

	self
		assert: sandbox uid
		isKindOf: Integer
]

{ #category : 'tests' }
FsDiskFileReferenceTest >> testWriteStream [

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
	stream := file writeStream.
	stream
		nextPutAll: '123';
		flush;
		close.
	self
		assert: file contents
		equals: '123def'.

	"Ensure #writeStream send to a directory raises an exception."
	self
		should: [directory writeStream]
		raise: FileRequired
]
