#include <stdio.h>
#include <cs50.h>

int main(void)
{
    string s = get_string("Before: ");
    printf ("After: ");

    for(int i = 0; s[i] != '\0'; i++)
    {
        if(s[i] >= 'a' && s[i] <= 'z')                 //字母可以直接比较大小
        {
            printf("%c",s[i]-32);
        }
        else
            printf("%c",s[i]);
    }
    printf("\n");
}
