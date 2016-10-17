# Recursive Binary search
def binary_search( arr, target )
  min_index = 0
  max_index = arr.length - 1

  if min_index <= max_index
    midpoint = ( min_index + max_index ) / 2

    if arr[midpoint] > target
      binary_search(arr[0..midpoint], target)
    elsif arr[midpoint] < target
      binary_search(arr[(midpoint + 1)..(arr.length -1)], target)
    else
      return midpoint
    end
  end
end


# Array must be sorted out first
arr = [1,2,3,4,5,6,7,8,9]
puts "Target at index: #{binary_search( arr, 3 )}"