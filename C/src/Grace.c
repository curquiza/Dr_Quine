/*
	commentaire de ouf
*/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#define CHECK_OPEN(FD) { if (FD == -1) { exit(1); } }
#define WRITE(STR) { int fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644); CHECK_OPEN(fd); dprintf(fd, STR, 10, 9, 34, STR); close(fd); }
#define MAIN int main() { char *s = "/*%1$c%2$ccommentaire de ouf%1$c*/%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <fcntl.h>%1$c%1$c#define CHECK_OPEN(FD) { if (FD == -1) { exit(1); } }%1$c#define WRITE(STR) { int fd = open(%3$cGrace_kid.c%3$c, O_WRONLY | O_CREAT | O_TRUNC, 0644); CHECK_OPEN(fd); dprintf(fd, STR, 10, 9, 34, STR); close(fd); }%1$c#define MAIN int main() { char *s = %3$c%4$s%3$c; WRITE(s) }%1$c%1$cMAIN%1$c"; WRITE(s) }

MAIN
