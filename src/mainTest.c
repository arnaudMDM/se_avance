#include <stdio.h>

int main(void)
{
	int x=10, y;
	asm ("mov %1, %%ex" "\n\t" "movl %%ex, %0"
		: "=r"(y)
		: "r"(x)
		: "%eax", "%ebx", "%ecx", "%edx", "%esi", "%edi");
	x=x+1;
	return 0;
}
