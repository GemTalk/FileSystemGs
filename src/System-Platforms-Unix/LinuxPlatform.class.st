Class {
	#name : 'LinuxPlatform',
	#superclass : 'UnixPlatform',
	#category : 'System-Platforms-Unix'
}

{ #category : 'accessing' }
LinuxPlatform >> libcDirentClass [

	^LibcDirent_Linux
]

{ #category : 'accessing' }
LinuxPlatform >> libcFcntlClass [

	^LibcFcntl_Linux
]

{ #category : 'accessing' }
LinuxPlatform >> libcStatClass [

	self subclassResponsibility
]

{ #category : 'accessing' }
LinuxPlatform >> libcStdioClass [

	^LibcStdio_Linux
]

{ #category : 'accessing' }
LinuxPlatform >> libcUnistdClass [

	^LibcUnistd_Linux
]
