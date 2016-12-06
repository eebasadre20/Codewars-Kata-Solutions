require 'pry'

# REFACTORED --> https://github.com/eebasadre20/Codewars-Kata-Solutions/blob/master/week-5/anagrams.rb

def anagrams( word, words )
  # In list of words used the select to get each word inside the list
  # then both word ( given and selected word ) compare the splitted characters
  # then sort and join.
  return words.select { | w | w.chars.sort.join == word.chars.sort.join }
end
