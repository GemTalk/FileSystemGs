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

  return result;
}
