%{
    #include <stdio.h>
%}

DIGIT [0-9]
LETTER [a-zA-Z]
SIGN [+\-*/\t]

%%

{DIGIT}+ {printf("INTEGER\n");}
{LETTER}{LETTER}+ {printf("IDENTIFIER\n");}
{SIGN} {printf("OPERATOR\n");}
. {printf("Invalid\n");}

%%

int yywrap() {return 1;}

int main()
{
    yylex();
    return 0;
}
