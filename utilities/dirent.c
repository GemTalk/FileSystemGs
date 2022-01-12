/*
 *
 * This programs calculates various details about
 * functions, constants, and structs in <fcntl.h>
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
