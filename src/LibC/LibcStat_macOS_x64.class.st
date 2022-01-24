Class {
	#name : 'LibcStat_macOS_x64',
	#superclass : 'LibcStat_macOS',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStat_macOS_x64 >> fstatName [
	"Returns the name of the fstat function"

	^'fstat$INODE64'
]

{ #category : 'accessing' }
LibcStat_macOS_x64 >> statName [
	"Returns the name of the stat function"

	^'stat$INODE64'
]
