# Collatz:
# Write a function called collatz that receives a number and returns the number of steps it takes to reach 1. The Collatz Conjecture
# (also called 3x + 1 problem) is the following: Take any positive integer n. If n is even, divide n by 2 to get n / 2. If n is odd, multiply n
# by 3 and add 1 to get 3n + 1. Repeat the process indefinitely. The conjecture states that no matter which number you start with,
# you will always reach 1 eventually.
# console.log(collatz(12)); // 9
# console.log(collatz(19)); // 20
# console.log(collatz(27)); // 111
# console.log(collatz(837799)); // 524
# input:  integer
# output: integer, correspondint to the number of steps
#
def collatz(num)
  collatz_int(num,0)
end
def collatz_int(num, count)
  return count if num == 1

  num = num % 2 == 0 ?  num / 2 : (3 * num) + 1

  count += 1

  return collatz(num, count)
end
p test = [12,19,27, 837799]

p collatz(test[0],0)
p collatz(test[1],0)
p collatz(test[2],0)
p collatz(test[3],0)
