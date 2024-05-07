%{
#include <stdio.h>
%}

%option noyywrap

%%
\/\/.*                  { printf("COMMENT "); }
f                       { printf("floatdcl "); }
i                       { printf("intdcl "); }
p                       { printf("print "); }
[a-zA-Z][a-zA-Z0-9_]*   { printf("id "); }
[0-9]+                  { printf("inum "); }
[0-9]+\.[0-9]+          { printf("fnum "); }
=                       { printf("assign "); }
\+                      { printf("plus "); }
-                       { printf("minus "); }
\*                      { printf("times "); }
\/                      { printf("over "); }

^\n                     /* ignore blank lines */
\n                      { printf("\n"); }
[ \t]+                  /* ignore whitespace */
%%

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: lex_analaizer filename\n");
    return (0);
}