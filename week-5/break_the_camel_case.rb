require 'pry'

def solution(string)
  string.chars.map { | i |  i.match(/[A-Z]/) ? " " + i : i }.join("")
end