"
I delete the directory tree that I visit. I use the PostorderGuide so that I can delete files before deleting their containing directories.
"
Class {
	#name : 'DeleteVisitor',
	#superclass : 'FileSystemVisitor',
	#category : 'FileSystem-Core'
}

{ #category : 'instance creation' }
DeleteVisitor class >> delete: aReference [
	^ self new visit: aReference
]

{ #category : 'visiting' }
DeleteVisitor >> visit: aReference [
	PostorderGuide 
		show: aReference 
		to: self 
		selecting: [ :reference | reference isSymlink not ]
]

{ #category : 'visiting' }
DeleteVisitor >> visitReference: aReference [

	aReference delete
]
