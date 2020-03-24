#include <stdio.h>

int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        return 1;
    }

    FILE *file = fopen("argv[1]","r");       //为啥用r...??     argv[1]是user input

    if(file == NULL)
    {
        return 1;
    }

    unsigned char bytes[3];            // 为啥一定要用 unsigned???
    fread(bytes,3,1,file) ;            // read 3 bytes form the file  fread到底怎么用啊？？？


     if(bytes[0]==0xff && bytes[1]==0xd8 && bytes[2]==0xff)     //判断是否为JPEG图像，JPEG的前三个字节是 0xff、0xd8、0xff
     {
         printf("maybe\n");
     }
     else
     {
         printf("no\n");
     }
}