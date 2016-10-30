def permutations(string)
  string.split("").permutation.map(&:join).uniq
end