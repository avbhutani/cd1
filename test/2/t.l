%{
#include <stdio.h>
int vowelCount = 0;
int consonantCount = 0;
%}

%%
[aAeEiIoOuU] { vowelCount++; }
[a-zA-Z] { consonantCount++; }
. ;

%%

int yywrap() {return 1;}

int main() {
    yylex();
    printf("Number of vowels: %d\n", vowelCount);
    printf("Number of consonants: %d\n", consonantCount);
    return 0;
}