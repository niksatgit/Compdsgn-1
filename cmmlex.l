id 		[_a-zA-Z]
num		[0-9]
whitespace 	[ \t]
%{
#include<stdio.h>
#include<stdlib.h>
%}
%%

int|char|if|while|for|return|scan|print|prints|println|var|literal	printf("The keyword is %s\n", yytext);

{id}+({num}*{id}*)* 	printf("The id is %s\n", yytext);

{num}* 	printf("The numeric value is %d\n", atoi(yytext));

{num}+({id}+{num}*)		printf("invalid identifier\n");

{whitespace}+ 		printf("whitespace\n");

. 	printf("invalid character\n");

%%

int yywrap(void) { 
	return 1; 
} 

int main(int argc, char **argv) {
	yyin = fopen(argv[1], "r"); 
	yylex();
	return 0;
}



