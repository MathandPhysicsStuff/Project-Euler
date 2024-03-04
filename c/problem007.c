/*
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10,001st prime number?
*/
#include <stdio.h>
#include <stdint.h>

enum boolean {FALSE, TRUE};

int main()
{
    uint64_t prime = 2;
    uint64_t max = 4294967296; //2^32 just in case
    
    int nthPrime = 10001;
    int primeCount = 1;
    int primeBool = FALSE;
    int index = 0;

    uint64_t primes[nthPrime];
    for (int i = 0; i < nthPrime; i++){ primes[i] = 2; }
    
    int n = 1; 
    while(prime < max)
    {
        for (int i = 0; i*i < prime; i++)
        {
            if (prime % primes[i] == 0)
            {
                primeBool = FALSE;
                break;
            }
            primeBool = TRUE;
        }
        if (primeBool == TRUE)
        {
            index++;
            primeCount++;
            primes[index] = prime;
        }

        if (primeCount == nthPrime)
            break;

        prime = 2*n + 1;
        n++;
    }
    
    printf("10,001st prime: %llu\n", prime);
    
    return 0;
}
