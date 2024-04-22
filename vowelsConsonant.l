/* LEX Program to count the number of vowels and consonants in a given string.*/

%{

	int vow = 0;
	int cons  = 0;
%}

%%

[aeiouAEIOU] 	{vow++;}
[a-zA-Z]	{cons++;}
@ return 0;
%%

int yywrap(){}

int main() {
	printf("Enter the string of vowels & consonants : ");
	yylex();
	printf("No of vowels = %d \n No of consonants = %d\n", vow, cons);
	return 0;
}

