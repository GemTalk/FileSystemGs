"
Part of FileSystem

=========

Represents struct timespec
"
Class {
	#name : 'FsTimespecStruct',
	#superclass : 'FsCStructure',
	#category : 'FileSystem-LibC'
}

{ #category : 'accessing' }
FsTimespecStruct class >> structSize [

	^16
]

{ #category : 'accessing' }
FsTimespecStruct >> asDateAndTime [

	^DateAndTime
		posixSeconds: self seconds
		offset: Duration zero
]

{ #category : 'accessing' }
FsTimespecStruct >> seconds [

	| nanosPerSecond nanos |
	nanosPerSecond := 1000000000.
	nanos := self tv_sec * nanosPerSecond + self tv_nsec.
	^ScaledDecimal
		numerator: nanos
		denominator: nanosPerSecond
		scale: 6

]

{ #category : 'accessing' }
FsTimespecStruct >> tv_nsec [

	^bytes int64At: 8
]

{ #category : 'accessing' }
FsTimespecStruct >> tv_sec [

	^bytes int64At: 0
]
