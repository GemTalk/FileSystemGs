Class {
	#name : 'TimespecStruct',
	#superclass : 'CStructure',
	#category : 'LibC'
}

{ #category : 'accessing' }
TimespecStruct class >> structSize [

	^16
]

{ #category : 'accessing' }
TimespecStruct >> asDateAndTime [

	^DateAndTime
		posixSeconds: self seconds
		offset: Duration zero
]

{ #category : 'accessing' }
TimespecStruct >> seconds [

	| nanosPerSecond nanos |
	nanosPerSecond := 1000000000.
	nanos := self tv_sec * nanosPerSecond + self tv_nsec.
	^ScaledDecimal
		numerator: nanos
		denominator: nanosPerSecond
		scale: 6

]

{ #category : 'accessing' }
TimespecStruct >> tv_nsec [

	^bytes int64At: 8
]

{ #category : 'accessing' }
TimespecStruct >> tv_sec [

	^bytes int64At: 0
]
