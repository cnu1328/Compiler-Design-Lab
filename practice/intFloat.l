%{
    int ip = 0, fp = 0;    
%}

%%

[0-9]+"."[0-9]+ { fp++; }
[0-9]+ { ip++; }

@ return 0;

%%

int yywrap() {}

int main() {

    printf("Enter Decimals and Floating");
    yylex();

    printf("Number of Decimal Numbers %d\n Number of Floating Numbers %d", ip, fp);
    
}