#include <stdio.h>
#include <cs50.h>

int main(void)
{   
    int n;
    do                                           //step1：保证输入正整数
        n = get_int("Width:\n");         
    while(n < 1);

    for(int i = 0; i < n; i++)                   
    {
        for(int j = 0; j < n; j++)               
        {
            printf("#");                         //step2：打印行
        }
        printf("\n");                            //step3：接着打印下一行，跳转行
    }
}
