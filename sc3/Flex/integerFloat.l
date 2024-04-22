/* LEX Program to count the number of integers and floating point numbers appearing in the input. */

%{
	#include<stdio.h>
	int ip = 0, fp = 0;
%}

%%

[0-9]+"."[0-9]+ { fp++; }
[0-9]+ { ip++; };

@ return 0;

%%

int yywrap() { return 1; }

int main() {
	yylex();
	printf("Number of Decdimal Numbers : %d\n Number of Integer Numbers : %d\n", fp, ip);
	return 0;
}


