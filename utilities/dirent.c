/*
 *
 * The purpose of this program is to invoke each function in dirent.h, that we use.
 * Doing so allows us to figure out how function are invoked by the C compiler.
 *
 * This also serves as a means of obtaining the structure offsets for each platform
 * for structures of interest.
 *
 */

#include <stddef.h>
#include <stdio.h>
#include <dirent.h>
#include "utils.h"

int main() {
  DIR* root = opendir("/");
  struct dirent *rootEntry = readdir(root);
  int result = closedir(root);

  StructDetail(struct dirent);
#ifdef __APPLE__
  MemberDetail(struct dirent, rootEntry, d_fileno);
  MemberDetail(struct dirent, rootEntry, d_seekoff);
  MemberDetail(struct dirent, rootEntry, d_reclen);
  MemberDetail(struct dirent, rootEntry, d_namlen);
  MemberDetail(struct dirent, rootEntry, d_type);
  MemberDetail(struct dirent, rootEntry, d_name);
#else
  MemberDetail(struct dirent, rootEntry, d_ino);
  MemberDetail(struct dirent, rootEntry, d_off);
  MemberDetail(struct dirent, rootEntry, d_reclen);
  MemberDetail(struct dirent, rootEntry, d_type);
  MemberDetail(struct dirent, rootEntry, d_name);
#endif

  return result;
}
