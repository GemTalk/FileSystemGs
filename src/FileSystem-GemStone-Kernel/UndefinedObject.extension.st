Extension { #name : 'UndefinedObject' }

{ #category : '*filesystem-gemstone-kernel' }
UndefinedObject >> isEmptyOrNil [
	"Answer whether the receiver contains any elements, or is nil.  Useful in numerous situations where one wishes the same reaction to an empty collection or to nil"

	^true
]
