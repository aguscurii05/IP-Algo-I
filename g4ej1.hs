fibonacci::Integer->Integer
--fibonacci 0 = 0
--fibonacci 1 = 1
--fibonacci n = fibonacci(n-1)+fibonacci(n-2)
fibonacci n| n==0 =0
           |n==1 =1
           | n>0 = fibonacci(n-1)+fibonacci(n-2)