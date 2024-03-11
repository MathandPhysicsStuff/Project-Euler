'''
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
'''
#My c implementation is much more memory efficient
from math import isqrt

sieveSize = 2000000
sieve = [1]*sieveSize
sieve[0] = 0
sieve[1] = 0

for i in range(2, isqrt(sieveSize)):
    if (sieve[i] == 1):
        j = 0
        while ((i*i + j) < sieveSize):
            
            sieve[i*i + j] = 0 
            j += i

solution = 0
for i in range(len(sieve)):
    if sieve[i] == 1:
        solution += i

print("Sum of the primes less than 2,000,000:", solution)

