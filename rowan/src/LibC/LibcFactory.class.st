"
Utility to re-generate the Libc classes.
"
Class {
	#name : 'LibcFactory',
	#superclass : 'Object',
	#category : 'LibC'
}

{ #category : 'private' }
LibcFactory class >> classNameForHeaderName: headerName [
	"private"

	| readStream writeStream prefix character |
	readStream := ReadStream on: headerName.
	prefix := '_libc'.
	writeStream := WriteStream on: (String new: headerName size + prefix size).
	writeStream nextPutAll: prefix.	"Upcase first character of header name"
	writeStream nextPut: readStream next asUppercase.
	[ readStream atEnd not and: [ (character := readStream next) isAlphabetic ] ]
		whileTrue: [ writeStream nextPut: character ].
	^ writeStream contents
]

{ #category : 'Utility' }
LibcFactory class >> generateFcntl [
	"LibcFactory generateFcntl"

	self generateFromHeader: 'fcntl.h'
]

{ #category : 'private' }
LibcFactory class >> generateFromHeader: headerName [
	"private"

	| className headerPath libraryPath packageName header wrapperClass |
	headerPath := '/usr/include/' , headerName.
	className := self classNameForHeaderName: headerName.
	libraryPath := '/lib64/libc.so.6'.	"You may need to change the path to libc, which varies by Linux distribution."
	packageName := 'LibC'.

	header := CHeader path: headerPath.
	wrapperClass := header
		wrapperNamed: className
		forLibraryAt: libraryPath
		select: nil.
	wrapperClass
		category: packageName;
		initializeFunctions.
	UserGlobals at: wrapperClass name put: wrapperClass.
	Rowan packageTools adopt
		adoptClassNamed: className
		intoPackageNamed: packageName
]

{ #category : 'Utility' }
LibcFactory class >> generateUnistd [
	"LibcFactory generateUnistd"

	self generateFromHeader: 'unistd.h'
]
