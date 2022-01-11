#ifndef _FS_UTILS_H
#define _FS_UTILS_H 1

#define StructDetail(x_struct) printf(#x_struct "\n\tsize:%ld\n", sizeof(x_struct))

#define MemberDetail(x_struct, x_example_struct, x_member) printf(#x_struct "." #x_member "\n\toffset: %ld\n\tsize: %ld\n", offsetof(x_struct, x_member), sizeof(x_example_struct->x_member))

#define ConstDetail(x_const) printf(#x_const "\n\tvalue: %09o\n", x_const)

#endif /* _FS_UTILS_H */
