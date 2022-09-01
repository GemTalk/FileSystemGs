Class {
	#name : 'LinuxStore',
	#superclass : 'UnixStore',
	#category : 'FileSystem-Disk'
}

{ #category : 'accessing' }
LinuxStore >> maxFileNameLength [
	"Returns the max file name length"

	^4096
]
