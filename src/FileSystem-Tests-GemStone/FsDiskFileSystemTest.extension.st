Extension { #name : 'FsDiskFileSystemTest' }

{ #category : '*filesystem-tests-gemstone' }
FsDiskFileSystemTest >> testGsDeleteDirectoryOnError [

	| path |
	path := Path * 'plonk' / 'griffle'.
	self markForCleanup: path.
	self markForCleanup: path parent.
	filesystem ensureCreateDirectory: path.
	self assert: (filesystem isDirectory: Path * 'plonk').
	self assert: (filesystem isDirectory: path).

	self should: [ filesystem delete: path parent ] raise: Error.
]
