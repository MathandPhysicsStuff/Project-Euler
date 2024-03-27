'''
Power Digit Sum
Problem 16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
'''

def main():
    N = 2**1000
    digitSum = 0

    while (N > 0):
        digitSum += N % 10
        N //= 10
    
    print(f"The sum of the digits of 2^1000 is {digitSum}")

if __name__ == "__main__":
    main()
