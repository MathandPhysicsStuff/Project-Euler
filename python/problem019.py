'''
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
'''

def counting_sundays(start_date, end_date):

    #distance of the first day of the month from the start of the year
    month = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334]
    year = start_date
    first_day = 0
    sundays = 0
    leap_year = False

    while  year <= end_date:

        for i in range(12):
            if i > 1 and leap_year == True:
                day = (first_day + ((month[i] + 1) % 7)) % 7
            else:
                day = (first_day + (month[i] % 7)) % 7
            if day == 6:
                sundays += 1
                
        if (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0):
            first_day = (first_day+2) % 7
            leap_year = True
        else:
            first_day = (first_day+1) % 7
            leap_year = False

        year += 1

    return sundays


def main():
    sundays = counting_sundays(1901, 2000)
    print("Counting Sundays")
    print("Problem 19")
    print("")
    print("Number of Sundays that fell on the first of the month between (1 Jan 1901 to 31 Dec 2000): ", sundays);
 

if __name__ == "__main__":
    main()
