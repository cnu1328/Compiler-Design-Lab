%{
    #include<stdio.h>   
    int flag = 0; 
%}

%token '(' ')' '\n'

%%

X : S '\n' { printf("Valid"); flag = 1;}
S : S '(' S ')' {}
  | {}; // S derives epsilon

%%



void main() {
    printf("Enter Parenthesis String : ");
    yyparse();

    if(flag == 0) 
        printf("Invalid parenthesis String");
}

void yyerror(char *s) {
    // printf(s);
}