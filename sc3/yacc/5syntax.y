%{
    #include<stdio.h>
    void yyerror(char *s); 
    int flag = 0;   
    
%}

%token num '+' '*'
%left '+' '-'
%left '*'

%%
S : E '\n'
  | E {};
E : E '+' T {}
E : E '-' T {}
E : T {}
T : T '*' F {}
T : F {}
F : num { }
;
%%

int main() {

    printf("Enter String : ");
    yyparse();

    if(flag == 0) printf("valid");
}

void yyerror(char *s) {
    flag = 1;
    fprintf(stderr, " %s\n", s);
}