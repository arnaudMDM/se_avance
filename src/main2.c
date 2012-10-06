#include <setjmp.h>
#include <stdio.h>
static jmp_buf buf;
static int i = 0;

static int cpt()
{
int j = 0;
if (setjmp(buf)) {
for (j=0; j<5; j++)
i++;
printf("plop");
} else {
for (j=0; j<5; j++)
i--;
}
return 0;
}

int main()
{
int np = 0 ;
cpt();
printf("coucou");
if (! np++)
longjmp(buf,~0);
printf("i = %d\n", i );
return 0;
}
