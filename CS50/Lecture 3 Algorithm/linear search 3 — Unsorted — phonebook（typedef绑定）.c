#include <stdio.h>
#include <cs50.h>
#include <string.h>

typedef struct             //container里的data type可以是不同类型吗？？
{
    string names;
    string numbers; 
}
person;              //定义了一个叫person的data type，包含两个string的data，分别是names、numbers

int main(void)
{
    person x[3];
    x[0].names = "EMMA";              //这样一来，names和numbers就是绑定关系了
    x[0].numbers = "11-00";
        
    x[1].names = "KAI";
    x[1].numbers = "11-01";
    
    x[2].names = "TIAN";
    x[2].numbers = "11-02";
    
    for(int i=0; i<3; i++)
    {
        if ((strcmp(x[i].names,"EMMA")==0))
            {
                printf("%s\n",x[i].numbers);
                return 0;
            }
    }
    printf("NOT FOUND\n");
    return 1;
}




