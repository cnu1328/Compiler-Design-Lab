/* 4. LEX Program to list out all words of length three, starting with "A". */


%{

	#include<stdio.h>
	int length = 0;
	void fun(int len);

%}

%%

[a-zA-Z0-9]+ { length = yyleng; fun(length); }

@ return 0;

%%

void fun(int len) {
	if(yytext[0] == 'A') {
		if(len == 3) {
			printf("%s is word with length 3", yytext);
		} else {
			printf("Word is not of length 3");
		}
	} else {
		printf("Word is not starting with A");
	}
}

int yywrap(){};

int main() {
	printf("Enter a string : ");
	yylex();
	
	return 0;
}
