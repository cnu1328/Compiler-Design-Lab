%{
    #include<stdio.h>
    #include "y.tab.h"    
%}

%%
[()\n] { return yytext[0]; }
@ { return 1; }
%%

int yywrap() {}