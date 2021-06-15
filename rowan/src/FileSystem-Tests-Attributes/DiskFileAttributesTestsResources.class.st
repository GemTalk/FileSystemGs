"
DiskFileAttributesTestsResources provides a file with known attributes that can be used to test attribute retrieval in the File System.

DiskFileAttributesTestsResources is currently used by FileReferenceAttributeTests.

    Instance Variables
	afterCreationTime:	The time just after file was created	<DateAndTime>
	beforeCreationTime:	The time just before file was created	<DateAndTime>
	file:					The name of the file (with known attributes)	<FileReference>


    Implementation Points
"
Class {
	#name : 'DiskFileAttributesTestsResources',
	#superclass : 'TestResource',
	#instVars : [
		'file',
		'beforeCreationTime',
		'afterCreationTime'
	],
	#category : 'FileSystem-Tests-Attributes'
}

{ #category : 'accessing' }
DiskFileAttributesTestsResources >> afterCreationTime [
	^ afterCreationTime
]

{ #category : 'accessing' }
DiskFileAttributesTestsResources >> beforeCreationTime [
	^ beforeCreationTime
]

{ #category : 'accessing' }
DiskFileAttributesTestsResources >> file [
	^ file
]

{ #category : 'running' }
DiskFileAttributesTestsResources >> setUp [
	| ws bufferedStream |
	file := FileLocator temp
		/ ('FileAttributesTests-' , FastUUIDGenerator next asString , '.txt').
	beforeCreationTime := DateAndTime now.
	(Delay forMilliseconds: 10) wait.
	ws := file writeStream.
	bufferedStream := ZnBufferedWriteStream on: ws.
	[ 
	bufferedStream nextPutAll: 'Created by FileAttributesTestsResources>>setUp '.
	beforeCreationTime printOn: bufferedStream ]
		ensure: [ bufferedStream close ].
	(Delay forMilliseconds: 10) wait.
	afterCreationTime := DateAndTime now
]

{ #category : 'running' }
DiskFileAttributesTestsResources >> tearDown [

	file delete.
]
