#include <stdio.h>

void getStack (void)
{
	int espM, ebpM;
	asm ("movl %%esp, %0"
		: "=r"(espM));
	asm ("movl %%ebp, %0"
		: "=r"(ebpM));
	printf("esp %d, ebp %d\n", espM, ebpM);
}

void clean_stdin(void)
{
    int c;
    
    do {
        c = getchar();
    } while (c != '\n' && c != EOF);
}

static int mul(int depth)
{
	int i;
	switch (scanf("%d", &i)) {
	case EOF :
		return 1; /* neutral element */
	case 0 :
		clean_stdin();
		return mul(depth+1); /* erroneous read */
	case 1 :
		if (i){
		getStack();
		return i * mul(depth+1);}
		else
		return 0;
	}
}

int main()
{
	int product;
	printf("A list of int, please\n");
	product = mul(0);
	getStack();
	printf("product = %d\n", product);
} 
