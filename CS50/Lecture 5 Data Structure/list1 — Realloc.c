#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int *numbers = NULL;       //从头开始
    int capacity = 0;
    int size = 0;

    while(true)
    {
        int number = get_int("Number: ");

        if(number == INT_MAX)     //终止键：control-D(或者EOF)，用户已经输完了
        {
            break;        //和return 0的区别？？
        }

        if (size == capacity)
        {
            numbers = realloc(numbers,sizeof(int)*(size+1));   //每填一个number就增加一个空间
            capacity++;             //增长了1个空间，所以capacity随之增长
        }

        numbers[size] = number;       //存储数据
        size++;                   //存储了一个数据，所以size随之增长
    }
    for(int i = 0; i < size; i++)
    {
        printf("Your input is %i\n", numbers[i]);
    }

    free(numbers);

}


