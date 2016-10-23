# PROBLEM --> https://www.codewars.com/kata/convert-string-to-camel-case/train/ruby
# Click the link for more information
# about the Kata problem.

def to_camel_case(str)
  arr_str = str.gsub(/\W+|_|\d/, " ").split(" ")
  arr_str.map { |s| s != arr_str[0] ? s.capitalize : s }.join("")
end
