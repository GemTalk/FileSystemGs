Extension { #name : 'FileSystem' }

{ #category : '*filesystem-disk' }
FileSystem class >> * aFileOrDirectoryName [

	^self disk * aFileOrDirectoryName
]

{ #category : '*filesystem-disk' }
FileSystem class >> / aFileOrDirectoryName [

	^self disk / aFileOrDirectoryName
]

{ #category : '*filesystem-disk' }
FileSystem class >> disk [
	"Answer a filesystem that represents the 'on-disk' filesystem used by the host operating system.
	Note, we do not ensure there is a singleton within the repository.
	We only ensure there is a single new instance per session. If associated FileReference instances
	are committed, multiple instances of FsDiskFileSystem may exist. They are equivalent so this
	is not problematic."

	^SessionTemps current
		at: self diskCacheKey
		ifAbsentPut: [FsDiskFileSystem new]
]

{ #category : '*filesystem-disk' }
FileSystem class >> diskCacheKey [
	"This key is used to cache the current FsDiskFileSystem instance."

	^#'GsCurrentDiskFileSystem'
]

{ #category : '*filesystem-disk' }
FileSystem class >> resetCurrent [

	SessionTemps current
		removeKey: self diskCacheKey
		ifAbsent: []
]

{ #category : '*filesystem-disk' }
FileSystem class >> root [

	^self disk root
]

{ #category : '*filesystem-disk' }
FileSystem class >> workingDirectory [

	^self disk workingDirectory
]

{ #category : '*FileSystem-Disk' }
FileSystem >> isDiskFileSystem [

	^false
]
