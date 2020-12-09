#include <stdio.h>

int main(void)
{
    int n = 50 ;
    printf("%i\n",n);
}



#include <stdio.h>

int main(void)
{
    int n = 50 ;
    printf("%p\n",&n);   //&代表地址，所以变量p（pointer）表示地址变量
}



#include <stdio.h>

int main(void)
{
    int n = 50;
    printf("%i\n", *&n);       //*和&抵消，所以变量还是用i
}





#include <stdio.h>

int main(void)
{
    int n = 50;
    int *x = &n;        // int *代表地址变量（且地址的value是int）, x代表一个地址
    printf("%p\n",x);   //所以输出地址的话还是用p，x
}




#include <stdio.h>

int main(void)
{
    int n = 50;
    int *x = &n;
    printf("%i\n",*x);
}
