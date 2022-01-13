Class {
	#name : 'MacOSFileOpeningOptions',
	#superclass : 'UnixFileOpeningOptions',
	#category : 'FileDescriptor'
}

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_ACCMODE [

	^8r000000003
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_APPEND [

	^8r000000010
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_CLOEXEC [

	^8r100000000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_CREAT [

	^8r000001000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_DIRECTORY [

	^8r004000000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_DSYNC [

	^8r020000000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_EXCL [

	^8r4000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_NOCTTY [

	^8r400000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_NOFOLLOW [

	^8r400
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_NONBLOCK [

	^8r000000004
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_RDONLY [

	^8r000000000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_RDWR [

	^8r000000002
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_SYNC [

	^8r000000200
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_TRUNC [

	^8r000002000
]

{ #category : 'private-constants' }
MacOSFileOpeningOptions >> O_WRONLY [

	^8r000000001
]
