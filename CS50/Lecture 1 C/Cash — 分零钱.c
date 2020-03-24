#include <stdio.h>
#include <cs50.h>
#include <math.h>

int main(void)
{
    int cent_owed;
    do
    {
        float dollar_owed = get_float("Change owed:\n");    //step1:定义input
        cent_owed = round(100*dollar_owed);                 //step2:优化input
    }
    while(cent_owed<=0);                                    //step3:有效化input
    
    int quarters = cent_owed / 25;                          //step4：利用商和余数求解
    int dimes = (cent_owed % 25) / 10;
    int nickels = ((cent_owed % 25) % 10) / 5;
    int pennies = ((cent_owed % 25) % 10) % 5;
    printf("%d\n", quarters + dimes + nickels + pennies);   //%d代表按实际长度
}
