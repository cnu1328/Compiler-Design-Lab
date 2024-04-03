%{
    #include<stdio.h>
    int lines = 0, space = 0, characters = 0, total = 0, words = 0, tabs = 0;
%}

%%
[\n] { words++; lines++;}
([ ])+ { space++; }
[\t] { tabs++; }
[a-zA-Z0-9]+ { words++; total += yyleng; }
@ { return 0; }

%%

int yywrap() {}

int main() {

    printf("Enter the string : ");
    yylex();

    printf("\nLines count %d", lines);
    printf("\nWords count %d", words);
    printf("\nTabs count %d", tabs);
    printf("\nSpace count %d", space);
    printf("\nTotal Characters %d", total);

}