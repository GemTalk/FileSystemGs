Class {
	#name : 'DirentStruct_macOS',
	#superclass : 'DirentStruct',
	#category : 'LibC'
}

{ #category : 'accessing' }
DirentStruct_macOS class >> structSize [
	"Returns the size in bytes of the C struct."

	^1048
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_fileno [

	^bytes uint64At: 0
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_name [
	"Retrieve the name of the entry, as a Smalltalk ByteArray.
	This may need to undergo decoding to make sense 
	in a filesystem that uses, for instance, UTF-8 encoding
	for filenames."

	| startIndex length |
	startIndex := 21.	"Offset of start of name string."
	length := self d_namlen.
	^bytes
		byteArrayFrom: startIndex
		to: startIndex + length - 1
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_namlen [

	^bytes uint16At: 18
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_reclen [

	^bytes uint16At: 16
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_seekoff [

	^bytes uint64At: 8
]

{ #category : 'accessing' }
DirentStruct_macOS >> d_type [

	^bytes uint8At: 20
]
