# Recursive getting largest number

def largest_number( arr, index = 0 )
  largest = arr[index]
  return largest if index == arr.length - 1

  largest = arr[index] if arr[index] > largest
  largest_number(arr, index + 1)
end

arr = [8,9,7,1,2,35,0]
pust "Largest number: #{largest_number( arr )}"