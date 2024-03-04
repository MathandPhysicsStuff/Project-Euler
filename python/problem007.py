'''
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10,001st prime number?
'''

maxPrime = 4294967296
prime = 2
nthPrime = 10001
primes = [2]*nthPrime

primeCount = 1
isPrime = False
index = 0
n = 1

while (prime < maxPrime):
    i = 0
    while (i*i < prime):
        if prime % primes[i] == 0:
            isPrime = False
            break

        isPrime = True
        i += 1

    if isPrime == True:
        primeCount += 1
        index += 1
        primes[index] = prime

    if primeCount == nthPrime:
        break

    prime = 2*n + 1
    n += 1 
    
print("10,001 prime:", prime)








