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

	| ws |

	file := FileLocator temp / ('FileAttributesTests-', FastUUIDGenerator next asString, '.txt').
	beforeCreationTime := DateAndTime now beRounded.
	ws := file writeStream.
	[
		ws nextPutAll: 'Created by FileAttributesTestsResources>>setUp '.
		beforeCreationTime printOn: ws.
	] ensure: [ ws close ].
	afterCreationTime := DateAndTime now beRounded.
	"Round up to the next second"
	afterCreationTime := DateAndTime
		year: afterCreationTime year day: afterCreationTime dayOfYear hour: afterCreationTime hour minute: afterCreationTime minute second: afterCreationTime second + 1
]

{ #category : 'running' }
DiskFileAttributesTestsResources >> tearDown [

	file delete.
]
