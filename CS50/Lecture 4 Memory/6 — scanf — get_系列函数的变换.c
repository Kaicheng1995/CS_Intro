#include <stdio.h>

int main(void)
{
    int x;                     //给我一个证书
    printf("x: ");             //给user一个prompt提示

    scanf("%i",&x);           // 和printf刚好相反，&x是告诉user一个地址，然后填入%I数字。而printf是打印出来，scanf是填进去！！

    printf("x: %i\n",x);
}




#include <stdio.h>

int main(void)
{
    char s[5];              
    printf("s: ");
    scanf("%s",s);        //s[5]表示5个char,也就是an array of characters,即string，然而string返回的就是一个地址，所以不加&

    printf("s: %s\n",s);
}