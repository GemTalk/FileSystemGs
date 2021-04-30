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
DiskDirectoryEntry >> stat [

	^stat
]

{ #category : 'accessing' }
DiskDirectoryEntry >> stat: aStatStruct [

	stat := aStatStruct
]
