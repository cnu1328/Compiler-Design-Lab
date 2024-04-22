/* Convertion of Binary Number to Decimal Number */

%{
    #include<stdio.h>
    #include "y.tab.h"    
%}

%%
[01] { yylval = atoi(yytext); return num; }
@ { return 1; }
%%

int yywrap() {}