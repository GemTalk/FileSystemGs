"
Bad file number
"
Class {
	#name : 'EBADF',
	#superclass : 'UnixError',
	#category : 'LibC'
}

{ #category : 'accessing' }
EBADF class >> errorNumber [
	^ 9
]
