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


int main()
{
    uint32_t sequenceLen = 0;
    uint32_t maxLen = 0;
    uint32_t collatz;
    uint32_t n;

    for (int i = 1; i < 1000000; i++)
    {
        n = i;
        sequenceLen = 0;
        while (n > 1)
        {
            sequenceLen++;
            n = (n & 1) ? (3*n + 1) : (n >> 1);
        }

        sequenceLen++;
        if (sequenceLen > maxLen)
        {
            maxLen = sequenceLen;
            collatz = i;
        }
    }

    printf("%d, %d\n", collatz, maxLen);
    
    return 0;
}










