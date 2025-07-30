#include <sys/stat.h>

int gs_fs_chmod(const char *pathname, mode_t mode) {
  return chmod(pathname, mode);
}

int gs_fs_fstat(int fd, struct stat *statbuf) {
  return fstat(fd, statbuf);
}

int gs_fs_lstat(const char *pathname, struct stat *statbuf) {
  return lstat(pathname, statbuf);
}

int gs_fs_stat(const char *pathname, struct stat *statbuf) {
  return stat(pathname, statbuf);
}

int gs_fs_mkdir(const char *pathname, mode_t mode) {
  return mkdir(pathname, mode);
}
