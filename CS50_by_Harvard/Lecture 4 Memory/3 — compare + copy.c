//compare 代码没写，大概就是compare 2个string是否相等。
结果：当然不相等。即使两个都定义为”EMMA”，他们也存在于不同的地址，首字母‘E’的地址是不同的。
因为 string 是地址，所以比较的也是地址，地址不同，自然结果不等。



//下面是copy的代码：目的是先复制字母，再转换成大写




#include <cs50.h>
#include <stdio.h>
#include <ctype.h>

int main(void)
{
    string s = get_string("s: ");
    string t = s;                  //造成t的地址也指向了和s相同的方向，所以变成大写后，s指向的地址也变大了（会输出两个EMMA）
    
    t[0] = toupper(t[0]);
    printf("%s\n",s);
    printf("%s\n",t);
}





//改进办法:创造新的空间，再挨个复制char


#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main(void)
{
    char *s = get_string("s: ");
    char *t = malloc(strlen(s)+1);          //malloc意思是memory allocate，用于创造byte空间放置信息，直接填数字就是几个byte，+1是因为还有休止符
    
    for(int i=0, n=strlen(s)+1; i<n; i++)        //或者也不需要用loop，可以用strcopy(t,s); 就可以自动复制啦~
    {
        t[i] = toupper(s[i]);
    }  
    printf("%s\n",s);
    printf("%s\n",t);
}
