/*
Lattice Paths
Problem 15
 
Starting in the top left corner of a 2x2 grid,
and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20x20 grid?
*/
#include <stdio.h>
#include <stdint.h>

#define ROWS 21
#define COLS 21

uint64_t cache[ROWS][COLS];

uint64_t latticePaths(uint32_t row, uint32_t col)
{
    uint64_t up = 0;
    uint64_t left = 0;

    if (row == 0 && col == 0) return 1;

    if (cache[row][col] != 0) return cache[row][col];

    if (row > 0) up = latticePaths(row-1, col);
    if (col > 0) left = latticePaths(row, col-1);
    
    cache[row][col] = left+up;
    return left+up;
}


int main()
{
    printf("A %u x %u Lattice has %lu Paths\n", ROWS-1, COLS-1, latticePaths(ROWS-1, COLS-1)); 

    return 0;
}
