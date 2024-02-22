/*
Multiples of 3 or 5
Problem 1
 
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
*/ 

#include <stdio.h>

int main()
{
    int N = 1000; //find multiple of 3 or 5 below this number

    int n1 = (N-1) / 3;
    int n2 = (N-1) / 5;
    int n3 = (N-1) / 15;

    int a = 3 * (n1 * (n1 + 1)) / 2;
    int b = 5 * (n2 * (n2 + 1)) / 2;
    int c = 15 * (n3 * (n3 + 1)) / 2;

    int sum = a + b - c;

    printf("solution = %d\n", sum);

    return 0;
}
