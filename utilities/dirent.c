/*
 *
 * The purpose of this program is to invoke each function in dirent.h, that we use.
 * Doing so allows us to figure out how function are invoked by the C compiler.
 *
 * This also serves as a means of obtaining the structure offsets for each platform
 * for structures of interest.
 *
 */

#include <sys/stat.h>
#include <stddef.h>
#include <stdio.h>
#include <dirent.h>

int main() {
  struct dirent root;

  printf("dirent\n\tsize:%ld\n", sizeof(struct dirent));
#ifdef __APPLE__
  printf("dirent.d_fileno\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_fileno), sizeof(root.d_fileno));
  printf("dirent.d_seekoff\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_seekoff), sizeof(root.d_seekoff));
  printf("dirent.d_reclen\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_reclen), sizeof(root.d_reclen));
  printf("dirent.d_namlen\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_namlen), sizeof(root.d_namlen));
  printf("dirent.d_type\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_type), sizeof(root.d_type));
  printf("dirent.d_name\n\toffset: %ld\n\tsize: %ld\n", offsetof(struct dirent, d_name), sizeof(root.d_name));
#else
#endif

  return 0;
}
