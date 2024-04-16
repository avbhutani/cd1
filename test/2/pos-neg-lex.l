%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

[-][0-9]+(\.[0-9]+)? {
    float num = atof(yytext);
    printf("%f is a negative number\n", num);
}

[0-9]+(\.[0-9]+)? {
    float num = atof(yytext);
    printf("%f is a positive number\n", num);
}

 
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Please enter some numbers:\n");
    yylex();
    return 0;
}
