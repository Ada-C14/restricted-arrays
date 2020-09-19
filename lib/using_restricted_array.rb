require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
# Time complexity: ?
# Space complexity: ?
def length(array)
  length = 0
  while !(array[length].nil?)
    length += 1
  end
  return length
  raise NotImplementedError
end

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
def print_array(array)
  length(array).times do |index|
    puts array[index]
  end
  raise NotImplementedError
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def search(array, length, value_to_find)
  length.times do |index|
    if array[index] == value_to_find
      return true
    end
  end
  return false
  raise NotImplementedError
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_largest(array, length)
  largest_num = 0
  length.times do |index|
    if array[index] > largest_num
      largest_num = array[index]
    end
  end

  return largest_num
  raise NotImplementedError
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_smallest(array, length)
  smallest_num = array[0]
  index = 1
  while index < length
    if array[index] < smallest_num
      smallest_num = array[index]
    end
    index += 1
  end
    
  return smallest_num
  raise NotImplementedError
end

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)
  index = 0
  while index < (length / 2)
    array[index], array[length - index - 1] = array[length - index - 1], array[index] 
    index += 1
  end
  return array
  raise NotImplementedError
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def binary_search(array, length, value_to_find)
  sorted_array = Array.new
  until sorted_array.length == length
    min = find_smallest(array, length)
    sorted_array.push(min)

    length.times do |index|
      if array[index] == min
        array[index] = find_largest(array, length) + 1
      end
    end
  end

  start_point = 0
  last_point = length - 1
  while start_point <= last_point
    middle_point = (start_point + last_point) / 2
    if sorted_array[middle_point] == value_to_find
      return true
    elsif sorted_array[middle_point] > value_to_find
      last_point = middle_point - 1
    else
      start_point = middle_point + 1
    end
  end

  return false
  raise NotImplementedError
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
    temp_index = index+1 # compare with values at index+1 to length-1
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
