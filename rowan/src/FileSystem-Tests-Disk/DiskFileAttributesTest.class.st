Class {
	#name : 'DiskFileAttributesTest',
	#superclass : 'FileAttributesTest',
	#category : 'FileSystem-Tests-Disk'
}

{ #category : 'initialize-release' }
DiskFileAttributesTest >> initializeSanbox [
	"initialize the test sandbox"

	filesystem := FileSystem disk.
	sandbox := filesystem root / 'tmp' / self sandboxDirectoryName.
	sandbox createDirectory
]
