#include <stdio.h>
#include <cs50.h>  //里面有提前定义好的string，即 typedef char* string;

int main(void)
{
    string s = "EMMA";
    printf("%s,"s);      //正常操作
}



#include <stdio.h>       //没有<cs50.h>啦

int main(void)
{
    char *s = "EMMA";    
    printf("%s",s);       //重要！！printf(%s)比较特殊，用printf带%s变量，会自己打印到\0休止符位置
}




#include <stdio.h>      

int main(void)
{
    char *s = "EMMA";
    printf("%p",s);     
    printf("%p",&s[0]);    //结果是两者相等（都是‘E’这个字母的地址）
}



#include <stdio.h>      

int main(void)
{
    char *s = "EMMA";
    printf("%c\n", *s);         //*代表去address，即字母E，输出 E 
    printf("%c\n", s[0]);         //输出 E
    printf("%c\n", *(s+1));      //输出 M
}

