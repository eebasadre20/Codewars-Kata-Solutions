require 'pry'
# REFACTORED --> https://github.com/eebasadre20/Codewars-Kata-Solutions/blob/master/week-3/first-non-repeating-letter.rb

def first_non_repeating_letters( string )
  # Used the .find in enumerable for each character
  # and count how many char in the string
  string.chars.find do | char |
    string.downcase.count(i) == 1 || string.upcase.count(i) == 1
  end || ""
end
