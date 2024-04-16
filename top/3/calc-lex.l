%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    void calc();
    int op=0;
    float a, b;
%}

%%

[0-9]+(\.[0-9]+)? {calc();}
[+] {op=1;}
[-] {op=2;}
[*] {op=3;}
[/] {op=4;}
[\^] {op=5;}
[\n] { printf("%f is ans\n", a); op=0; }

%%

void calc()
{
    if(op==0) 
    {
        a = atof(yytext);
    }
    else{
        b = atof(yytext);

        switch(op){
            case 1: a=a+b; break;
            case 2: a=a-b; break;
            case 3: a=a*b; break;
            case 4: a=a/b; break;
            case 5: a=pow(a,b); break;
        }
    op=0;
    }
}

int yywrap() {return 1;}

int main()
{
    yylex();
    return 0;
}