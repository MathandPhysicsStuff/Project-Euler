'''
Number Letter Counts
Problem 17

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen)
contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
'''

def numberToWords(number):
    under20 = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
               "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

    if number == 1000:
        words = "onethousand"
        return words
    
    elif 0 < number < 20:
        words = under20[number]
        return words

    elif 19 < number < 100:
        words = tens[number // 10] + under20[number % 10]
        return words

    elif 99 < number < 1000:
        words = under20[number // 100] + "hundred"
        if 0 < number % 100 < 20:
            words += "and" + under20[number % 20]
        elif 19 < number % 100 < 100:
            words += "and" + tens[(number % 100) // 10] + under20[number % 10]
        return words

    else:
        words = ""
        return words

def main():
    totalCharaters = 0
    for i in range(1, 1001):
        totalCharaters += len(numberToWords(i))
    
    print("Number Letter Counts")
    print("Problem 17")
    print("")
    print(f"Total number of charaters: {totalCharaters}")

if __name__ == "__main__":
    main()



