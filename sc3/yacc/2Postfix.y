%{
    #include<stdio.h>
    void yyerorr(char *s);
%}

%token num
%left '+' '-'
%left '*' '/'

%%

S : E '\n' { return 0; }
  | E {};
E : E '+' T { printf("+"); }
  | E '-' T { printf("-"); }
  | T {};
T : T '*' F { printf("*"); }
  | T '/' F { printf("/"); }
  | F {};
F : num { printf("%d", $1); }
;
%%

void yyerror(char *s) {}
void main() {
    printf("Enter an Expression : ");
    yyparse();
    printf("\n");
}