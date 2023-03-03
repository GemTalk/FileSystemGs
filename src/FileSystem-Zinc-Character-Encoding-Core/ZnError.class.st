"
Part of FileSystem

=========

I server as a common superclass for all Zinc related Error classes.
"
Class {
	#name : 'ZnError',
	#superclass : 'Error',
	#category : 'FileSystem-Zinc-Character-Encoding-Core'
}

{ #category : 'Instance initialization' }
ZnError >> initialize [
  super initialize .
  gsNumber := ERR_ZnError .

]
