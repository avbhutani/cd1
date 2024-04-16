%{
    #include <stdio.h>
    int vowels=0
%}

%%
[aeiouAEIOU] {vowels+=1;}
%%

int yywrap() {return 1;}

int main()
{
    yylex();
    printf("Vowels: %d", vowels);
    return 0;
}
