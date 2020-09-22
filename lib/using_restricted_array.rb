require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: There is only one while loop where we iterate over each
# element of the array. Time complexity will be O(n) time where n is how many
# times the loop will execute.
# Space complexity:  The method used one local integer variable
# no matter the input size, so the space complexity is constant or O(1).
def length(array)
  i = 0
  while array[i] != nil
    i +=1
  end
  return i
  # raise NotImplementedError will never execute as the function stop at return statement

end

# Prints each integer values in the array
# Time complexity: There is only one while loop where we iterate over each
# element of the array. Time complexity will be n time where n is how many
# times the loop will execute.
# Space complexity: constant or O(1)
def print_array(array)
  i = 0
  until array[i].nil? # until object == nil
    puts array[i]
    i += 1
  end
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity:O(n) There is only one while loop where we iterate over each
# element of the array. Time complexity will be n time where n is how many
# times the loop will execute.
# Space complexity: constant or O(1)
def search(array, length, value_to_find)
  if length == 0
    return false
  end

  i = 0
  while i <= length
    if array[i] == value_to_find
      return true
    end
    i += 1
  end

  return false

end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity:This method will iterate through the entire array. Thus if the
# array size doubles the loop will take twice as long. So the time complexity is O(n)
# Space complexity: This method only creates two additional variables,
# index and max which does not change no matter how large the array gets.
# Therefore the space complexity does not change as the size of the array increases.
# This means the space complexity is O(1).
def find_largest(array, length)
  max_value = 0
  i = 0
  while i < length
    if array[i] > max_value
      max_value = array[i]
    end
    i += 1
  end

  return max_value

end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: This method will iterate through the entire array. Thus if the
# array size doubles the loop will take twice as long. So the time complexity is O(n)
# Space complexity: This method only creates two additional variables,
# index and min which does not change no matter how large the array gets.
# Therefore the space complexity does not change as the size of the array increases.
# This means the space complexity is O(1).
def find_smallest(array, length)
  min_value = array[0]
  i = 0
  while i < length
    if array[i] < min_value
      min_value = array[i]
    end
    i += 1
  end

  return min_value

end

# Reverses the values in the integer array in place
# Time complexity:O(n) this method only iterate through half of the array however
# it is depends on the size of the input. The longer the array, the longer it takes or
# linear complexity.
# Space complexity: constant
def reverse(array, length)
  # The array reserves back at the mid index
  n = length/2
  i = 0

  while i < n
    temp = array[i]
    array[i] = array[length - i - 1]
    array[length - i - 1] = temp
    i += 1
  end

  return array

end


# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: Log2 n means at each step the value reduces by half of the remaining.
# It also means that as the size of the array doubles,
# the number of iterations only increases by 1.
# The main loop in binary search runs log2 n number of times where
# n is the number of elements in the input array.
# Space complexity: constant
def binary_search(array, length, value_to_find)
  if length == 0
    return false
  end
  # initialized to the index of the first element in the array
  first_index = 0
  # initialized to the index of the last element in the array
  last_index = length - 1

  while first_index <= last_index
    mid_index = (first_index + last_index)/2
    if array[mid_index] == value_to_find
      return true
    elsif array[mid_index] > value_to_find
      last_index = mid_index - 1
    elsif array[mid_index] < value_to_find
      first_index = mid_index + 1
    end
  end

  return false

end

# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2), where n is the number of elements in the array.
# To find the correct value for index 0, a total of (n-1) comparisons are needed.
# To find the correct value for index 1, a total of (n-2) comparisons are needed.
# To find the correct value for index 2, a total of (n-3) comparisons are needed.
# and so on ...
# To find the correct value for index (n-2), a total of 1 comparisons is needed.
# To find the correct value for the last index, a total of 0 comparisons are needed.
# Total number of comparisons = (n-1) + (n-2) + ... 3 + 2 + 1
#                             = (n * (n-1))/2
# This is O(n^2) in Big O terms.
# Space complexity = constant or O(1) since the additional storage needed,
# does not depend on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index + 1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end

## --- END OF METHODS ---
