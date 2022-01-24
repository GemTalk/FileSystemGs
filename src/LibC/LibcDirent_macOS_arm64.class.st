Class {
	#name : 'LibcDirent_macOS_arm64',
	#superclass : 'LibcDirent_macOS',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcDirent_macOS_arm64 >> opendirName [
	"Returns the name of the opendir function"

	^'opendir'
]

{ #category : 'accessing' }
LibcDirent_macOS_arm64 >> readdirName [
	"Returns the name of the readdir function"

	^'readdir'
]
