Extension { #name : 'Character' }

{ #category : '*filesystem-gemstone-kernel' }
Character class >> digitValue: x [
	"Answer the Character whose digit value is x. For example,
	 answer $9 for x=9, $0 for x=0, $A for x=10, $Z for x=35."

	| n |
	n := x asInteger.
	^self withValue: (n < 10 ifTrue: [n + 48] ifFalse: [n + 55])
]
