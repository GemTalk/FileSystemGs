Extension { #name : 'Collection' }

{ #category : '*filesystem-gemstone-kernel' }
Collection >> ifEmpty: aBlock [
  self size == 0
    ifTrue: [ ^ aBlock value ]

]
