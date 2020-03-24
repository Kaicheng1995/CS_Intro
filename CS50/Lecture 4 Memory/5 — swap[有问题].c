#include <stdio.h>

void swap(int a, int b);

int main(void)
{
    int x = 1;
    int y = 2;

    printf("x is %i, y is %i",x ,y);
    swap(x,y);                             //just get copies of x & y
    printf("x is %i, y is %i",x ,y);
}

void swap(int a, int b)
{
    int temp = a;
    a = b;
    b = temp;
}




#include <stdio.h>

void swap(int a, int b);

int main(void)
{
    int x = 1;
    int y = 2;

    printf("x is %i, y is %i",x ,y);
    swap(&x,&y);                             //交换地址
    printf("x is %i, y is %i",x ,y);
}

void swap(int *a, int *b)
{
    int temp = *a;                          //这里不太明白？？
    *a = *b;
    *b = temp;
}
