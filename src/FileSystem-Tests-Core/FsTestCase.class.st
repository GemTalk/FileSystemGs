Class {
	#name : 'FsTestCase',
	#superclass : 'GsTestCase',
	#category : 'FileSystem-Tests-Core'
}

{ #category : 'testing' }
FsTestCase class >> isAbstract [
	^ self name = #FsTestCase
]

{ #category : 'Running' }
FsTestCase class >> runEx [
	"receiver should be a concrete test case class.
 Use  runExExpectPassed: to avoid error on number of test cases passed."

	^ self runEx: self expectPassed: 1000000	"expect an error"
]

{ #category : 'Running' }
FsTestCase class >> runEx: aTestCaseClass [
	"Use  runEx:ExpectPassed: to avoid error on number of test cases passed."

	^ self runEx: aTestCaseClass expectPassed: 1000000	"expect an error"
]

{ #category : 'Running' }
FsTestCase class >> runEx: aTestCaseClass expectPassed: anInteger [
	| results defects str |
	AlmostOutOfMemoryError
		enable;
		threshold: 90.
	results := aTestCaseClass suite run.
	defects := results defects.
	defects size > 0
		ifTrue: [ 
			(str := '=========== Failed test cases' copy) lf.
			defects
				do: [ :each | 
					str
						addAll: each printString;
						lf ].
			str
				add: '===========';
				lf.
			System clientIsRemote
				ifTrue: [ Error signal: str ]
				ifFalse: [ GsFile gciLogServer: str ] ].
	results passedCount < anInteger
		ifTrue: [ 
			Error
				signal:
					'expected passed >= ' , anInteger asString , ' got: ' , results printString ].
	defects size == 0
		ifTrue: [ ^ results printString ]
		ifFalse: [ 
			Error
				signal:
					results passedCount asString , ' test cases passed, Some test cases failed: ' ]
]
