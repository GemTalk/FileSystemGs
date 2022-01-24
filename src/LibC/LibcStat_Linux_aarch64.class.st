Class {
	#name : 'LibcStat_Linux_aarch64',
	#superclass : 'LibcStat_Linux',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStat_Linux_aarch64 >> fstatName [
	"Returns the name of the fstat function"

	^'fstat'
]

{ #category : 'accessing' }
LibcStat_Linux_aarch64 >> statName [
	"Returns the name of the stat function"

	^'__stat'
]

{ #category : 'accessing' }
LibcStat_Linux_aarch64 >> statStructClass [
	"Returns the class that should be used as StatStruct."

	^StatStruct_Linux_aarch64
]
