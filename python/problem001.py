'''
Multiples of 3 or 5
Problem 1

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
'''

#Solution 

N = 1000 #find multiple of 3 or 5 below this number

n1 = (N-1) // 3
n2 = (N-1) // 5
n3 = (N-1) // 15

a = 3 * (n1 * (n1 + 1)) // 2
b = 5 * (n2 * (n2 + 1)) // 2
c = 15 * (n3 * (n3 + 1)) // 2

solution = a + b - c

print("solution =", solution)
