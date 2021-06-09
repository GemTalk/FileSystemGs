"
This class implements the FileAttributes interface for files store on the Disk.
"
Class {
	#name : 'DiskFileAttributes',
	#superclass : 'FileAttributes',
	#category : 'FileSystem-Disk'
}

{ #category : 'instance creation' }
DiskFileAttributes class >> stat: aStatStruct [

	^self new
		stat: aStatStruct;
		yourself
]
