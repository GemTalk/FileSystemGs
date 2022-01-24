Class {
	#name : 'StatStruct_Linux_x64',
	#superclass : 'StatStruct_Linux',
	#category : 'LibC'
}

{ #category : 'accessing' }
StatStruct_Linux_x64 class >> structSize [
	"Returns the size in bytes of the C struct."

	^144
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_blksize [

	^bytes uint64At: 56
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_gid [

	^bytes uint32At: 32
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_mode [

	^bytes uint32At: 24
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_nlink [

	^bytes uint64At: 16
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_rdev [

	^bytes uint64At: 40
]

{ #category : 'private-accessing' }
StatStruct_Linux_x64 >> st_uid [

	^bytes uint32At: 28
]
