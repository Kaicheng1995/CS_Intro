#include <stdio.h>
#include <cs50.h>

void cough(int n);     //提行

int main(void)
{
    cough(3);                                                    //step2：使用函数
}

void cough(int n)      //表示存在输入值n，但无返回值，仅仅以printf结束   //step1：定义函数
{
    for(int i=0;i<n;i++)
    {
        printf("cough\n");
    }
}
