%{
    #include<stdio.h>
    void yyerror(char *s);
    int count = 0;
%}

%token digit

%% 

S : E { $$ = count; printf("Total Number of digits in given binary number is %d. \n", $$); }
E : E L { $$ = count; }
  | L { $$ = count; }
L : digit { $$ = ++count; };

%%

void main() {
    printf("\nEnter the binary digit : ");
    yyparse();
}

void yyerror(char *s) {}