%{
    int length = 0;
    void func(int len);    
%}

%%

[a-zA-Z]+ { length = yyleng; func(length);}

@ { return 0; }

%%

void func(int len) {
    if(yytext[0] == 'A') {
        if(len == 3) {
            printf("%s the provided string is of length 3 and starting with A", yytext);
        } else {
            printf("The words is not having length three");
        }
    } else {
        printf("The Word is not starting with A");
    }
}

int yywrap() {}

int main() {

    printf("Enter the word");
    yylex();

    return 0;
}