%{
#include <stdio.h>
%}

%%
\/\/.*$                 printf("COMMENT");
i                       printf("intdcl");
f                       printf("floatdcl");
p                       printf("print");
[a-z]+                  printf("id");
[0-9]+                  printf("inum");
[0-9]+.[0-9]+           printf("fnum");
=                       printf("assign");
\+                      printf("plus");
-                       printf("minus");
\*                      printf("multiply");
\/                      printf("divide");
%%

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: Could not open input file.");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}


