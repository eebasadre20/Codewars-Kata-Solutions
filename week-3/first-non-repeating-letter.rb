# PROBLEM --> https://www.codewars.com/kata/first-non-repeating-letter
# Click the link for more information
# about the Kata problem.

def  first_non_repeating_letter(s)
  # Code go here
  return s if s.empty?

  str = s.split("").each_with_object(Hash.new(0)) do | word, count |
    count[word] += 1
  end

  str.each do |k, v|
    if k.match( /\p{ Lower }/ )
      if str[k.upcase] > 0
        str.delete(k.upcase)
        str.delete( k )
      elsif v > 1
        str.delete( k )
      end
    elsif k.match( /\p{ Upper }/ )
      if str[k.downcase] > 0
        str.delete(k.downcase)
        str.delete( k )
      elsif v > 1
        str.delete( k )
      end
    end
  end

  str.empty? ? "" : str.to_a.first[0]
end

first_non_repeating_letter('zaazzapper')
