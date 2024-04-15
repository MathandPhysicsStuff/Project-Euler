/*
Power Digit Sum
Problem 16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef struct bignum
{
    uint32_t *number;
    uint32_t size;
}bignum;

bignum bignum_mul_num(bignum N, uint32_t n)
{
    bignum num; 
    num.size = N.size;
    num.number = calloc(num.size, sizeof(uint32_t));

    uint32_t digit_block;
    uint32_t carry = 0;

    for (int i = 0; i < N.size; i++)
    {
        digit_block = (n*N.number[i]) % 1000000000;
        num.number[i] = digit_block + carry;
        carry =  (n*N.number[i]) / 1000000000;

        //printf("digit: %09u, carry: %u\n", digit_block, carry);
    }
    return num;
}

bignum bignum_pow(int n, int power)
{
    bignum num;
    num.size = 35;
    num.number = calloc(num.size, sizeof(uint32_t));
    num.number[0] = n; 

    for (int i = 0; i < power-1; i++)
    {
        num = bignum_mul_num(num, n);
    }
    return num;
}

uint32_t bignum_digitsum(bignum N)
{
    uint32_t sum = 0;
    for (int i = 0; i < N.size; i++)
    {
        while (N.number[i] > 0)
        {
            sum += N.number[i] % 10;
            N.number[i] /= 10;
        }
    }
    return sum;
}

void print_bignum(bignum N)
{
    int zeros = 1;

    for (int i = N.size-1; i >= 0; i--)
    {
        if (N.number[i] != 0)
            zeros = 0;

        if (zeros == 0)
            printf("%09u", N.number[i]);
    }
    printf("\n");
}

int main()
{
    bignum N = bignum_pow(2, 1000);
    uint32_t digit_sum = bignum_digitsum(N);
    printf("The sum of the digits of 2^1000 = %u\n", digit_sum);
    
    return 0;
}




