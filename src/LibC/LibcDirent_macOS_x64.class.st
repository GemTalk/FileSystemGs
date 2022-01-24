Class {
	#name : 'LibcDirent_macOS_x64',
	#superclass : 'LibcDirent_macOS',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcDirent_macOS_x64 >> opendirName [
	"Returns the name of the opendir function"

	^'opendir$INODE64'
]

{ #category : 'accessing' }
LibcDirent_macOS_x64 >> readdirName [
	"Returns the name of the readdir function"

	^'readdir$INODE64'
]
