/*
Counting Sundays
Problem 19

You are given the following information, but you may prefer to do some research for yourself.

    * 1 Jan 1900 was a Monday.
    * Thirty days has September,
      April, June and November.
      All the rest have thirty-one,
      Saving February alone,
      Which has twenty-eight, rain or shine.
      And on leap years, twenty-nine.
    * A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
*/
#include <stdio.h>

int counting_sundays(int start_date, int end_date)
{
    //distance of the first day from the start of the year
    int month[12] = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
    int sundays = 0;

    int year = start_date;
    int leap_year = 0;
    int first_day = 0;
    int day;

    while (year <= end_date)
    {
        for (int i = 0; i < 12; i++)
        {
            if (i > 1 && leap_year == 1)
                day = (first_day + ((month[i] + 1) % 7)) % 7;
            else
                day = (first_day + (month[i] % 7)) % 7;
            
            if (day == 6)
                sundays++;
        }

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        {
            first_day = (first_day+2) % 7;
            leap_year = 1;
        }
        else
        {
            first_day = (first_day+1) % 7;
            leap_year = 0;
        }

        year++;
    }
    return sundays;
}

int main()
{
    int sundays = counting_sundays(1901, 2000);
    printf("Counting Sundays\nProblem 19\n\n");
    printf("Number of Sundays that fell on the first of the month between (1 Jan 1901 to 31 Dec 2000): %d\n", sundays);
   
    return 0;
}








