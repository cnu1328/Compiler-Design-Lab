
%{
    int vow = 0;
    int cons = 0;
%}

%%

[aeiouAEIOU] { vow++; }
[a-zA-Z] { cons++; }
@ return 0;

%%

int yywrap() {}

int main() {
    printf("Enter the string containing Vowels and Consonants : ");
    yylex();

    printf("The number of Vowels %d\n Number of Consonants %d", vow, cons);
}