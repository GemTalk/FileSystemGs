Extension { #name : 'PositionableStreamPortable' }

{ #category : '*filesystem-gemstone-kernel' }
PositionableStreamPortable >> isBinary [
	"Return true if the receiver is a binary byte stream"
	^collection class == ByteArray

]
