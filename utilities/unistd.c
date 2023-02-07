/*
 *
 * This programs calculates various details about
 * functions, constants, and structs in <unistd.h>
 *
 */

#include <stddef.h>
#include <stdio.h>
#include <unistd.h>
#include "utils.h"

int main() {

  int result = 0;

  TypeDetail(uid_t);
  TypeDetail(gid_t);
  ConstDetail(SEEK_SET);
  ConstDetail(SEEK_CUR);
  ConstDetail(SEEK_END);
  result = chown("/", 0, 0);


  TypeDetail(int);
  TypeDetail(void*);
  TypeDetail(size_t);
  TypeDetail(off_t);
  result = read(-1, NULL, 0);
  result = pread(-1, NULL, 0, 0);

  result = chdir("/this/should/not/exist");

  return result;
}
