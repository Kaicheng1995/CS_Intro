#include <stdio.h>
#include <cs50.h>


//第一种，in advance

int main(void)
{
    int capacity;
    do
    {
        capacity = get_int("capacity: ");
    }
    while(capacity < 1);                             //check非负过程

    int numbers[capacity];                           //人为定义

    int size = 0;

    while(size < capacity)
    {
        int number = get_int("number: ");
        numbers[size] = number;
        size++;
    }

    for(int i=0; i<size; i++)
    {
        printf("your input is %i\n", numbers[i]);
    }
}