/*
 *
 * This programs calculates various details about
 * functions, constants, and structs in <fcntl.h>
 *
 */
#include <stddef.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include "utils.h"

int main() {

  ConstDetail(O_CREAT);
  ConstDetail(O_EXCL);
  ConstDetail(O_NOCTTY);
  ConstDetail(O_TRUNC);
//  ConstDetail(O_TTY_INIT);

  ConstDetail(O_APPEND);
  ConstDetail(O_DSYNC);
  ConstDetail(O_NONBLOCK);
//  ConstDetail(O_RSYNC);
  ConstDetail(O_SYNC);

  ConstDetail(O_ACCMODE);
//  ConstDetail(O_EXEC);
  ConstDetail(O_RDONLY);
  ConstDetail(O_RDWR);
//  ConstDetail(O_SEARCH);
  ConstDetail(O_WRONLY);

  ConstDetail(O_CLOEXEC);
  ConstDetail(O_DIRECTORY);
  ConstDetail(O_NOFOLLOW);

  int fd = open("/tmp/test.dir", O_WRONLY|O_CREAT, 0777);
  return fd;
}
