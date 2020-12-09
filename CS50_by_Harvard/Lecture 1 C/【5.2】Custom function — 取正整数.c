#include <stdio.h>
#include <cs50.h>

int get_positive_number(void);    //自定义提行

int main(void)
{
    int i = get_positive_number();     //step2：使用函数，打印出来
    printf("%i\n",i);
}

int get_positive_number(void)       //step1：定义函数：循环询问，直到返回一个正整数，所以前缀是int
{
    int n;
    do
    {
        n = get_int("positive integer:");
    }
    while(n<1);
    return n;
}
