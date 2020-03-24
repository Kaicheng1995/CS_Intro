#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int n;
    do                               //step1: do while 保证输入为正值
    {
        n = get_int("width:\n"); 
    }
    while(n<1);
    for(int i=0;i<n;i++)             //step2: for 保证循环打印
    {
        printf("?\n");
    }
}
