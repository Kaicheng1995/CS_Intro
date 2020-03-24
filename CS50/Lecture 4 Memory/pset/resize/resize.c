// Copies a BMP file

#include <stdio.h>
#include <stdlib.h>

#include "bmp.h"

int main(int argc, char *argv[])
{
    // ensure proper usage
    if (argc != 4)                          //command line 有四项
    {
        fprintf(stderr, "Usage: copy infile outfile\n");
        return 1;
    }

    // remember filenames
    int n = atoi(argv[1]);                 //把 n 值设定好
    char *infile = argv[2];
    char *outfile = argv[3];

    // open input file
    FILE *inptr = fopen(infile, "r");
    if (inptr == NULL)
    {
        fprintf(stderr, "Could not open %s.\n", infile);
        return 2;
    }

    // open output file
    FILE *outptr = fopen(outfile, "w");
    if (outptr == NULL)
    {
        fclose(inptr);
        fprintf(stderr, "Could not create %s.\n", outfile);
        return 3;
    }

    // read infile's BITMAPFILEHEADER
    BITMAPFILEHEADER bf;
    fread(&bf, sizeof(BITMAPFILEHEADER), 1, inptr);

    // read infile's BITMAPINFOHEADER
    BITMAPINFOHEADER bi;
    fread(&bi, sizeof(BITMAPINFOHEADER), 1, inptr);

    // ensure infile is (likely) a 24-bit uncompressed BMP 4.0
    if (bf.bfType != 0x4d42 || bf.bfOffBits != 54 || bi.biSize != 40 ||
        bi.biBitCount != 24 || bi.biCompression != 0)
    {
        fclose(outptr);
        fclose(inptr);
        fprintf(stderr, "Unsupported file format.\n");
        return 4;
    }


// 参数n会改变头文件的信息，所以在copy header的时候，有四项信息已经发生了变更。

//Initialize the new_bf
    BITMAPFILEHEADER new_bf;
    BITMAPINFOHEADER new_bi;
    new_bf = bf;
    new_bi = bi;

    //Set newest
    new_bi.biHeight = bi.biHeight * n;
    new_bi.biWidth = bi.biWidth * n;

    //Padding for fseek, multiple of 4
    int padding =  (4 - (bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;
    int new_padding =  (4 - (new_bi.biWidth * sizeof(RGBTRIPLE)) % 4) % 4;

    //New Image Size
    new_bi.biSizeImage = (new_bi.biWidth *sizeof(RGBTRIPLE) + new_padding) * abs(new_bi.biHeight);
    new_bf.bfSize = new_bi.biSizeImage + 54; //54 is BF+BI

    //open file to write output
    fwrite(&new_bf, sizeof(BITMAPFILEHEADER), 1, outptr);
    fwrite(&new_bi, sizeof(BITMAPINFOHEADER), 1, outptr);



    //下面开始扫描pixel啦（在原图大小的基础上）
    // iterate over infile's scanlines
    for (int i = 0, old_biHeight = abs(bi.biHeight); i < old_biHeight; i++)   //changed to old_biheight to prevent confusion（再到实际的下一行）
    {

        //Not efficient, but scans over the same input line for factor*output rows  (重复这行的复制，复制行数)
        for (int x = 0; x<n; x++)
        {

            // iterate over pixels in scanline     （对一行的每个像素挨个复制）
            for (int j = 0; j < bi.biWidth; j++)
            {
                // temporary storage
                RGBTRIPLE triple;

                // read RGB triple from infile
                fread(&triple, sizeof(RGBTRIPLE), 1, inptr);        //（因为咱们复制新图像，是在打开原图像找像素的基础上做的，所以用了fp，但它是不跟着for自动把指针放到首位的）

                //BGR + BGR + BGR factor # of times on width （对一个像素进行复制）
                for (int y=0; y<n; y++)
                {
                    fwrite(&triple, sizeof(RGBTRIPLE), 1, outptr);
                }
            }
            //Input files padding, pass over seeker （SEEK_CUR代表把文件移到离当前位置 padding 这么多字节处，即以前剩余的老padding位置，继续往后面加）
            //因为复制完一行后，所处的位置还在像素结尾，后面还有一连串padding，需要移到后面先
            // fseek的作用是移动fp指针
            fseek(inptr, padding, SEEK_CUR);

            //Add multiple of 4 padding to new image size  （每行复制完要加上paddig，位置上面已经定位好，可以直接加了）
            for (int k = 0; k < new_padding; k++)
            {
                fputc(0x00, outptr);
            }

            //pushes cursor back and iterate # of factor times on "L" row （最后一行不需要再移动了）
            if (x < n - 1)
            {
                long offset = bi.biWidth*sizeof(RGBTRIPLE)+padding; //By default, files are unsigned (nonnegative). Need to define negative signed long
                fseek(inptr, -offset, SEEK_CUR);  //this shoves cursor back the entire length to start （再移回初始位置，即每行的前面）
            }
        }
    }

    // close infile
    fclose(inptr);

    // close outfile
    fclose(outptr);

    // success
    return 0;
}
