Class {
	#name : 'LibcStat_macOS_arm64',
	#superclass : 'LibcStat_macOS',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStat_macOS_arm64 >> fstatName [
	"Returns the name of the fstat function"

	^'fstat'
]

{ #category : 'accessing' }
LibcStat_macOS_arm64 >> statName [
	"Returns the name of the stat function"

	^'stat'
]
