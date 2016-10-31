require 'pry'
# PROBLEM --> https://www.codewars.com/kata/permutations/train/ruby
# Click the link for more information
# about the Kata problem.

def permutations(string)
  # In here, we need to split the string pass to make an array of characters
  # then use the permutation method from array module. The result of the permutated array
  # will be map then join and remove the duplicate using uniq.
  #
  # Ex. "aabb".split.permutation.map(&:join).uniq
  #
  # [["a", "a", "b", "b"],["a", "b", "a", "b"],["b", "b", "a", "a"] .... ] - before the map and join
  # ["aabb","abab","bbaa", ....] - after map and join
  string.split("").permutation.map(&:join).uniq
end

permutations("aabb")
