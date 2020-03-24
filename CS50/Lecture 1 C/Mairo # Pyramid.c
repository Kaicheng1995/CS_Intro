#include <stdio.h>
#include <cs50.h>

int main(void)
{
    int n;
    do                                              //step1：控制input
    {
        n = get_int("Height: \n");
    }
    while(n<1);

    for(int i = 0; i < n; i++)                      
    {
        for(int space = 1; space < n - i; space++)     
        {
            printf(" ");                            //step3：每行打印空格
        }
        for(int j = 0; j <= i; j++)
        {
            printf("#");                            //step4：每行空格打完打 #
        }
        printf("\n");                               //step2：跳转每行
    }
}
