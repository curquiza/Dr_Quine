// commentaire de ouf
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define CHECK_OPEN(FD) { if (FD == -1) \
							exit(1); }
#define WRITE(STR) { int fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644); CHECK_OPEN(fd); dprintf(fd, STR, 10, 10, 10, 10, 10, 10, 92, 10, 9, 9, 9, 9, 9, 9, 9, 10, 34, 34, 10, 34, STR, 34, 10, 10, 10); close(fd); }
#define MAIN int main() { char *s = "// commentaire de ouf%c#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <fcntl.h>%c%c#define CHECK_OPEN(FD) { if (FD == -1) %c%c%c%c%c%c%c%c%cexit(1); }%c#define WRITE(STR) { int fd = open(%cGrace_kid.c%c, O_WRONLY | O_CREAT | O_TRUNC, 0644); CHECK_OPEN(fd); dprintf(fd, STR, 10, 10, 10, 10, 10, 10, 92, 10, 9, 9, 9, 9, 9, 9, 9, 10, 34, 34, 10, 34, STR, 34, 10, 10, 10); close(fd); }%c#define MAIN int main() { char *s = %c%s%c; WRITE(s) }%c%cMAIN%c"; WRITE(s) }

MAIN
