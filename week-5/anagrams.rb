require 'pry'

def anagrams(word, words)
  flag = false

  if !words.include? word
    words << word
    flag = true
  end

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