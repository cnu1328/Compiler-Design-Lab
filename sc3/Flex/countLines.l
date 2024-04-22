/* 2. LEX Program to count the number of lines, words, and characters in the input. */
    
%{
	#include<stdio.h>
	int lines = 0, space = 0, tab = 0, charac  = 0, total = 0, word = 0;
%}

%%

[\n] { lines++; word++; }
([ ])+ { space++; }
[\t] { tab++; }
[a-zA-Z0-9]+ {word++; total += yyleng; }
@ {lines--; return 0; }	

%%

int yywrap() {}

int main() {

	printf("Enter the string : ");
	yylex();
	
	printf("Lines count is %d\n", lines);
	printf("Spaces count is %d\n", space);
	printf("Tabs count is %d\n", tab);
	printf("Characters count is %d\n", total);
	printf("Words count is %d\n", word + charac);
}
