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
	char *s = "#include<stdio.h>%1$c%1$c/*%1$c%2$coutside comment%1$c*/%1$cvoid lol() {}%1$c%1$cint main()%1$c{%1$c%2$c/*%1$c%2$c%2$cinside comment%1$c%2$c*/%1$c%2$cchar *s = %3$c%4$s%3$c;%1$c%2$cprintf(s, 10, 9, 34, s);%1$c%2$clol();%1$c}%1$c";
	printf(s, 10, 9, 34, s);
	lol();
}
