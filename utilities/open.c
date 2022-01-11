/*
 *
 * The purpose of this program is to calculate the values associated with
 * various open flags.
 *
 */

#include <stddef.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "utils.h"

int main() {

  ConstDetail(O_RDONLY);
  ConstDetail(O_WRONLY);
  ConstDetail(O_RDWR);
  ConstDetail(O_APPEND);
  ConstDetail(O_CREAT);
  ConstDetail(O_TRUNC);
  ConstDetail(O_EXCL);
  ConstDetail(O_SHLOCK);
  ConstDetail(O_EXLOCK);
  ConstDetail(O_NOFOLLOW);
  ConstDetail(O_SYMLINK);
  ConstDetail(O_EVTONLY);
  ConstDetail(O_CLOEXEC);
  ConstDetail(O_ACCMODE);
  ConstDetail(O_SYNC);
  ConstDetail(O_ASYNC);
  ConstDetail(O_DSYNC);
  ConstDetail(O_DIRECTORY);
  ConstDetail(O_NOCTTY);
  ConstDetail(O_NONBLOCK);
#ifdef __APPLE__

#else
  ConstDetail(O_NOATIME);
  ConstDetail(O_PATH);
  ConstDetail(O_TMPFILE);
#endif

  ConstDetail(O_WRONLY|O_CREAT);
  int fd = open("/tmp/test.dir", O_WRONLY|O_CREAT, 0777);

  return fd;
}
