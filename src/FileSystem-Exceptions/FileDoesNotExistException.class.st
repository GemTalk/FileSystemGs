"
Part of FileSystem

=========

I am raised when an operation is attempted on a file that does not exist.

The method used to signal the exception depends on the form the file name exists in:

- For strings: (FileDoesNotExistException file fileName: aString) signal 
- For Files: FileDoesNotExistException signalOnFile: aFile
- For FileReferences: FileDoesNotExistException signalWith: aFileReference


Applications that want to offer the user the opportunity to select a different file can use:

	UIManager default fileDoesNotExistsDefaultAction: exception
"
Class {
	#name : 'FileDoesNotExistException',
	#superclass : 'FileException',
	#category : 'FileSystem-Exceptions'
}

{ #category : 'Instance initialization' }
FileDoesNotExistException >> initialize [
  super initialize .
  gsNumber := ERR_FileDoesNotExistException .

]
