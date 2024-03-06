'''
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2.

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
There exists exactly one Pythagorean triplet for which a + b + c = 1000.Find the product a*b*c.
'''

'''
Pythagorean triple formula

(b^2 - a^2)^2 + (2*a*b)^2 = (b^2 + a^2)^2

if: b > a
if: a and b are co-prime
if: one is even, the other odd

The problem didn't specify if the triple is primative
so I will only assume (b > a).
'''

def findTriples():
    #There must be a smart way to narrow the range further but this is good enough.
    for i in range(2, 1000):
        for j in range(1, i):
            a = (i*i - j*j)
            b = (2*i*j)
            c = (i*i + j*j)
            if a + b + c == 1000:
                return a*b*c


print("solution:", findTriples())




