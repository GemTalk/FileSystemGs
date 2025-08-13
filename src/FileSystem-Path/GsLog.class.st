"
GsLog provides a logging mechanism which will automatically rotate when a SIGHUP is received.

GsLog is thread-safe. Writes to the log file are protected by a mutex. Rotating holds the mutex for the duration of the rotate. If a file exists during initial open or during a rotate, the existing file is appended to. If the specified file does not exist, a new file is created.

Care should be taken to avoid logging during Ephemeron mourning. Ephemeron mourning, by default, occurs on the same thread as active process. If mourning happens during a critical section and it writes to the log, the process will deadlock. This can be avoided by using processing mourn events in a defined process. See GsSignalingSocket class>>_readNotificationExample.
"
Class {
	#name : 'GsLog',
	#superclass : 'Object',
	#instVars : [
		'fileReference',
		'stream',
		'mutex'
	],
	#category : 'FileSystem-Path'
}

{ #category : 'instance creation' }
GsLog class >> fileReference: aFileReference [
	"Create a new log writing to the location specified."

	| instance |
	instance := self basicNew.
	instance initializeWith: aFileReference.
	^instance
]

{ #category : 'instance creation' }
GsLog class >> pathString: aPathString [
	"Create the log at the location defined by the provided string."

	^self fileReference: aPathString asFileReference
]

{ #category : 'closing' }
GsLog >> close [
	"Close the log."

	mutex critical: [stream close. stream := nil]
]

{ #category : 'initializing' }
GsLog >> initializeWith: aFileReference [
	"Initialize the log with the provided location."

	mutex := Semaphore forMutualExclusion.
	fileReference := aFileReference.
	stream := fileReference appendStream.
]

{ #category : 'rotating' }
GsLog >> rotate [
	"Rotate the log file.
	Reopen the log file. Recreate the file if it does not exist."

	mutex critical:
		[stream close.
		stream := fileReference appendStream]
]

{ #category : 'logging' }
GsLog >> write: aMessageString [
	"Write the provided message to the log file.
	This method flushes so that `tail` is useful
	and up-to-date."

	mutex critical:
		[stream
			nextPutAll: aMessageString;
			lf; flush]
]
