id 		[_a-zA-Z][_a-zA-Z0-9]*
num		[0-9]+
whitespace 	[ \t\n]+
keyword 	(int|char|if|else|while|for|return|scan|print|prints|println|var|literal)	
%{
#include<stdio.h>
#include<stdlib.h>
int numints =0, numids = 0; 
int numparens=0, numbraces=0, numbrackets=0;
int numsemi=0; 
int integers[10];
char *identifiers[100];
%}
%%

{whitespace} 			;
{keyword}			printf("Keyword: %s\n", yytext);
{id}		 		{
					printf("Identifier: %s\n", yytext);
					//identifiers[]
				}

{num}				{
					printf("Integer: %d\n", atoi(yytext));
					integers[0] = atoi(yytext);
				}

{num}{id}+(num|id)*		printf("**Invalid identifier**\n");

"="				printf("Assignment Op\n");
"=="				printf("Equals to Op\n");
"!="				printf("Not Equals to Op\n");
"<"				printf("Less than Op\n");
">"				printf("Greater than Op\n");
"<="				printf("Less than or Equal to Op\n");
">="				printf("Greater than or Equal to Op\n");
"(" 				printf("L-paren\n");
")"				printf("R-paren\n");
"{"				printf("L-brace\n");
"}"				printf("R-brace\n");
"["				printf("L-Sq-bracket\n");
"]"				printf("R-Sq-bracket\n");
"||"  				printf("OR\n");
"&&"				printf("AND\n");
"+"				printf("ADD\n");
"-"				printf("SUB\n");
"*"				printf("MULT\n");
"/"				printf("DIV\n");
";"				printf("SEMICOLON\n");

. 				printf("**Invalid character**\n");

%%

int yywrap(void) { 
	//printf("The array value is %d", a[0]);
	return 1; 
} 

int main(int argc, char **argv) {
	yyin = fopen(argv[1], "r"); 
	yylex();
	return 0;
}



