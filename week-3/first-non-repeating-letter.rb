# PROBLEM --> https://www.codewars.com/kata/first-non-repeating-letter
# Click the link for more information
# about the Kata problem.

def  first_non_repeating_letter(s)
  return s if s.empty?
  puts s
  
  str = s.split("").each_with_object(Hash.new(0)) do | word, count |
    count[word] += 1
  end

  str.each do |k, v|
    if k != ',' && k.match(/\W+/)
      str.delete(k)
    end
    
    if k.match( /^[[:lower:]]+$/ )
      if str[k.upcase] > 0
        str.delete(k.upcase)
        str.delete( k )
      end
    elsif k.match( /^[[:upper:]]+$/ )
      if str[k.downcase] > 0
        str.delete(k.downcase)
        str.delete( k )
      end
    end
    
    if v > 1
      str.delete( k )
    end
  end

  str.empty? ? "" : str.to_a.first[0]
end

first_non_repeating_letter('zaazzapper')
