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
	"Answer a filesystem that represents the 'on-disk' filesystem used by the host operating system."

	^DiskStore currentFileSystem
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
