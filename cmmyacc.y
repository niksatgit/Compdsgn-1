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
%token LPAREN RPAREN LBRACE RBRACE LSQBRACE RSQBRACE SEMICOLON 
%token AND OR
%token INT CHAR IF ELSE WHILE FOR RETURN SCAN PRINT PRINTS PRINTLN VAR LITERAL


