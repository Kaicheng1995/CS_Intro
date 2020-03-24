#include <cs50.h>
#include <stdio.h>

void draw(int n);

int main(void)                       
{
    int height = get_int("Height: ");
    draw(height);
}

void draw(int n)                         //不需要返回值，只需要打印出一个东西就好
{
    for(int i=1; i<=n; i++)              //iteration - loop
    {
        for(int j=1; j<=i; j++)
        {
            printf("#");
        }
        printf("\n");
    }
}
