require 'pry'

def solution(string)
  # split the string into array of characters
  # then map to check in which part has an uppercase letter
  # if there an uppercase letter add space before the letter and join
  # else just join directly.
  string.chars.map { | i |  i.match(/[A-Z]/) ? " " + i : i }.join("")
end