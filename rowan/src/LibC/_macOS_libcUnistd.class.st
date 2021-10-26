Class {
	#name : '_macOS_libcUnistd',
	#superclass : '_libcUnistd',
	#category : 'LibC'
}

{ #category : 'accessing' }
_macOS_libcUnistd class >> libraryName [

	^'/usr/lib/system/libsystem_c.dylib'
]
