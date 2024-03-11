/*
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

#include <stdio.h>
#include <stdint.h>
 
int main()
{
    uint64_t sieve_size = 31250; //1000000;
    uint64_t sieve[sieve_size];
    for (int i = 0; i < sieve_size; i++) { sieve[i] = 0; } //set sieve to zero
    for (int i = 0; i < sieve_size; i++) { sieve[i] = ~sieve[i]; } //set sieve to one
 
    uint64_t index;
    uint64_t bitIndex;
    uint64_t bit;
 
    for (int i = 0; i + 4 < sieve_size*64; i += 2)
    {
            index = (i+4) / 64;
            bitIndex = (i+4); // % 64;
            bit = 1;
            bit = bit << bitIndex;
            sieve[index] = (~bit) & sieve[index];
    }
 
    uint64_t sift = 8;
    for (int i = 3; i*i < sieve_size*64; i++)
    {
        if ((sieve[i/64] & sift) > 0)
        {
           for (int j = 0; i*i + 2*j < sieve_size*64; j += i)
           {
                index = (i*i + 2*j) / 64;
                bitIndex = (i*i + 2*j) % 64;
                bit = 1;
                bit = bit << bitIndex;
                sieve[index] = (~bit) & sieve[index];
            }
        }
        sift = sift << 1;
        if (sift == 0) sift = 1;
    }

    uint64_t sum = 0;
    bitIndex = 1;
    sieve[0] -= 3;
    for (int i = 0; i < sieve_size*64; i++)
    {
        if ((sieve[i/64] & bitIndex) > 0)
        {
            sum += i;
        }
 
        bitIndex = bitIndex << 1;
        if (bitIndex == 0) bitIndex = 1;
    }
 
    printf("Sum of the first 2,000,000 primes: %lu\n", sum);
    return 0;
}                                 

