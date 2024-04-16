/*
Number Letter Counts
Problem 17

If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen)
contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/
#include <stdio.h>
#include <string.h>

/*
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
*/

void number_to_words(int number, char *words)
{
    char under20[][10] = {"", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
                          "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    char tens[][10] = {"", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"};
        

    if (number == 1000)
        strcpy(words, "onethousand");
 
    else if (0 < number && number < 20)
        strcpy(words, under20[number]);

    else if (19 < number && number < 100)
    {
        strcpy(words, tens[number / 10]);
        strcat(words, under20[number % 10]);
    }

    else if (99 < number && number < 1000)
    {
        strcpy(words, under20[number / 100]);
        strcat(words, "hundred");

        if (0 < number % 100 && number % 100 < 20)
        {
            strcat(words, "and");
            strcat(words, under20[number % 20]);
        }
        else if (19 < number % 100 && number % 100 < 100)
        {
            strcat(words, "and");
            strcat(words, tens[(number % 100) / 10]);
            strcat(words, under20[number % 10]);
        }
    }

    else
        strcpy(words, "");
}

int main()
{
    char words[100];
    int sum = 0;

    for (int i = 1; i <= 1000; i++)
    {
        number_to_words(i, words);
        sum += strlen(words);
    }
    
    printf("Number Letter Counts\n");
    printf("Problem 17\n\n");

    printf("Total number of characters: %d\n", sum);
    return 0;
}













