%{
	int currLine = 1, currPos = 1, numInt = 0, numOp = 0, numPar = 0, numEq = 0;

%}
DIGIT [0-9]
%%

"+" {printf("PLUS\n"); currPos += yyleng; numOp++;}
"-" {printf("MINUS\n"); currPos += yyleng; numOp++;}
"*" {printf("MULTIPLY\n"); currPos += yyleng; numOp++;}
"/" {printf("DIVIDE\n"); currPos += yyleng; numOp++;}

"=" {printf("EQUAL\n"); currPos += yyleng;numEq++;}

"(" {printf("L_PAREN\n"); currPos += yyleng; numPar++;}
")" {printf("R_PAREN\n"); currPos += yyleng; numPar++;}

(\.{DIGIT}+)|({DIGIT}+(\.{DIGIT}*)?([eE][+-]?[0-9]+)?) {printf("NUMBER %s\n", yytext); currPos += yyleng; numInt++;}

"_" {printf("UNDER_SCORE\n"); currPos += yyleng;}


[ \t]+ {currPos += yyleng;}

"\n" {currLine++; currPos = 1;}


. {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);} ;

%%
int main(int argc, char ** argv){
if (argc>= 2)
{
yyin = fopen(argv[1], "r");
if (yyin == NULL)
	{yyin = stdin;}
}
else
{
yyin = stdin;
}
yylex();

printf("# Integers: %d\n",numInt);
printf("# Operators: %d\n",numOp);
printf("# Paranthesis: %d\n",numPar);
printf("# Equal Signs: %d\n",numEq);
}

~                        
