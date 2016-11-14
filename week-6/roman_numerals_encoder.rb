# PROBLEM --> https://www.codewars.com/kata/roman-numerals-encoder/train/ruby
# Click the link for more information
# about the Kata problem.

require 'pry'

def solution( number )
  RomanNumeralsDecoder.new.encoder( number )
end

class RomanNumeralsDecoder
  NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
               L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }

  def encoder( number )
    return "" if number <= 0

    # Iterate the declared constant numerals
    # if the number that pass to the encoder is greater or equal
    # of the value append the key ( which is already string )
    # and do recurrsion with substracting the number and value of the Key
    NUMERALS.each do | key, value |
      return key.to_s + encoder( number - value ) if number >= val
    end
  end
end

puts solution( 1996 )