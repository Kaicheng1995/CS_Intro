#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    string names[3] = {"EMMA","KAI","TIAN"};
    string numbers[3] = {"11-00","11-01","11-02"};         //默认了名字和电话是一一对应的

    for(int i = 0; i<3; i++)
    {
        if(strcmp(names[i],"EMMA") == 0)
        {
            printf("%s\n",numbers[i]);
            return 0;
        }
    }
    printf("NOT FOUND\n");
    return 1;
}
