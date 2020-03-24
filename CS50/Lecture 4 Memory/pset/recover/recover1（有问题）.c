#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


typedef uint8_t  BYTE;
int main(int argc, char *argv[])
{
    // ensure proper usage
    if (argc != 2)
    {
        fprintf(stderr, "Usage: copy infile outfile\n");
        return 1;
    }

     char *infile = argv[1];

    //Open the CF card
    FILE* inptr = fopen(infile, "r");
    //check if file is null
    if (inptr ==NULL)
    {
        fprintf(stderr, "card.raw file not working \n");
        return 2;
    }

    char title[8];

    FILE* img = NULL;
    //Initialize variables
    BYTE buffer[512];

    int fnumber = 0;
    int searchjpeg = 1; //1 if true, 0 if false


    //Cycle through each 512 MB block
    while(fread(&buffer, 512, 1, inptr)==1)
    {

        //找到一个图片前


        if(searchjpeg==1){ //Start of new jpeg?
            if(buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xe0) == 0xe0) //4 of 16 possible
            { //yes
                searchjpeg = 0;
                sprintf(title, "%03i.jpg", fnumber);
                img = fopen(title, "a");
                if (inptr == NULL)
                    {
                        fprintf(stderr, "Could not open %s.\n", title);
                        return 2;
                    }
                fwrite(&buffer, 512, 1, img);
            }
            else
            { //no
                printf("nothing\n");
            }
        }


        //找到第一个图片后

        else
        { //already found a jpeg?
            if(buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xe0) == 0xe0)
            { //yes
                fclose(img);
                fnumber++;
                sprintf(title, "%03i.jpg", fnumber);
                img = fopen(title, "a");
                if (inptr == NULL)
                    {
                        fprintf(stderr, "Could not open %s.\n", title);
                        return 2;
                    }
                fwrite(&buffer, 512, 1, img);
            }
            else
            { //no
                fwrite(&buffer, 512, 1, img);
            }
        }
    }
    fclose(img);
    free(buffer);
}