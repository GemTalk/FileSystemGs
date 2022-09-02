# FileSystem Target

FileSystem doesn't have an standard document describing the classes and methods that are required. This document intends to provide some structure to the FileSystem implementation in GemStone.

Pharo 10's FileSystem implementation will serve as our development target. Not all classes or methods from the Pharo implementation will exist in GemStone.

## Shared Interface

The classes provided in the list below server as interfaces GemStone will implement. Methods are not explicitly enumerated due to both number of methods and the likelihood of them changing. GemStone will provide critical high-level methods. It may not include methods like `FileLocator class>>#A` since this is a Windows construct. 

- AbstractFileReference
  - FileLocator
  - FileReference
- FileSystem
- FileSystemResolver
  - PlatformResolver
    - MacOSResolver
    - UnixResolver
  - SystemResolver
- FileSystemError
  - DirectoryDoesNotExist
  - DirectoryExists
  - DirectoryIsNotEmpty
  - FileExists
  - IllegalName
- FileSystemPermission
- DiskStore
  - UnixStore
  - MemoryStore
- Path
  - AbsolutePath
  - RelativePath

Classes outside of this list are considered implementation details and may or may not exist in GemStone. Additionally, GemStone may subclass any of the above classes to implement the associated functionality.

## MemoryFileSystem

GemStone will support MemoryFileSystem. The internal details may differ between GemStone and Pharo.

## Rational for Excluded Classes

### FileSystemDirectoryEntry

This class serves as a cache for metadata about a file system entry. Generally, I didn't see this as an immediate requirement. GemStone does internally use an instance of the Stat struct to access most of this information. We could expose this in the future. Before introducing this interface, I would want to see a real-life use case for this particular functionality.

Users can access this information, with additional FFI cost, via FileReference.
