/*
The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385.
 
The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025.
 
Hence the difference between the sum of the squares of the first ten natural numbers
and the square of the sum is 3025 - 385 = 2640.
 
Find the difference between the sum of the squares of the first one hundred natural numbers
and the square of the sum.
*/
#include <stdio.h>

int main()
{
    int N = 100;

    int sumOfSquares = 0;
    int squareOfSums = 0;

    for (int i = N; i > 0; i--){ sumOfSquares += i*i;}
    for (int i = N; i > 0; i--){squareOfSums += i;}
    squareOfSums = squareOfSums*squareOfSums;
    int solution = squareOfSums - sumOfSquares;
    printf("solution: %d\n", solution);

    return 0;
}
