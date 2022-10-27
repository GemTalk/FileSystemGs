"
Part of FileSystem

=========

Abstract UUID test cases
"
Class {
	#name : 'FsAbstractUUIDTest',
	#superclass : 'TestCase',
	#instVars : [
		'currentUuidGeneratorClass'
	],
	#category : 'Network-UUID-Tests'
}

{ #category : 'Testing' }
FsAbstractUUIDTest class >> isAbstract [
  "Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

  ^ self sunitName = #'FsAbstractUUIDTest'
]

{ #category : 'running' }
FsAbstractUUIDTest >> generatorClass [
  self subclassResponsibility
]

{ #category : 'running' }
FsAbstractUUIDTest >> setUp [
  super setUp.
  currentUuidGeneratorClass := FsUUID _generatorClass.
  FsUUID generatorClass: self generatorClass
]

{ #category : 'running' }
FsAbstractUUIDTest >> tearDown [
  super tearDown.
  FsUUID generatorClass: currentUuidGeneratorClass
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testComparison [
  "self debug: #testComparison"

  | a b |
  a := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df641'.
  b := FsUUID fromString: 'e85ae7ba-3ca3-4bae-9f62-cc2ce51c525e'.
  self assert: a < b.
  self deny: a > b.
  a := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df641'.
  b := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df642'.
  self assert: a < b.
  a := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df641'.
  b := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df640'.
  self assert: a > b
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testComparisonA [
  | a b |
  a := FsUUID fromString: '0608b9dc-02e4-4dd0-9f8a-ea45160df641'.
  b := FsUUID fromString: 'e85ae7ba-3ca3-4bae-9f62-cc2ce51c525e'.
  self assert: a = a copy.
  self assert: b = b copy.
  self assert: a < b.
  self assert: b > a.
  self deny: a > b = (b > a)
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreation [
  | uuid |
  uuid := FsUUID new.
  self should: [ uuid size = 16 ].
  self shouldnt: [ uuid isNilUUID ].
  self should: [ uuid asString size = 36 ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreationEquality [
  | uuid1 uuid2 |
  uuid1 := FsUUID new.
  uuid2 := FsUUID new.
  self should: [ uuid1 = uuid1 ].
  self should: [ uuid2 = uuid2 ].
  self shouldnt: [ uuid1 = uuid2 ].
  self shouldnt: [ uuid1 hash = uuid2 hash ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreationFromString [
  | uuid string |
  string := FsUUID nilUUID asString.
  uuid := FsUUID fromString: string.
  self should: [ uuid size = 16 ].
  self should: [ uuid = FsUUID nilUUID ].
  self should: [ uuid isNilUUID ].
  self should: [ uuid asString size = 36 ].
  self should: [ uuid asArray asSet size = 1 ].
  self should: [ (uuid asArray asSet asArray at: 1) = 0 ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreationFromStringNotNil [
  | uuid string |
  string := FsUUID new asString.
  uuid := FsUUID fromString: string.
  self should: [ uuid size = 16 ].
  self should: [ uuid asString size = 36 ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreationNil [
  | uuid |
  uuid := FsUUID nilUUID.
  self should: [ uuid size = 16 ].
  self should: [ uuid isNilUUID ].
  self should: [ uuid asString size = 36 ].
  self should: [ uuid asArray asSet size = 1 ].
  self should: [ (uuid asArray asSet asArray at: 1) = 0 ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testCreationNodeBased [
  (FsUUID new asString copyLast: 12) = (FsUUID new asString copyLast: 12)
    ifFalse: [ ^ self ].
  1000
    timesRepeat: [ 
      | uuid |
      uuid := FsUUID new.
      self should: [ ((uuid at: 7) bitAnd: 16rF0) = 16r10 ].
      self should: [ ((uuid at: 9) bitAnd: 16rC0) = 16r80 ] ]

]

{ #category : 'tests' }
FsAbstractUUIDTest >> testDuplicationsKinda [
  | check size |
  size := 5000.
  check := Set new: size.
  size
    timesRepeat: [ 
      | uuid |
      uuid := FsUUID new.
      self shouldnt: [ check includes: uuid ].
      check add: uuid ]
]

{ #category : 'tests' }
FsAbstractUUIDTest >> testOrder [
  100
    timesRepeat: [ 
      | uuid1 uuid2 |
      uuid1 := FsUUID new.
      uuid2 := FsUUID new.
      (uuid1 asString copyLast: 12) = (uuid2 asString copyLast: 12)
        ifTrue: [ 
          self should: [ uuid1 < uuid2 ].
          self should: [ uuid2 > uuid1 ].
          self shouldnt: [ uuid1 = uuid2 ] ] ]

]

{ #category : 'tests' }
FsAbstractUUIDTest >> testUniqueness [
  "Test uniqueness for a given number of generated values"

  | maxTestValue |
  maxTestValue := 1000.
  self
    assert:
      ((1 to: maxTestValue) collect: [ :i | FsUUID new asString ]) asSet size
        = maxTestValue
]
