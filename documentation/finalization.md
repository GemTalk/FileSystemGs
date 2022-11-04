# Finalization in FileSystem

FileSystem is implemented using GemStone's FFI. Resources are allocated outside of POM and LOM. Special handling is required to ensure this memory is freed after use.

## Structures

| Structure       | Garbage Collection                                             |
|---              |---                                                             |
| struct dirent   | None - man page says you should not call `free`                |
| struct stat     | Created using #gcMalloc:                                       |
| struct timespec | Created using #CByteArrayFrom:to: which is automatically freed |

## File Descriptors

The `open` system call returns a SmallInteger which represents the open file. This isn't great as it makes it awkward to add behavior to the file descriptor. We wrap this low-level file descriptor with the class FsFileDescriptor. When the associated instance of FsFileDescriptor is garbage colleged, we need to also free the file descriptor we received from the system.

Ephemerons provide a solution to this in GemStone but they come with a challenge.

### Ephemeron Finalization

When an Ephemeron is the last remaining reference to an Object, the Ephemeron is mourned. The active Process is interrupted and #mourn is sent using this process and the associated stack. The Registry of Ephemerons needs to be both thread-safe as well as reentrant.

### Thread-safe Registry Handling

FsFileDescriptorRegistry exploits GemStone's interrupt mechanism. Interrupt windows open at the start of each activation and on each back-branch. Process swaps and Ephemeron mourning require an interrupt window before they can happen.

We use an Array for basic storage. Each Ephemeron is associated with an index into the Array. The two basic operations are written in such a way that interrupt windows are not opened during critical sections. Concurrent operations can take place outside of the critical sections. Details of the implementation can be viewed in FsFileDescriptorRegistry.
