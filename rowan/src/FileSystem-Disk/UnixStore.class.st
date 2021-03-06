"
I'm a specific store for Unix file systems
"
Class {
	#name : 'UnixStore',
	#superclass : 'DiskStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'public' }
UnixStore class >> delimiter [
	^ $/
]

{ #category : 'current' }
UnixStore class >> isActiveClass [
	"This version of GemStone does not have any non-Unix VM platforms."

	OSPlatform isGemStoneSpecific.
	^ true
]

{ #category : 'public' }
UnixStore class >> isCaseSensitive [

	^ true
]

{ #category : 'public' }
UnixStore class >> maxFileNameLength [

	^ 255
]

{ #category : 'public' }
UnixStore >> checkName: aFileName fixErrors: fixing [
	"Check if the file name contains any invalid characters"
	| fName |
	fName := super checkName: aFileName fixErrors: fixing.
	
	(fName includes: self delimiter) ifFalse:
		[^fName].
	
	fixing ifFalse: [self error:'Invalid file name'].
	
	^ fName copyReplaceAll: self delimiter asString with: '#'
]
