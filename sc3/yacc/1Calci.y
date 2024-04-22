%{
    #include<stdio.h>
    void yyerorr(char *c);

%}

%token num;
%left '+' '-'
%left '*' '/'

%%

S : E { printf("The Final answer is : %d.\n", $$); }
E : E '+' E { $$ = $1 + $3; }
E : E '*' E { $$ = $1 * $3; }
E : num { $$ = $1; }

%%

void main() {
    printf("Enter string example(2+3+5) : ");
    yyparse();
}

void yyerror(char *c) {}