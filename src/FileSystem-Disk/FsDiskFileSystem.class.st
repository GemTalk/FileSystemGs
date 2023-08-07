"
Part of FileSystem

=========

DiskFileSystem is not a standard class in FileSystem. GemStone's implementation introduces this class to avoid committing platform-specific objects like LinuxStore_aarch64 instances. Instead, DiskFileSystem will lazily recreate its store. This class avoids committing any of its instance variables by marking itself as DbTransient.
"
Class {
	#name : 'FsDiskFileSystem',
	#superclass : 'FileSystem',
	#category : 'FileSystem-Disk'
}

{ #category : 'instance creation' }
FsDiskFileSystem class >> store: aStore [
	"FsDiskFileSystem dynamically obtains the correct store. This ensures committed instances
	do not cause runtime errors due to instance-level caches. Instances created with
	SystemUser may not be alterable in DataCurator for instance.
	Use FsDiskFileSystem class>>#new instead."

	^self shouldNotImplement: #store:
]

{ #category : 'testing' }
FsDiskFileSystem >> isDiskFileSystem [

	^true
]

{ #category : 'printing' }
FsDiskFileSystem >> printJsonOn: aStream [
	"Print a JSON representation on the provided stream.
	For FileSystem this is defined as ""disk"" for disk-based
	instances and ""memory"" for memory-based instances."

	aStream nextPutAll: '"disk"'
]

{ #category : 'accessing' }
FsDiskFileSystem >> store [
	"Returns the associated store, ensuring it is recreated if necessary."

	^DiskStore current
]

{ #category : 'public-operations' }
FsDiskFileSystem >> symlink: linkPathString
toTarget: targetPathString [
	"Create a symlink to the targetPathString
	at the location specified by linkPathString.
	Note: The caller is expected to provide
	path strings. Other resolvables are not
	supported."

	self store
		symlink: linkPathString
		toTarget: targetPathString
]
