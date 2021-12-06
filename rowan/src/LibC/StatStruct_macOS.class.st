Class {
	#name : 'StatStruct_macOS',
	#superclass : 'StatStruct',
	#category : 'LibC'
}

{ #category : 'accessing' }
StatStruct_macOS class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]
