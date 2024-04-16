%{
    #include <stdio.h>
%}

%%
[0-9]+ {
    int num = atoi(yytext);
    int factors = 0;
    for(int i=1; i<=num; i++)
        if(num%i == 0) factors+=1;

    if(factors==2) printf("PRIME");
    else printf("NOT PRIME");
}
%%

int yywrap() {return 1;}

int main()
{
    yylex();
    return 0;
}