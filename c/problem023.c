/*
 Non-Abundant Sums
Problem 23


A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot
be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define MAX 28124

uint64_t *abundants;
int arr_size = 0;
uint32_t set[MAX];

int main()
{

    abundants = calloc(arr_size, sizeof(uint64_t));
    int index = 0;
 
    for (int i = 2; i < MAX; i++)
    {
        uint64_t sum = 1;
        int d = 2;

        while (d*d < i)
        {
            if (i % d == 0)
            {
                sum += d + i/d;
            }
            d++;
        }

        if (d*d == i)
            sum += d;

        if (sum > i)
        {
            arr_size += 1;
            abundants = realloc(abundants, arr_size * sizeof(uint64_t));
            abundants[index] = i;
            index++;
        }
    }
    
    uint64_t solution = 395465626;
    for (int i = 0; i < index; i++)
    {
        for (int j = 0; j < index; j++)
        {

            if (abundants[i] + abundants[j] < MAX && set[abundants[i] + abundants[j]] == 0)
            {
                //printf("%d + %d\n", abundants[i], abundants[j]);

                solution -= abundants[i] + abundants[j];
                set[abundants[i] + abundants[j]] = 1;//abundants[i] + abundants[j];
            }

            if (abundants[i] + abundants[j] >= MAX)
            {
                break;
            }
        }
    }
    
    printf("%lld\n", solution);

    free(abundants);
    return 0;
}
