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

int main() {
  DIR* root = opendir("/");
  struct dirent *rootEntry = readdir(root);
  int result = closedir(root);

  printf("dirent\n\tsize:%ld\n", sizeof(struct dirent));
#ifdef __APPLE__
  printf("dirent.d_fileno\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_fileno), sizeof(rootEntry->d_fileno));
  printf("dirent.d_seekoff\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_seekoff), sizeof(rootEntry->d_seekoff));
  printf("dirent.d_reclen\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_reclen), sizeof(rootEntry->d_reclen));
  printf("dirent.d_namlen\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_namlen), sizeof(rootEntry->d_namlen));
  printf("dirent.d_type\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_type), sizeof(rootEntry->d_type));
  printf("dirent.d_name\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_name), sizeof(rootEntry->d_name));
#else
#endif

  return result;
}
