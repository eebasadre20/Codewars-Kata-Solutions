# PROBLEM --> https://www.codewars.com/kata/best-travel/train/ruby
# Click the link for more information
# about the Kata problem.

require 'pry'

# This solution has some failing test
# you can look to the improvement
# solution below for further explanation.

def choose_best_sum( total, number_of_town, distance_list )
  temp_distance = distance_list.compact
  sum_of_distance = []
  sum = 0
  puts "===" * 5
  puts distance_list
  puts "===" * 5

  puts "TOTAL"
  puts total

  puts "NUMBER OF TOWN"
  puts number_of_town
  loop do
    if temp_distance.length < number_of_town
      sum_of_distance << nil
      break
    end



    sum = evaluator( temp_distance, number_of_town, total )
    sum_of_distance << sum
    temp_distance.delete_at( 0 )

  end

  puts "===" * 5
  puts sum_of_distance.compact.sort
  puts "===" * 5

  sum_of_distance.compact.sort.last
end

def evaluator( arr, number_of_town, total )
  temp_sum = 0
  sum   = 0
    x   = 0

  while x <= ( arr.length - number_of_town )
    temp_sum = arr.take( number_of_town - 1 ).push( arr[(number_of_town -1) + x] ).compact.inject( :+ )
    sum = temp_sum if temp_sum <= total && sum <= temp_sum
    x = x + 1
  end

  return sum <= 0 ? nil : sum
end

# Improvement:
# In my old solution I found out that why I keep failing
# because I didn't get all exact set of combinations
# example: [91,74,73,85,73,81,87], towns = 4
#
# 1st set:               2nd set:
# [91,74,73,85] = 323    [74,73,85,73] = 305
# [91,74,73,73] = 311    [74,73,85,81] = 313
# [91,74,73,81] = 319    [74,73,85,87] = 319
# [91,74,73,87] = 325    ...
#
# If you notice in the first set
# there are some missing combination
# then jump directly to the 2nd set.
#
# I found a combination method in array
# and used it. So, here's the final solution:

def choose_best_sum( total, number_of_town, distance_list )

  # check if distance length less than
  # number of town to visit
  return nil if distance_list.length < number_of_town

  temp_sum = 0
  sum = 0

  # A ruby method to get all
  # the combination of the array
  # then iterate each combination

  distance_list.compact.combination(number_of_town).to_a.each do | combination |
    # sum up the combination
    temp_sum = combination.inject(:+)

    # check if temp_sum equals to total
    # then return sum and break to the loop
    # no need to continue
    if temp_sum == total
      sum = temp_sum
      return sum
      break

    # else if temp_sum less than total
    # then temp_sum is greater than sum
    # replace sum value
    elsif temp_sum < total
      sum = temp_sum if temp_sum > sum
    end
  end

  sum == 0 ? nil : sum
end

ts = [91,74,73,85,73,81,87,50,100,34,85,230,9,24,78,98]
possible_list_dis  = choose_best_sum( 640, 6, ts)
puts "LIST --> #{possible_list_dis}"


# Additional test:
# Normal test with a lengthy array
ts = [91, 74, 73, 85, 73, 81, 87, 50, 100, 34, 85, 230, 9, 24, 78, 98]
Test.assert_equals(choose_best_sum( 385, 6, ts),385)

# Test with possibility to return nil
ts = [91, 74, 73, 85, 73, 81, 87, 50, 100, 34, 85, 230, 9, 24, 78, 98]
Test.assert_equals(choose_best_sum( 150, 6, ts),nil)

# Test with nil inside the array
# even though it was stated that
# it's all possible integers
ts = [91, 74,nil, 73, 85, 73, 81, nil, 87, nil, 50, 100,nil, 34, 85, 230, 9, 24, 78, 98]
Test.assert_equals(choose_best_sum( 301, 6, ts),301)

