Class {
	#name : 'LibcStat_Linux_aarch64',
	#superclass : 'LibcStat_Linux',
	#category : 'LibC'
}

{ #category : 'accessing' }
LibcStat_Linux_aarch64 >> statStructClass [
	"Returns the class that should be used as StatStruct."

	^StatStruct_Linux_aarch64
]
