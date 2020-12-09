#include <stdlib.h>

void f(void)
{
    int *x = malloc(10*sizeof(int));
    x[9] = 0;                             //如果x[10] = 0;的话valgrind就会报错
    free(x);                              //如果没有free的话，valgrind也会报错，所以valgrind的应用在于 控制memory
}

int main(void)
{
    f();
    return 0;
}