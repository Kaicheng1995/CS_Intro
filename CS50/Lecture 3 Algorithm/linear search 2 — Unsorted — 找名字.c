#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    string names[3] = {"EMMA","KAI","TIAN"};
    for(int i=0; i<3; i++)
    {
        if(strcmp(names[i],"EMMA") == 0)           //strcmp，比较string的函数
        {
            printf("FOUND\n"); 
            return 0;                              //return 0，成功
        }         
    }
    printf("NOT FOUND\n");
    return 1;                                      //return 1，失败
}
