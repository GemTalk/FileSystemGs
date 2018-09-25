Extension { #name : 'SequenceableCollection' }

{ #category : '*filesystem-gemstone-kernel' }
SequenceableCollection >> copyLast: n [
	"Answer the last n elements of the receiver.  
	Raise an error if there are not enough elements."

	| size |
	size := self size.
	^ self copyFrom: size - n + 1 to: size

]

{ #category : '*filesystem-gemstone-kernel' }
SequenceableCollection >> grownBy: length [
	"Answer a copy of receiver collection with size grown by length"

	| newCollection size |
	size := self size.
	newCollection := self species new: size + length.
	newCollection replaceFrom: 1 to: size with: self startingAt: 1.
	^ newCollection

]

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
