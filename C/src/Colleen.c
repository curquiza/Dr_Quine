#include<stdio.h>

/*
	outside comment
*/
void lol() {}

int main()
{
	/*
		inside comment
	*/
	char *s = "#include<stdio.h>%c%c/*%c%coutside comment%c*/%cvoid lol() {}%c%cint main()%c{%c%c/*%c%c%cinside comment%c%c*/%c%cchar *s = %c%s%c;%c%cprintf(s, 10, 10, 10, 9, 10, 10, 10, 10, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 10);%c%clol();%c}%c";
	printf(s, 10, 10, 10, 9, 10, 10, 10, 10, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10, 9, 10, 10);
	lol();
}
