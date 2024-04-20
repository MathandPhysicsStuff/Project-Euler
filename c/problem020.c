/*
n! means n x (n - 1) x ... x 3 x 2 x 1.

For example, 10! = 10 x 9 x...x 3 x 2 x 1 = 3628800$,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!.
*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef struct bignum
{
    uint64_t *number;
    uint64_t size;
}bignum;

bignum bignum_mul_num(bignum N, uint32_t n)
{
    bignum num; 
    num.size = N.size;
    num.number = calloc(num.size, sizeof(uint64_t));

    uint64_t digit_block;
    uint64_t carry = 0;

    for (int i = 0; i < N.size; i++)
    {
        digit_block = (n*N.number[i]) % 1000000000;
        num.number[i] = digit_block + carry;
        carry =  (n*N.number[i]) / 1000000000;

        //printf("digit: %09lu, carry: %ul\n", digit_block, carry);
    }
    return num;
}

bignum bignum_fact(int N)
{
    bignum num;
    num.size = 25; 
    num.number = calloc(num.size, sizeof(uint64_t));
    num.number[0] = 1;

    for (int i = 2; i <= N; i++)
    {
        num = bignum_mul_num(num, i);
    }
    return num;
}

uint64_t bignum_digitsum(bignum N)
{
    uint64_t sum = 0;
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
            printf("%09lu", N.number[i]);
    }
    printf("\n");
}

int main()
{
    bignum N = bignum_fact(100);
    uint32_t digit_sum = bignum_digitsum(N);
    printf("The sum of the digits of 100! = %u\n", digit_sum);
    
    return 0;
}




