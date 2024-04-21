'''
Amicable Numbers
Problem 21

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a doesn't equal b, then a and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
'''
amicable_numbers = []

def amicable(N):
    sum1 = 1
    n = 2
    while n*n < N:
        if N % n == 0:
            sum1 += n + (N//n);
        n+=1

    sum2 = 1
    n = 2
    while n*n < sum1:
        if sum1 % n == 0:
            sum2 += n + (sum1//n);
        n+=1

    if (sum2 == N and sum1 != N):
        return [N, sum1]
    else:
        return [0, 0]

def duplicate(a):
    for i in amicable_numbers:
        if a == i:
            return True
    return False

def main():
    
    sum = 0
    for i in range(2, 10000):
        am = amicable(i)

        if (am[0] and duplicate(am[1]) == 0): 
            sum += am[0] + am[1]
            amicable_numbers.append(am[0])

    print("Amicable Numbers")
    print("Problem 21");
    print("");
    print("Sum of all the amicable numbers under 10000: ", sum);
if __name__ == "__main__":
    main()







