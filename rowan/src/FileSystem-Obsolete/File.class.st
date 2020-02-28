"
I represent a sequential binary File. I provide the minimum operations to:

- move the cursor fo the file
- reading
- writing

I am also the entry point of the FilePlugin primitives.

!Examples of usage

""Creating a file""
file := File named: 'asd.txt' asFileReference fullName.

""Opening / closing it""
file open.
file openForAppend.
file close.

""Accessing the file properties""
file size.
file position.
file position: 0.
file seekAbsolute: 10.
file seekRelative: 10.
file atEnd.

""Writing""
file nextPutAll: 'sdd'.

""Reading""
file next: 2.

""Buffered write""
file next: 2 putAll: 'abc' startingAt: 2.

""Buffered read""
buffer := ByteArray new: 5.
file readInto: buffer startingAt: 1 count: 5.
buffer asString.
"
Class {
	#name : 'File',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'FileSystem-Obsolete'
}
