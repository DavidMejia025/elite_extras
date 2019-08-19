      # Write a function called flatten that receives an array of arrays and returns a
# flattened array.
# Pseudo code
#
# (1) pop one element from a
# (2) eval if the element is a num or an array
#     (3) if the element is a number
#         return element
#     (4) call flatten ((1)) with the remaining a element.
#
#     THis blew my mind on how to merge the result given that eventually some num elements can be in disorder not just
#     at the begining of the array

#[[[1]]]
#element [[1]]
#a []
#flatten element
#element [1]
#a []
def flatten(a)
  element = a.pop

  flag = false

   if a == []
     if element.kind_of?(Array)
       return flatten(element) + element
     else
       return [element]
     end
   end

   if element.kind_of?(Array)
     element = flatten(element)
     flag = true
   end

   element = [element] if flag == false

   return flatten(a) + element
end

def flatten(a)
  return []  if a == []
  return [a] unless a.kind_of?(Array)

   element = a.pop

  return flatten(element) + flatten(a)
end
p  flatten([[[1, [1.1]], 2, 3], [4, 5]]) # [1, 1.1, 2, 3, 4, 5]
# "end"
p flatten([[[[[[1,2,3,4,5]]]]]])
#"end"
p flatten([[1]])
# "end"
p flatten([[1],1])
# "end"
p flatten([[[1,[1]]],[[[1,[2]]]]])
 "end"
p flatten([[[[[1, 2, 3]]]], [4, 5], [[[[8]]]], 10]) # [1, 2, 3, 4, 5]
# "end"
p flatten([[[[1]]],[[1],[2]],[[[3]],[[[3],4]]]])
 #
#g = [[1,2,3], [[3,8]], 7]
# => [[1, 2, 3], [[3, 8]], 7]
# g0 = [1,2,3]
# => [1, 2, 3]
# g1 = g[1]
# => [[3, 8]]
# g2 = g[2]
# => 7
# g10 = g1[0]
# => [3, 8]
# g100 = g10[0]
# => 3
# g101 = g10[1]
# => 8
#
#
