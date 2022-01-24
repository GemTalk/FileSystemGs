Class {
	#name : 'LibcStat_Linux_x64',
	#superclass : 'LibcStat_Linux',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStat_Linux_x64 >> fstatName [
	"Returns the name of the fstat function"

	^'__fxstat'
]

{ #category : 'accessing' }
LibcStat_Linux_x64 >> statName [
	"Returns the name of the stat function"

	^'__xstat'
]

{ #category : 'accessing' }
LibcStat_Linux_x64 >> statStructClass [
	"Returns the class that should be used as StatStruct."

	^StatStruct_Linux_x64
]
