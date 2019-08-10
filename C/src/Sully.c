#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define INIT(NEW_FILE, COMPIL_STR, EXEC_STR, CPT) { asprintf(&NEW_FILE, "Sully_%d.c", CPT); asprintf(&COMPIL_STR, "gcc -Wall -Wextra -Werror %s -o Sully_%d", NEW_FILE, CPT); asprintf(&EXEC_STR, "./Sully_%d", CPT); }
#define WRITE(STR, CPT) { int fd = open(new_file, O_WRONLY | O_CREAT | O_TRUNC, 0744); if (fd == -1) { exit(1); } dprintf(fd, STR, 10, 9, 34, 37, CPT, STR); close(fd); }
#define EXEC(COMPIL_STR, EXEC_STR) { system(COMPIL_STR); if (cpt > 0) { system(EXEC_STR); } }

int main(void)
{
	char *str = "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c#include <string.h>%1$c%1$c#define INIT(NEW_FILE, COMPIL_STR, EXEC_STR, CPT) { asprintf(&NEW_FILE, %3$cSully_%4$cd.c%3$c, CPT); asprintf(&COMPIL_STR, %3$cgcc -Wall -Wextra -Werror %4$cs -o Sully_%4$cd%3$c, NEW_FILE, CPT); asprintf(&EXEC_STR, %3$c./Sully_%4$cd%3$c, CPT); }%1$c#define WRITE(STR, CPT) { int fd = open(new_file, O_WRONLY | O_CREAT | O_TRUNC, 0744); if (fd == -1) { exit(1); } dprintf(fd, STR, 10, 9, 34, 37, CPT, STR); close(fd); }%1$c#define EXEC(COMPIL_STR, EXEC_STR) { system(COMPIL_STR); if (cpt > 0) { system(EXEC_STR); } }%1$c%1$cint main(void)%1$c{%1$c%2$cchar *str = %3$c%6$s%3$c;%1$c%2$cint cpt = %5$d;%1$c%2$cint tmp_fd;%1$c%2$cchar *tmp_exec_file; asprintf(&tmp_exec_file, %3$cSully_%4$cd%3$c, cpt);%1$c%2$cif ((tmp_fd = open(tmp_exec_file, O_RDONLY)) != -1) { cpt--; close(tmp_fd); }%1$c%2$cchar *new_file, *compil_str, *exec_str;%1$c%2$cINIT(new_file, compil_str, exec_str, cpt);%1$c%2$cWRITE(str, cpt);%1$c%2$cEXEC(compil_str, exec_str);%1$c%2$cfree(new_file); free(compil_str); free(exec_str); free(tmp_exec_file);%1$c%2$creturn 0;%1$c}%1$c";
	int cpt = 5;
	int tmp_fd;
	char *tmp_exec_file; asprintf(&tmp_exec_file, "Sully_%d", cpt);
	if ((tmp_fd = open(tmp_exec_file, O_RDONLY)) != -1) { cpt--; close(tmp_fd); }
	char *new_file, *compil_str, *exec_str;
	INIT(new_file, compil_str, exec_str, cpt);
	WRITE(str, cpt);
	EXEC(compil_str, exec_str);
	free(new_file); free(compil_str); free(exec_str); free(tmp_exec_file);
	return 0;
}
