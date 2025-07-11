CC := gcc
CC_FLAGS := -Wall -Werror -c -fPIC
OBJS := dirent.o fcntl.o stat.o stdio.o unistd.o

lib: $(OBJS)
	$(CC) $(OBJS) -shared -o libFileSystemGs.so

dirent.o: dirent.c
	$(CC) $(CC_FLAGS) dirent.c

fcntl.o: fcntl.c
	$(CC) $(CC_FLAGS) fcntl.c

stat.o: stat.c
	$(CC) $(CC_FLAGS) stat.c

stdio.o: stdio.c
	$(CC) $(CC_FLAGS) stdio.c

unistd.o: unistd.c
	$(CC) $(CC_FLAGS) unistd.c

clean:
	rm libFileSystemGs.so $(OBJS)

