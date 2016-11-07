require 'pry'

def sum_pairs( ints, s )
  result = []

  # duplicate the list in ints
  temp = ints.dup

  # iterate in to get the nearest pairs to get the expected sum
  ints.each_with_index do | num, i|
    temp.shift
    x = 0

    while( x < temp.length )
      if num + temp[x] == s
        result << [num, temp[x]]
      end
      x = x + 1
    end
  end

  result[0]
end

puts sum_pairs([1, 2, 3, 4, 1, 0], 2)