#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int n;
    do                                              //step1:确定input
    {
        n = get_int("Height:\n");
    }
    while(n < 1 || n > 8);

    for(int i = 0; i < n; i++)                      
    {
        for(int space1 = 1; space1 < n-i; space1++)
        {
            printf(" ");                            //step3：每行打印空格
        }
        for(int j = 0; j <= i; j++)
        {
            printf("#");                            //step4：空格打完打#
        }
        printf("  ");                                //step5：#打完打中间空格
        for(int t = 0; t <= i; t++)
        {
            printf("#");                            //step6：最后打镜像右边的#
        }
        printf("\n");                               //step2：跳转行
    }
}



图示：input范围（1-8）
   #  #
  ##  ##
 ###  ###
####  ####

