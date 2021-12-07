/*
 *
 * The purpose of this program is to calculate the size and offset of fields within struct stat.
 * Not all fields are necessarily of interest and all may not be included.
 * It also provides an example calling of the stat function to determine if stat is a macro or function.
 *
 */

#include <sys/stat.h>
#include <stddef.h>
#include <stdio.h>

int main() {
  struct stat root;

  int result = stat("/", &root);

  printf("stat\n\tsize:%ld\n", sizeof(struct stat));
  printf("stat.st_dev\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_dev), sizeof(root.st_dev));
  printf("stat.st_ino\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_ino), sizeof(root.st_ino));
  printf("stat.st_mode\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_mode), sizeof(root.st_mode));
  printf("stat.st_nlink\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_nlink), sizeof(root.st_nlink));
  printf("stat.st_uid\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_uid), sizeof(root.st_uid));
  printf("stat.st_gid\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_gid), sizeof(root.st_gid));
  printf("stat.st_rdev\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_rdev), sizeof(root.st_rdev));
  printf("stat.st_size\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_size), sizeof(root.st_size));
  printf("stat.st_blksize\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_blksize), sizeof(root.st_blksize));
  printf("stat.st_blocks\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_blocks), sizeof(root.st_blocks));
#ifdef __APPLE__
  printf("stat.st_atimespec\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_atimespec), sizeof(root.st_atimespec));
  printf("stat.st_mtimespec\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_mtimespec), sizeof(root.st_mtimespec));
  printf("stat.st_ctimespec\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_ctimespec), sizeof(root.st_ctimespec));
#else
  printf("stat.st_atim\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_atim), sizeof(root.st_atim));
  printf("stat.st_mtim\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_mtim), sizeof(root.st_mtim));
  printf("stat.st_ctim\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct stat, st_ctim), sizeof(root.st_ctim));
#endif

  printf("s_ifmt:   %07o\n", S_IFMT);
  printf("s_ififo:  %07o\n", S_IFIFO);
  printf("s_ifchr:  %07o\n", S_IFCHR);
  printf("s_ifdir:  %07o\n", S_IFDIR);
  printf("s_ifblk:  %07o\n", S_IFBLK);
  printf("s_ifreg:  %07o\n", S_IFREG);
  printf("s_iflnk:  %07o\n", S_IFLNK);
  printf("s_ifsock: %07o\n", S_IFSOCK);

  return result;
}
