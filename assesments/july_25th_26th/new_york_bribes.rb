# New York Chaos
# The40re are N people in a queue. Each person wears a sticker with their initial position in the queue starting from 1 to N. Any person in the queue can bribe the person directly in front of them to swap positions. One person can bribe at most two others. Even if they swap positions they will keep their original sticker.
#
# For example, if N is 8 and person 5 bribes person 4, the queue will look like this: `1, 2, 3, 5, 4, 6, 7, 8`.
#
# Given a queue, determine the minimum number of bribes that took place to get the queue to the current state. If the configuration is not possible return -1.
#
#
#     numberOfBribes([2, 1, 5, 3, 4]); // 3
#     numberOfBribes([2, 5, 1, 3, 4]); // -1
#
# Pseudocode
#

# (1) Check if result is possible given the rule of max
#     2 swap per element
#     (2) if condition (1) is true
#        continue (3)
#        else retunr -1
# (3) backward induction (BP)
#     (4) if array is equal to initial array return # of swaps
#     (5) else, count the number of possible last moves
#        (6) for each possibility return (go to) (3)
#
def nyc_bribes(a)
  return -1 unless is_valid?(a)
p "valid"
  k = bubble_sort(a)

  return k
end

def is_valid?(a)
  for i in 0..(a.length)-1 do
    default_p = a[i] - 1

    swaps = i - default_p

    swaps = -1 * swaps if swaps < 0

    break valid = false if swaps > 2
  end

  valid.nil? ? true : valid
end

def bubble_sort(a)
  finish = false
  k      = 0
  while finish == false
    finish = true

    for i in 0..(a.length-2) do
       if a[i] > a[i+1]
         k += 1
         swap(a,i)
         finish = false
       end
    end
  end

  return k
end

def swap(a,i)
  aux    = a[i]
  a[i]   = a[i+1]
  a[i+1] = aux
end


a0 = [1, 2, 3, 4, 5]
a1 = [2, 1, 5, 3, 4]
a2 = [2, 5, 1, 3, 4]

p nyc_bribes(a0)
p "1"
p nyc_bribes(a1)
p nyc_bribes(a2)
# Test (1):
#(1)
#    [2, 1, 5, 3, 4]
#    2 => p_0=1 p_1=0
#    |p_0|-|p_1| <= 2 => true
#    1 => p_0=0 p_1=1
#    |p_0|-|p_1| <= 1 => true
# 5 => p_0=4 p_1=2
#    |p_0|-|p_1| <= 2 => true
#    3 => p_0=2 p_1=3
#    |p_0|-|p_1| <= 2 => true
#    4 => p_0=2 p_1=3
#    |p_0|-|p_1| <= 2 => true
# (1) => true
#
# (1) [2, 5, 1, 3, 4]
#    2 => p_0=1 p_1=0
#    |p_0|-|p_1| <= 2 => true
#    5 => p_0=4 p_1=1
#    |p_0|-|p_1| <= 1 => false
#
# (1) => false

