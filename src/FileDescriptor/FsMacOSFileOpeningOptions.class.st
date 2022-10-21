"
Part of FileSystem

=========

This class provides constant values specific to macOS.
"
Class {
	#name : 'FsMacOSFileOpeningOptions',
	#superclass : 'FsUnixFileOpeningOptions',
	#category : 'FileDescriptor'
}

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_ACCMODE [

	^8r000000003
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_APPEND [

	^8r000000010
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_CLOEXEC [

	^8r100000000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_CREAT [

	^8r000001000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_DIRECTORY [

	^8r004000000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_DSYNC [

	^8r020000000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_EXCL [

	^8r4000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_NOCTTY [

	^8r400000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_NOFOLLOW [

	^8r400
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_NONBLOCK [

	^8r000000004
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_RDONLY [

	^8r000000000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_RDWR [

	^8r000000002
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_SYNC [

	^8r000000200
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_TRUNC [

	^8r000002000
]

{ #category : 'private-constants' }
FsMacOSFileOpeningOptions >> O_WRONLY [

	^8r000000001
]
