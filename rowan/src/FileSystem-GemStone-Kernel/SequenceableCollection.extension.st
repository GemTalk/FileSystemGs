Extension { #name : 'SequenceableCollection' }

{ #category : '*filesystem-gemstone-kernel' }
SequenceableCollection >> readStreamPortable [

	^ ReadStreamPortable on: self

]
