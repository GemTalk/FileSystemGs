Extension { #name : 'SequenceableCollection' }

{ #category : '*filesystem-gemstone-kernel' }
SequenceableCollection >> readStreamPortable [

	^ ReadStreamPortable on: self

]

{ #category : '*filesystem-gemstone-kernel' }
SequenceableCollection >> reversed [
	"Answer a copy of the receiver with element order reversed."
	"Example: 'frog' reversed"

	| n result src |
	n := self size.
	result := self species new: n.
	src := n + 1.
	1 to: n do: [:i | result at: i put: (self at: (src := src - 1))].
	^ result

]
