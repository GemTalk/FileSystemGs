#include <sys/types.h>
#include <dirent.h>

DIR *gs_fs_opendir(const char *name) {
  return opendir(name);
}

int gs_fs_closedir(DIR *dirp) {
  return closedir(dirp);
}

struct dirent *gs_fs_readdir(DIR *dirp) {
  return readdir(dirp);
}

