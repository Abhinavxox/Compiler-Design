#include<stdio.h>
#define s 0
#define n 5
int main()
{
    int i, fact1;
    for(i=1;i<=n;i++)
    {
        fact1=fact1*i;
    }
    #if s
    printf("Factorial of %d is %d",n,fact1);
    #endif
    return 0;
}