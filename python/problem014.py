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

cashe = {}
maxLen = 0 

for i in range(1, 1000000):
    
    n = i 
    sequenceLen = 0
    while n > 1:

        if n & 1 == 1:
            n = 3*n + 1
        else:
            n //= 2

        sequenceLen += 1
    
    sequenceLen += 1
    if sequenceLen > maxLen:
        maxLen = sequenceLen
        collatz = i
 
print(collatz, maxLen)

