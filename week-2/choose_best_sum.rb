require 'pry'

def choose_best_sum( total, number_of_town, distance_list )
  temp_distance = distance_list
  sum_of_distance = []
  head = 0
  sum = 0

  loop do
    _, sum = evaluator( temp_distance, number_of_town, total )
    sum_of_distance << sum
    temp_distance.delete_at( head )
    head = head + 1

    break if _ == true
  end

  sum_of_distance.compact.sort.last
end

def evaluator( arr, number_of_town, total )
  sum_list = []
  sum   = 0
    x   = 0
  flag  = false

  while x <= ( arr.length - number_of_town )
    sum = arr.take( number_of_town - 1 ).push( arr[x + 2] ).compact.inject( :+ )

    if sum <= total
      sum_list << sum
    end

    x = x + 1
  end

  if ( arr.length - number_of_town ) <= 0
    flag = true
  end

  return flag, sum_list.compact.sort.last
end

# ts = [50, 55, 56, 57, 58]
# ts = [91, 74, 73, 85, 73, 81, 87]
ts = [191, 411, 120, 256, 494, 206, 376, 407, 361, 300, 386, 171, 477, 222, 59, 228, 165, 243]
possible_list_dis  = choose_best_sum( 450, 5, ts)
puts "LIST --> #{possible_list_dis}"