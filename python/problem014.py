'''
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
'''

max = 1000000
cache = {}

def hailstone(n):
    return (3*n + 1) if (n & 1) else (n >> 1)

def sequenceLength(n):
    if n <= 1:
        return 0

    if n in cache:
        return cache[n]
    
    temp = sequenceLength(hailstone(n)) + 1
    cache[n] = temp
    return temp

longestSequence = 0

for i in range(max):
    temp = sequenceLength(i)

    if temp > longestSequence:
        longestSequence = temp
        solution = i

print(f"{solution} has a Collatz Sequence of {longestSequence+1}")







