%{
    #include<stdio.h>
    #include<stdlib.h>
    int count = 0;    
%}

%%

"/*"[a-zA-Z0-9 /t/n]+"*/" { count++; }
"//"[a-zA-z0-9 /t]+ { count++; }

%%

int yywrap() { return 1; }

int main() {
    

    yyin = fopen("input.c", "r");
    yyout = fopen("output.c", "w");
    yylex();
    printf("Number of comments %d", count);

    return 0;
}
