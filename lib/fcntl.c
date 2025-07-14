#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int gs_fs_open(const char *pathname, int flags, mode_t mode) {
  return open(pathname, flags, mode);
}

