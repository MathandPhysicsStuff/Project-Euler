'''
Lattice Paths
Problem 15
 
Starting in the top left corner of a 2x2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20x20 grid?
'''
from functools import cache

@cache
def latticePaths(row, col):
    left = 0
    up = 0
    if row == 0 and col == 0:
        return 1;

    if row > 0:
        up = latticePaths(row - 1, col)
    if col > 0:
        left = latticePaths(row, col - 1)

    return left+up


def main():
    rows = 20
    cols = 20
    numberOfPaths = latticePaths(rows, cols)
    print(f"A {rows} x {cols} Lattice has {numberOfPaths} possible paths.")

if __name__ == "__main__":
    main()
