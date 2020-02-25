"
Abstract superclass for classes representing structures in external memory.
Typically, these are represented in C as struct types. They have named fields of various types.
Subclasses of this class provide the ability to read and write individual fields, and to allocate and free
instances of the structure.

bytes is an instance of CByteArray, and therefore in external memory.
"
Class {
	#name : 'CStructure',
	#superclass : 'Object',
	#instVars : [
		'bytes'
	],
	#category : 'LibC'
}
