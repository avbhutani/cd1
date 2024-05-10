[22:34, 9/5/2024] Subham Gour: %{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

calc: expr { printf("Result: %d\n", $1); }
    ;

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    ;

%%

int yyerror(const char *msg) {
    return 1;
}

int main() {
    yyparse();
    return 0;
}
calc.y above
[22:35, 9/5/2024] Subham Gour: flex calc.l
[22:35, 9/5/2024] Subham Gour: bison -dy calc.y
[22:35, 9/5/2024] Subham Gour: gcc lex.yy.c y.tab.c -o file
[22:35, 9/5/2024] Subham Gour: ./file
[22:35, 9/5/2024] Subham Gour: %{
#include "y.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/()\n]  { return *yytext; }
[ \t]       ; /* skip whitespace */

%%

int yywrap() {
    return 1;
}
