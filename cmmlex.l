
%option noyywrap yylineno

%{

#include<stdio.h>
#include<stdlib.h>

//#include "cmmlex.tab.h"

void yyerror(const char* s, ...);


%}

%x comment

id 		[_a-zA-Z][_a-zA-Z0-9]*
num		[0-9]+
whitespace 	[ \t\n]+
keyword 	(int|char|if|else|while|for|return|scan|print|prints|println|var|literal)	

%%

{whitespace} 			;

{keyword}			{ return yytext; }

{id}		 		{
					if(strlen(yytext) > 20)
					{
						yyerror("Too many characters");
					}
					yylval.string = strdup(yytext);	
					return IDENTIFIER;
				}

{num}				{
					yylval.intval = atoi(yytext);
					return NUM;
				}

{num}{id}+(num|id)*		{ yyerror("Illegal identifier: %s\n", yytext); }



"="				{ return ASSIGN; }
"=="				{ return EQ; }
"!="				{ return NEQ; }
"<"				{ return LT; }
">"				{ return GT; }
"<="				{ return LEQ; }
">="				{ return GEQ; }
"(" 				{ return LPAREN; }
")"				{ return RPAREN; }
"{"				{ return LBRACE; }
"}"				{ return RBRACE; }
"["				{ return LSQBRACE; }
"]"				{ return RSQBRACE; }
"||"  				{ return OR; }
"&&"				{ return AND; }
"+"				{ return PLUS; }
"-"				{ return MINUS; }
"*"				{ return MULT; }
"/"				{ return DIV; }
"int" 				{ return INT; }
"char" 				{ return CHAR; }
"if" 				{ return IF; }
"else"				{ return ELSE; }
"while" 			{ return WHILE; }
"for" 				{ return FOR; }
"return" 			{ return RETURN; }
"scan"				{ return SCAN; }
"print"				{ return PRINT; }
"prints" 			{ return PRINTS; }
"println" 			{ return PRINTLN; }
"var" 				{ return VAR; }
"literal"			{ return LITERAL; }
";"				{ return SEMICOLON; }

.			        { yyerror("Illegal token found: %s\n", yytext); }

%%

int main(int argc, char **argv) {
	yyin = fopen(argv[1], "r"); 
	yylex();
	return 0;
}


void
yyerror(const char *s, ...)
{
    va_list ap;
    va_start(ap, s);
    fprintf(stderr, "%d: error: ", yylineno);
    vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}
