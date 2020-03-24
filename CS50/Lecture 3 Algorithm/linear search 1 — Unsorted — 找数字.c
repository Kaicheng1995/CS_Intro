#include <stdio.h>
#include <cs50.h>

int main(void)
{
    int number[4] = {1,2,3,4};
    for(int i = 0; i < 4; i++)
    {
        if(number[i] == 50)
        {
            printf("FOUND\n");
        }
    }
    printf("NOT FOUND\n");
}


//因为刚好没有50，所以输出了NOT FOUND，但其实代码是有问题的。如果有50，输出结果会是
FOUND
NOT FOUND
