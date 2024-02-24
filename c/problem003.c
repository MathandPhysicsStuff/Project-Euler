/*
The prime factors of 13195 are 5, 7, 13 and 29.
   
What is the largest prime factor of the number 600851475143? 
*/

#include <stdio.h>

int main()
{
    long long N = 600851475143;
    long long d = 2;

    while (d*d < N)
    {
        if (N % d == 0)
        {
            N = N / d;
            d = 1;
        }

        d++;
    }

    printf("solution: %d\n", N);

    return 0;
}

















