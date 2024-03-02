'''
Largest Palindrome Product
Problem 4
 
A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is
9009 = 91 x 99.
 
Find the largest palindrome made from the product of two 3-digit numbers.
'''

def max_palindrome(pmin, pmax):
    pal_min = pmin**2
    pal_max = pmax**2

    while (pal_max > pal_min):
        
        temp = pal_max
        pal_str = str(temp)
        pal_str = pal_str[::-1]
        pal_int = int(pal_str)
        
        if pal_max == pal_int:
            div = pmax
            while (div > pmin):
                if pal_max % div == 0 and pal_max / div > pmin and pal_max / div < pmax:
                    return pal_max
                
                div -= 1

        pal_max -= 1


pmin = 100
pmax = 999

solution = max_palindrome(pmin, pmax)

print("solution: ", solution)




