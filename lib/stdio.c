#include <stdio.h>

int gs_fs_rename(const char *oldpath, const char *newpath) {
  return rename(oldpath, newpath);
}
