%{
    #include<stdio.h>
    void yyerror(char *s);    
%}

%token num;

%%

S : E { printf("The Decimal number Given Binary is : %d\n", $1); }
E : E L { $$ = 2*$1 + $2; }
  | L { $$ = $1; }
L : num { $$ = $1; };

%%

void yyerror(char *s) {}
void main() {
    printf("Enter Binary number : ");
    yyparse();
}