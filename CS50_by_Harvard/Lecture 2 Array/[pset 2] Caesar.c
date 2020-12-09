1\input key from the user
	2 arguments only, or print out “Usage: ./caesar key”
	validate key to be a number, or or print out “Usage: ./caesar key”
	
2\input plaintext from the user
	use get_string to ask for a plaintext
	print out “ciphertext: ”
	
3\decrypt process
	keep case when it’s a letter
	transfer every letter and leave the others the same

4\print out ciphertext






#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <cs50.h>

int main(int argc, string argv[])
{
    if(argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    int key = atoi(argv[1]);
    
    for(int i=0,len=strlen(argv[1]); i<len; i++)
    {
        if(isdigit(argv[1][i]) == false)
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
        
    }
    string plain = get_string("plaintext: ");
    printf("ciphertext: ");
    for(int i=0,length=strlen(plain); i<length; i++)
    {
        char letter = plain[i];
        if(isupper(plain[i]))
        {
            char newletter = ((letter-65)+key)%26+65;
            printf("%c",newletter);
        }
        else if(islower(plain[i]))
        {
            char newletter = ((letter-97)+key)%26+97;
            printf("%c",newletter);
        }
        else
        {
            printf("%c",letter);
        }
    }
    printf("\n");
    return 0;
}
