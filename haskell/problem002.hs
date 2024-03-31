

fib = takeWhile (< 4000000) $ 1 : 2 : zipWith (+) fib (tail fib)
evenFibSum = sum $ filter (even) fib

