/*5. LEX Program to list out all C-like comments (both single line and multi line comments) from a text file. */

%{
	#include<stdio.h>
	#include<stdlib.h>
	int count=0;
%}


%%

"/*"[a-zA-Z0-9 \t\n]+"*/" {count++;}
"//"[a-zA-Z0-9 \t]+ {count++;}

%%

int yywrap() {

	return 1;
	
}

int main() {
	yyin = fopen("inputFiveExample.c", "r");
	yyout = fopen("output.c", "w");
	yylex();
	printf("number of comments=%d",count);
	return 0;
}
