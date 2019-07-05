#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

extern const char *__progname;

#define INIT(NEW_FILE, COMPIL_STR, EXEC_STR, CPT) { asprintf(&NEW_FILE, "Sully_%d.c", CPT); asprintf(&COMPIL_STR, "gcc -Wall -Wextra -Werror %s -o Sully_%d", NEW_FILE, CPT); asprintf(&EXEC_STR, "./Sully_%d", CPT); }
#define WRITE(STR, CPT) { int fd = open(new_file, O_WRONLY | O_CREAT | O_TRUNC, 0744); if (fd == -1) { exit(1); } dprintf(fd, STR, 10, 9, 34, 37, CPT, STR); close(fd); }
#define EXEC(COMPIL_STR, EXEC_STR) { system(COMPIL_STR); if (cpt > 0) { system(EXEC_STR); } }

int main(void)
{
	char *str = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <string.h>%1$c%1$cextern const char *__progname;%1$c%1$c#define INIT(NEW_FILE, COMPIL_STR, EXEC_STR, CPT) { asprintf(&NEW_FILE, %3$cSully_%4$cd.c%3$c, CPT); asprintf(&COMPIL_STR, %3$cgcc -Wall -Wextra -Werror %4$cs -o Sully_%4$cd%3$c, NEW_FILE, CPT); asprintf(&EXEC_STR, %3$c./Sully_%4$cd%3$c, CPT); }%1$c#define WRITE(STR, CPT) { int fd = open(new_file, O_WRONLY | O_CREAT | O_TRUNC, 0744); if (fd == -1) { exit(1); } dprintf(fd, STR, 10, 9, 34, 37, CPT, STR); close(fd); }%1$c#define EXEC(COMPIL_STR, EXEC_STR) { system(COMPIL_STR); if (cpt > 0) { system(EXEC_STR); } }%1$c%1$cint main(void)%1$c{%1$c%2$cchar *str = %3$c%6$s%3$c;%1$c%2$cint cpt = %5$d;%1$c%2$cif (strcmp(__progname, %3$cSully%3$c) == 0) { cpt = 5; } else { cpt--; }%1$c%2$cchar *new_file, *compil_str, *exec_str;%1$c%2$cINIT(new_file, compil_str, exec_str, cpt);%1$c%2$cWRITE(str, cpt);%1$c%2$cEXEC(compil_str, exec_str);%1$c%2$creturn 0;%1$c}%1$c";
	int cpt = 5;
	if (strcmp(__progname, "Sully") == 0) { cpt = 5; } else { cpt--; }
	char *new_file, *compil_str, *exec_str;
	INIT(new_file, compil_str, exec_str, cpt);
	WRITE(str, cpt);
	EXEC(compil_str, exec_str);
	return 0;
}
