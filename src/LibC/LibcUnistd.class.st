Class {
	#name : 'LibcUnistd',
	#superclass : 'LibcInterface',
	#category : 'LibC'
}

{ #category : 'functions' }
LibcUnistd >> closeFd: fdInteger [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> getCurrentDirName [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> lseek: descriptor
offset: offset
whence: whence [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> readFromFileDescriptor: fd toBuffer: buf count: bytes [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> rmdir: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> truncate: fileDescriptor
to: length [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> unlinkPath: pathString [

	self subclassResponsibility
]

{ #category : 'functions' }
LibcUnistd >> writeToFileDescriptor: fd fromBuffer: buf count: bytes [

	self subclassResponsibility
]
