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

{ #category : 'accessing' }
FsDiskFileSystem >> store [
	"Returns the associated store, ensuring it is recreated if necessary."

	^DiskStore current
]
