/*
Longest Collatz Sequence
Problem 14


The following iterative sequence is defined for the set of positive integers:

n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with
13, we generate the following sequence:

13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1.

It can be seen that this sequence (starting at 13 and finishing at 1) contains terms. 
Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at.


Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
*/
#include <stdio.h>
#include <stdint.h>

#define MAX 1000000

uint32_t cache[MAX];

uint32_t hailstone(uint32_t n)
{
    return (n & 1) ? (3*n + 1) : (n >> 1);
}


uint32_t sequenceLength(uint32_t n)
{
    if (n <= 1) return 0;
    if (n < MAX && cache[n]) return cache[n];

    uint32_t temp = sequenceLength(hailstone(n)) + 1;
    if (n < MAX) cache[n] = temp;
    return temp;
}

int main()
{
    uint32_t longestSequence = 0;
    uint32_t solution;
    uint32_t temp;

    for (int i = 0; i < MAX; i++) 
    {
        temp = sequenceLength(i);

        if (temp > longestSequence)
        {
            longestSequence = temp;
            solution = i;
        }
    }

    printf("%u has a Collatz Sequence of %u.\n", solution, longestSequence+1);

    return 0;
}










