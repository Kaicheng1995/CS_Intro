#include <cs50.h>
#include <stdio.h>

void draw(int n);

int main(void)
{
    int height = get_int("Height: ");
    draw(height);
}

void draw(int n)
{
    if(n == 0)                       //不能无限调用本身，需要有节点
    {
        return;
    }
    draw(n-1);                  //call itself,省去了另一层不必要的loop判断，更快，打印了前面所有
    
    for(int i =0; i<n; i++)     //打印最后一行
    {
        printf("#");             
    }
    printf("\n");   
}




