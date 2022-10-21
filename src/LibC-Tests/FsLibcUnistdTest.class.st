Class {
	#name : 'FsLibcUnistdTest',
	#superclass : 'TestCase',
	#instVars : [
		'instance',
		'fcntlInstance'
	],
	#category : 'LibC-Tests'
}

{ #category : 'support' }
FsLibcUnistdTest >> setUp [

	| store |
	store := DiskStore current.
	instance := store libcUnistd.
	fcntlInstance := store libcFcntl
]

{ #category : 'tests' }
FsLibcUnistdTest >> testChdir [

	| initialWD newWD |
	initialWD := self workingDirectoryPathString.
	newWD := '/tmp'.
	self
		deny: initialWD
		equals: newWD.
	instance chdir: newWD.
	self
		assert: self workingDirectoryPathString
		equals: newWD.
	instance chdir: initialWD.
	self
		assert: self workingDirectoryPathString
		equals: initialWD
]

{ #category : 'tests' }
FsLibcUnistdTest >> testEbadf [
	"This test relies on the gem not having a file descriptor numbered 123.
	This should be true most of the time, but is not guaranteed."

	| buf |
	buf := CByteArray gcMalloc: 10.
	self
		should: [ instance readFromFileDescriptor: 123 toBuffer: buf count: 0 ]
		raise: FsEBADF
]

{ #category : 'tests' }
FsLibcUnistdTest >> testEOF [
	"Create an empty file, read from it. 
	Should get EOF exception."

	| filename fd buf returned |
	filename := 'testEof.empty'.	
	"Flags: O_CREAT (8r100), O_RDONLY (0)"	"Mode: S_IRWXU"
	fd := fcntlInstance openPath: filename flags: 8r100 mode: 8r0700.
	buf := CByteArray gcMalloc: 1024.
	returned := instance readFromFileDescriptor: fd toBuffer: buf count: 1.
	self assert: returned equals: 0.
	returned := instance closeFd: fd.
	self assert: returned equals: 0.
	returned := instance unlinkPath: filename.
	self assert: returned equals: 0
]

{ #category : 'tests' }
FsLibcUnistdTest >> testReadBash [
	"This test relies on the /bin/bash being there and readable.
	This should be true on all Linux machines. And our Macs, though not necessarily Macs in general."

	| filename fd buffer numRead closeReturn |
	filename := '/bin/bash'.
	fd := fcntlInstance openPath: filename flags: 0 mode: 0.
	self assert: fd > 0.
	buffer := CByteArray gcMalloc: 4.
	numRead := instance
		readFromFileDescriptor: fd
		toBuffer: buffer
		count: buffer size.
	self assert: numRead equals: buffer size.
	self assert: (buffer int8At: 0) equals: 16r7f.	"Part of the ELF majic number"
	self assert: (buffer stringFrom: 1 to: 3) equals: 'ELF'.
	closeReturn := instance closeFd: fd.
	self assert: closeReturn equals: 0
]

{ #category : 'tests' }
FsLibcUnistdTest >> testWriteToStderr [
	| message buf numWritten |
	message := '' copy lf , 'This was written to stderr.'.
	buf := CByteArray withAll: message asByteArray.
	numWritten := instance writeToFileDescriptor: 2 fromBuffer: buf count: message size.
	self assert: numWritten equals: message size	
	"Manually determine that the message was written to the gem log or topaz stderr."
]

{ #category : 'tests' }
FsLibcUnistdTest >> testWriteToStdout [
	| message buf numWritten |
	message := '' copy lf , 'This was written to stdout.'.
	buf := CByteArray withAll: message asByteArray.
	numWritten := instance writeToFileDescriptor: 1 fromBuffer: buf count: message size.
	self assert: numWritten equals: message size
	"Manually determine that the message was written to the gem log or topaz stdout."
]

{ #category : 'accessing' }
FsLibcUnistdTest >> workingDirectoryPathString [

	^FileSystem disk workingDirectoryPath pathString
]
