#include <stdio.h>
#include <cs50.h>

float average(int length, int array[]);           //提到前面

int main(void)
{  
    int n = get_int("Number of scores:\n");       //step1：询问数字个数
    int scores[n];
    for(int i=0;i<n;i++)
    {
    scores[i] = get_int("score %i: ",i+1);        //step2：依次询问数字大小
    }
    printf("Average: %.1f\n”,average(n,scores));  //step3：输出均值结果
}

float average(int length, int array[])            //step2.1：定义均值函数
{
    int sum = 0;
    for(int i = 0; i < length; i++)
    {
        sum += array[i];
    }
    return (float)sum / (float)length;            //前面加（float）代表变量转换
}    
