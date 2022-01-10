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

int main() {

  printf("O_RDONLY\n\tvalue:%07o\n", O_RDONLY);
  printf("O_WRONLY\n\tvalue:%07o\n", O_WRONLY);
  printf("O_RDWR\n\tvalue:%07o\n", O_RDWR);
  printf("O_NONBLOCK\n\tvalue:%07o\n", O_NONBLOCK);
  printf("O_APPEND\n\tvalue:%07o\n", O_APPEND);
  printf("O_CREAT\n\tvalue:%07o\n", O_CREAT);
  printf("O_TRUNC\n\tvalue:%07o\n", O_TRUNC);
  printf("O_EXCL\n\tvalue:%07o\n", O_EXCL);
//  printf("O_SHLOCK\n\tvalue:%07o\n", O_SHLOCK);
//  printf("O_EXLOCK\n\tvalue:%07o\n", O_EXLOCK);
  printf("O_NOFOLLOW\n\tvalue:%07o\n", O_NOFOLLOW);
//  printf("O_SYMLINK\n\tvalue:%07o\n", O_SYMLINK);
//  printf("O_EVTONLY\n\tvalue:%07o\n", O_EVTONLY);
  printf("O_CLOEXEC\n\tvalue:%07o\n", O_CLOEXEC);
  printf("O_ACCMODE\n\tvalue:%07o\n", O_ACCMODE);
  printf("O_ASYNC\n\tvalue:%07o\n", O_ASYNC);
  printf("O_DSYNC\n\tvalue:%07o\n", O_DSYNC);
  printf("O_DIRECTORY\n\tvalue:%07o\n", O_DIRECTORY);
  //printf("O_NOATIME\n\tvalue:%07o\n", O_NOATIME);
  printf("O_NOCTTY\n\tvalue:%07o\n", O_NOCTTY);
  printf("O_NOFOLLOW\n\tvalue:%07o\n", O_NOFOLLOW);
  printf("O_NONBLOCK\n\tvalue:%07o\n", O_NONBLOCK);
//  printf("O_PATH\n\tvalue:%07o\n", O_PATH);
  printf("O_SYNC\n\tvalue:%07o\n", O_SYNC);
//  printf("O_TMPFILE\n\tvalue:%07o\n", O_TMPFILE);

  printf("O_WRONLY|O_CREAT\n\tvalue:%07o\n", O_WRONLY|O_CREAT);
  int fd = open("/tmp/test.dir", O_WRONLY|O_CREAT, 0777);

  return fd;
}
