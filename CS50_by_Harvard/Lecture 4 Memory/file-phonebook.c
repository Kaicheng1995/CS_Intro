#include <stdio.h>
#include <string.h>
#include <cs50.h>

int main(void)
{
    FILE *file = fopen("phonebook.csv","a");         //FILE is a data type， csv = comma separated variables
                                                     // fopen("","")  前面是想打开的文件，后面是r/w/a,分别是 read/write/append
    char *name = get_string("Name: ");
    char *number = get_string("Number: ");

    fprintf(file, "%s,%s\n", name,number);           //fprintf代表打印文件出来

    fclose(file);
}