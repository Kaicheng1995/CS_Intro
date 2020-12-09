#include <stdio.h>
#include <cs50.h>
#include <stdlib.h>



typedef struct node                 //先定义好这个data type
{
    int number;
    struct node *next;
}
node;




int main(void)
{
    node *numbers = NULL;     //从头开始

    while(true)            //持续输入numbers  (Until EOF)
    {
        int number = get_int("Number: ");    //提示出入numbers
        if(number == INT_MAX)      //check EOF
        {
            break;              //可以停止了
        }

        node *n = malloc(sizeof(node));    //给node创造空间
        if(!n)                       //常规检查如if(n==NULL)
        {
            return 1;
        }

        n -> number = number;        //给创建的空间装入数字，也能写成 (*n).number = number
        n -> next = NULL;            //给创建的空间装入地址，一个空的地址

        if(numbers)                 //即 if(numbers != NULL)，如果malloc是有效的？
        {
            for(node *ptr = numbers; ptr!=NULL; ptr = ptr->next)      //node *ptr = numbers 新建一个NULL初始位，ptr = ptr ->next 代表依次指向下一位
            {
                if(ptr->next == NULL)            //代表遇到了最后一个node了
                {
                    ptr ->next =n;               //因为遇到最后一个，所以要添加一个新的node
                    break;
                }
            }
        }
        else                           //如果malloc不是有效的？？
        {
            numbers = n;
        }
    }
}