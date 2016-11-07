require 'pry'

def anagrams(word, words)
  flag = false

  # check if the word includes in the list
  if !words.include? word
    words << word
    flag = true
  end

  # Group in each sorted characters and return value
  # then if the word is in the list delete it
  # else return the list
  words.group_by { | word | word.chars.sort }.values
    .select do | w |
      if w.include?( word ) && flag == true
        w.delete(word)
      elsif w.include? word
        w
      end
    end
    .flatten
end

puts anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada'])