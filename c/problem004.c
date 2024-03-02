/*
Largest Palindrome Product
Problem 4

A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is
9009 = 91 x 99.

Find the largest palindrome made from the product of two 3-digit numbers.
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void reverse_str(char* str); //helper function
int max_palindrome(int min, int max); //I put the code in a function to avoid using a goto 

int main()
{
    int min = 100;
    int max = 999; 
    int solution = max_palindrome(min, max);
    printf("solution: %d\n", solution);

    return 0;
}

int max_palindrome(int min, int max)
{
    int pal_max = max*max; //maximum possible palindrome number
    int pal_min = min*min; //maximum possible palindrome number
    int temp, temp_compare, div; 
    char* end_ptr;
    int str_len = 6;
    char pal_str[str_len];

    while (pal_max > pal_min)
    {
        temp = pal_max; 
        sprintf(pal_str, "%d", temp); //convert to string
        reverse_str(pal_str); //reverse the string 
        temp_compare = strtol(pal_str, &end_ptr, 10); //convert the string back to integer

        if (temp_compare == pal_max)
        {
            div = max;
            while (div > min)
            {
                if (pal_max % div == 0 && pal_max / div > min && pal_max / div < max)
                {
                    return pal_max; 
                }
                div--;
            }
        }
        pal_max--; 
    }
}

void reverse_str(char* str)
{
    int len = strlen(str);
    int mid = len / 2;
    char temp;

    for (int i = 0; i < mid; i++)
    {
        temp = str[i];
        str[i] = str[len - i - 1];
        str[len - i - 1] = temp;
    }
}






