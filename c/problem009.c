/*
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2.
 
For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product a*b*c.
*/

/*
Pythagorean triple formula
 
(b^2 - a^2)^2 + (2*a*b)^2 = (b^2 + a^2)^2
 
if: b > a
if: a and b are co-prime
if: one is even, the other odd
 
The problem didn't specify if the triple is primative
so I will only assume (b > a).
*/
#include <stdio.h>

int findTriple()
{
    //There must be a smart way to narrow the range further but this is good enough.
    int a, b, c;
    for (int i = 2; i < 1000; i++)
    {
        for (int j = 1; j < i; j++)
        {
            a = i*i - j*j;
            b = 2*i*j;
            c = i*i + j*j;

            if (a + b + c == 1000)
            {
                //printf("a = %d, b = %d, c = %d\n", a, b, c); 
                printf("i = %d, j = %d\n", i, j); 
                return a*b*c;
            }
        }
    }
}

int main()
{
    printf("solution %d\n", findTriple()); 
    return 0;
}
