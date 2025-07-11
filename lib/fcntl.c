#include <sys/types.h>
#include <fcntl.h>

int gs_fs_open(const char *pathname, int flags) {
  return open(pathname, flags);
}

