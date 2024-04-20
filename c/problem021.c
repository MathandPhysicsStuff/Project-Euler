/*
Amicable Numbers
Problem 21

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a doesn't equal b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/
#include <stdio.h>

int amicable_numbers[10000];

typedef struct amicablePair
{
    int a;
    int b;
}amicablePair;

amicablePair amicable(int N)
{
    amicablePair am;
    int sum1 = 1;

    int n = 2;
    while (n*n <= N)
    {
        if (N % n == 0)
        {
            sum1 += n + (N/n);
        }
        n++;
    }
    
    int sum2 = 1;
    n = 2;
    while (n*n < sum1)
    {
        if (sum1 % n == 0 && sum1/n != n)
        {
            sum2 += n + (sum1/n);
        }
        n++;
    }
    if (sum2 == N && sum1 != N)
    {
        am.a = N;
        am.b = sum1;
        return am;
    }
    else
    {
        am.a = 0;
        am.b = 0;
        return am;
    }
}

int duplicate(int b, int depth)
{
    for (int i = 0; i <= depth; i++)
    {
        if (b == amicable_numbers[i])
        {
            return 1;
        }
    }
    return 0;
}


int main()
{
    int sum = 0;
    int depth = 0;
    amicablePair am;
    
    for (int i = 2; i < 10000; i++)
    {
        am = amicable(i);
        if (am.a && !duplicate(am.b, depth)) 
        {
            //printf("%d %d\n", am.a, am.b);
            //printf("found: %d\n", found);
            sum += am.a + am.b; 
            amicable_numbers[depth] = am.a;
            depth++;
        }
    }
    printf("Amicable Numbers\nProblem 21\n\n");
    printf("Sum of all the amicable numbers under 10000: %d\n", sum);
    return 0;
}







