Class {
	#name : 'StatStruct_Linux_aarch64',
	#superclass : 'StatStruct_Linux',
	#category : 'LibC'
}

{ #category : 'accessing' }
StatStruct_Linux_aarch64 class >> structSize [
	"Returns the size in bytes of the C struct."

	^128
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_blksize [

	^bytes uint32At: 56
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_gid [

	^bytes uint32At: 28
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_mode [

	^bytes uint32At: 16
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_nlink [

	^bytes uint32At: 20
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_rdev [

	^bytes uint64At: 32
]

{ #category : 'private-accessing' }
StatStruct_Linux_aarch64 >> st_uid [

	^bytes uint32At: 24
]
