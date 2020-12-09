#include <cs50.h>
#include <stdio.h>

int main(void)
{
    char x = get_char("Do you agree?\n");
    if (x == 'Y' || x == 'y')
    {
        printf("Agreed\n");
    }
    else if (x == 'N' || x == 'n')
    {
        printf("Disagreed\n");
    }
}

