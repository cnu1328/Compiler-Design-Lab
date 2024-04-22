/* Counting number of digits in binary number */

%{
    #include<stdio.h>
    #include "y.tab.h"    
%}

%%

[01] { yylval=atoi(yytext); return digit; }

@ { return 1; }

%%

int yywrap() {}

/*
Output Will be like:

.\a.exe
1010101

7

*/