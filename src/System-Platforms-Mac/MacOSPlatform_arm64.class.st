Class {
	#name : 'MacOSPlatform_arm64',
	#superclass : 'MacOSPlatform',
	#category : 'System-Platforms-Mac'
}

{ #category : 'testing' }
MacOSPlatform_arm64 class >> isActivePlatform [

	^self isMacOS and: [self platformArchitecture = 'arm64']
]

{ #category : 'accessing' }
MacOSPlatform_arm64 >> libcDirentClass [

	^LibcDirent_macOS_arm64
]

{ #category : 'accessing' }
MacOSPlatform_arm64 >> libcStatClass [

	^LibcStat_macOS_arm64
]
