Extension { #name : 'String' }

{ #category : '*filesystem-gemstone-kernel' }
String >> asPath [
	"convert myself to a path"
	"Examples:
		'.' asPath
		'~/Desktop' asPath
		'/home/foo' asPath
		'../../foo.bar' asPath"

	^ FileSystem disk resolve: self
]
