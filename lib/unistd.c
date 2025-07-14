#include <unistd.h>

int gs_fs_chdir(const char *path) {
  return chdir(path);
}

int gs_fs_chown(const char *path, uid_t owner, gid_t group) {
  return chown(path, owner, group);
}

int gs_fs_close(int fd) {
  return close(fd);
}

int gs_fs_ftruncate(int fd, off_t length) {
  return ftruncate(fd, length);
}

char *gs_fs_getcwd(char *buf, size_t size) {
  return getcwd(buf, size);
}

off_t gs_fs_lseek(int fd, off_t offset, int whence) {
  return lseek(fd, offset, whence);
}

ssize_t gs_fs_pread(int fd, void *buf, size_t count, off_t offset) {
  return pread(fd, buf, count, offset);
}

ssize_t gs_fs_read(int fd, void *buf, size_t count) {
  return read(fd, buf, count);
}

int gs_fs_rmdir(const char *path) {
  return rmdir(path);
}

int gs_fs_symlink(const char *target, const char *linkpath) {
  return symlink(target, linkpath);
}

int gs_fs_unlink(const char *path) {
  return unlink(path);
}

ssize_t gs_fs_write(int fd, const void *buf, size_t count) {
  return write(fd, buf, count);
}

