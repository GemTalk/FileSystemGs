"
Part of FileSystem

=========

I am ZnCharacterEncodingError.
I am an Error.

I signal when something goes wrong while encoding or decoding characters.

Part of Zinc HTTP Components
"
Class {
	#name : 'ZnCharacterEncodingError',
	#superclass : 'ZnError',
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'Instance initialization' }
ZnCharacterEncodingError >> initialize [
  super initialize .
  gsNumber := ERR_ZnCharacterEncodingError .

]
