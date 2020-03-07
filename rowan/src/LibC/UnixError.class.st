Class {
	#name : 'UnixError',
	#superclass : 'Error',
	#classInstVars : [
		'classesByNumber'
	],
	#category : 'LibC'
}

{ #category : 'accessing' }
UnixError class >> errorClassForErrorNumber: errorNumber [
	^ classesByNumber at: errorNumber
]

{ #category : 'accessing' }
UnixError class >> errorNumber [
	self subclassResponsibility
]

{ #category : 'class initialization' }
UnixError class >> initialize [
	"UnixError initialize"

	| organizer mySubclasses |
	classesByNumber := KeyValueDictionary new.
	organizer := ClassOrganizer newWithRoot: self.
	mySubclasses := organizer allSubclassesOf: self.
	mySubclasses
		do: [ :subclass | 
			| errorNumber existing |
			errorNumber := subclass errorNumber.
			existing := classesByNumber at: errorNumber ifAbsent: [  ].
			existing
				ifNotNil: [ :otherClass | 
					Error
						signal:
							subclass printString , ' and ' , otherClass printString
								, ' both attempting to use error number ' , errorNumber printString ].
			classesByNumber at: errorNumber put: subclass ]
]
