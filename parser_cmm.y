%{

#include<stdio.h>
#include<stdlib.h>

// Basic declarations
int yylex();
void yyerror(const char* s, ...);
extern FILE* yyin;

%}

%union {
    int intval;
    char* string;
}

/* tokens */
%token <intval> NUM
%token <string> IDENTIFIER
%token ASSIGN PLUS MINUS MULT DIV 
%token EQ NEQ GEQ LEQ GT LT
%token LPAREN RPAREN LBRACE RBRACE LSQBRACE RSQBRACE COMMA SEMICOLON 
%token AND OR
%token INT CHAR IF ELSE WHILE FOR RETURN SCAN PRINT PRINTS PRINTLN VAR LITERAL


/* Type association with union members */
// %type


/* start symbol */
// %start program

%%

program		: 	VarDeclList { }
		;

VarDeclList	:	VarDeclList VarDecl	{ }
		|	 
		;	

VarDecl		: 	IdType IDENTIFIER
		|	IdType IDENTIFIER LSQBRACE NUM RSQBRACE SEMICOLON
		/*|	IdtYPE IDENTIFIER LSQBRACE NUM RSQBRACE ASSIGN numbers init or char init*/ 
		| 	
		;

IdType		: 	INT
		| 	CHAR	
		;








%%

int main(int argc, char* argv[])
{
    FILE* fp = fopen(argv[1], "r");
    yyin = fp;

    // parse
    yyparse();
    fclose(fp);
    return 0;
}
