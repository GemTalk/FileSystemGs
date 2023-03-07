"
Part of FileSystem

=========

Abstract superclass for errno errors
"
Class {
	#name : 'FsUnixError',
	#superclass : 'Error',
	#category : 'LibC'
}

{ #category : 'class initialization' }
FsUnixError class >> classLookupTable [

	^SessionTemps current
		at: #'GsCurrentUnixErrorClassLookupTable'
		ifAbsentPut: [self initializeClassLookupTable]
]

{ #category : 'accessing' }
FsUnixError class >> errorClassForErrorNumber: errorNumber [
	^self classLookupTable at: errorNumber
]

{ #category : 'accessing' }
FsUnixError class >> errorNumber [
	self subclassResponsibility
]

{ #category : 'class initialization' }
FsUnixError class >> initializeClassLookupTable [
	"Create a table used to lookup a the UnixError class based on errno."

	| table organizer mySubclasses |
	table := KeyValueDictionary new.
	organizer := ClassOrganizer newWithRoot: self.
	mySubclasses := organizer allSubclassesOf: self.
	mySubclasses
		do: [ :subclass | 
			| errorNumber existing |
			errorNumber := subclass errorNumber.
			existing := table at: errorNumber ifAbsent: [  ].
			existing
				ifNotNil: [ :otherClass | 
					Error
						signal:
							subclass printString , ' and ' , otherClass printString
								, ' both attempting to use error number ' , errorNumber printString ].
			table at: errorNumber put: subclass ].
	^table
]

{ #category : 'initialize' }
FsUnixError >> initialize [

	super initialize.
	gsNumber := ERR_FsUnixError
]
