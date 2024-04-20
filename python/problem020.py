'''
n! means n x (n - 1) x ... x 3 x 2 x 1.

For example, 10! = 10 x 9 x...x 3 x 2 x 1 = 3628800$,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!.
'''
from math import factorial 

def main():
    N = factorial(100)
    digitSum = 0

    while (N > 0):
        digitSum += N % 10
        N //= 10
    
    print(f"The sum of the digits of 100! is {digitSum}")

if __name__ == "__main__":
    main()
