/*
 *
 * The purpose of this program is to invoke each function in stat.h, that we use.
 * Doing so allows us to figure out how function are invoked by the C compiler.
 *
 * This also serves as a means of obtaining the structure offsets for each platform
 * for structures of interest.
 *
 */

#include <sys/stat.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include "utils.h"

int main() {
  struct stat *root = calloc(1, sizeof(struct stat));
  struct timespec *time = calloc(1, sizeof(struct timespec));

  int result = mkdir("/tmp/test.dir", 0777);
  result = fstat(0, root);
  result = stat("/", root);

  StructDetail(struct stat);
  MemberDetail(struct stat, root, st_dev);
  MemberDetail(struct stat, root, st_ino);
  MemberDetail(struct stat, root, st_mode);
  MemberDetail(struct stat, root, st_nlink);
  MemberDetail(struct stat, root, st_uid);
  MemberDetail(struct stat, root, st_gid);
  MemberDetail(struct stat, root, st_rdev);
  MemberDetail(struct stat, root, st_size);
  MemberDetail(struct stat, root, st_blksize);
  MemberDetail(struct stat, root, st_blocks);
#ifdef __APPLE__
  MemberDetail(struct stat, root, st_atimespec);
  MemberDetail(struct stat, root, st_mtimespec);
  MemberDetail(struct stat, root, st_ctimespec);
#else
  MemberDetail(struct stat, root, st_atim);
  MemberDetail(struct stat, root, st_mtim);
  MemberDetail(struct stat, root, st_ctim);
#endif

  StructDetail(struct timespec);
  MemberDetail(struct timespec, time, tv_sec);
  MemberDetail(struct timespec, time, tv_nsec);

  ConstDetail(S_IFMT);
  ConstDetail(S_IFIFO);
  ConstDetail(S_IFCHR);
  ConstDetail(S_IFDIR);
  ConstDetail(S_IFBLK);
  ConstDetail(S_IFREG);
  ConstDetail(S_IFLNK);
  ConstDetail(S_IFSOCK);

  return result;
}
