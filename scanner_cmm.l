
%option noyywrap yylineno

%{

#include<stdio.h>
#include<stdlib.h>

#include "y.tab.h"

void yyerror(const char* s, ...);


%}

%x comment

id 		[_a-zA-Z][_a-zA-Z0-9]*
num		[0-9]+
whitespace 	[ \t\n]+

%%



"="				{ return ASSIGN; }
"=="				{ return EQ; }
"!"				{ return NOT; }
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
\"[a-zA-Z: \t]*\"			{ return LITERAL; }
\"				{ return DBQUOTE;}
"'"				{ return SQUOTE; }
","				{ return COMMA; }
";"				{ return SEMICOLON; }

{whitespace} 			{ };

{id}		 		{
					if(strlen(yytext) > 20)
					{
						yyerror("Too many characters in identifier\n");
					}
					yylval.string = strdup(yytext);	
					return IDENTIFIER;
				}

{num}				{
					yylval.intval = atoi(yytext);
					return NUM;
				}

{num}{id}+(num|id)*		{ yyerror("Illegal identifier: %s\n", yytext); }

.			        { yyerror("Illegal token found: %s\n", yytext); }

%%


void
yyerror(const char *s, ...)
{
    //va_list ap;
    //va_start(ap, s);
    printf("%d: error: %s ", yylineno, s);
    //vfprintf(stderr, s, ap);
    fprintf(stderr, "\n");
}
