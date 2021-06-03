"
I represent a cached version of the stat for a file system entry.
"
Class {
	#name : 'DiskDirectoryEntry',
	#superclass : 'FileSystemDirectoryEntry',
	#instVars : [
		'stat'
	],
	#category : 'FileSystem-Core'
}

{ #category : 'instance creation' }
DiskDirectoryEntry class >> reference: aFileReference
stat: aStatStruct [

	^self new
		reference: aFileReference;
		stat: aStatStruct;
		yourself
]

{ #category : 'accessing' }
DiskDirectoryEntry >> creationTime [
	"Right now, creation time is not supported."

	^self modificationTime
]

{ #category : 'testing' }
DiskDirectoryEntry >> isDirectory [

	^stat isDirectory
]

{ #category : 'testing' }
DiskDirectoryEntry >> isFile [

	^stat isFile
]

{ #category : 'testing' }
DiskDirectoryEntry >> isSymlink [

	^stat isSymlink
]

{ #category : 'accessing' }
DiskDirectoryEntry >> modificationTime [
	"Right now, creation time is not supported."

	^DateAndTime
		posixSeconds: stat modificationTime
		offset: Duration zero
]

{ #category : 'accessing' }
DiskDirectoryEntry >> size [

	^stat size
]

{ #category : 'accessing' }
DiskDirectoryEntry >> stat [

	^stat
]

{ #category : 'accessing' }
DiskDirectoryEntry >> stat: aStatStruct [

	stat := aStatStruct
]
