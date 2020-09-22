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
  i = 1

  until array[i].nil?
    i += 1
  end

  return i
end

# Prints each integer values in the array
# Time complexity: ?
# Space complexity: ?
def print_array(array)

  for i in 0...length(array)
    puts array[i]
  end

end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def search(array, length, value_to_find)

  value_found = nil

  for i in 0...length
    if(array[i] == value_to_find)
      value_found = true
      break
    else
      value_found = false
    end
  end

  return value_found
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_largest(array, length)
  largest = array[0]

  for i in 1...length

    if array[i] > largest
      largest = array[i]
    end
  end

  return largest

end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
# Time complexity: ?
# Space complexity: ?
def find_smallest(array, length)
  smallest = array[0]

  for i in 1...length

    if array[i] < smallest
      smallest = array[i]
    end
  end

  return smallest
end

# Reverses the values in the integer array in place
# Time complexity: ?
# Space complexity: ?
def reverse(array, length)

  #swap the first and last elements first
  # first index begins at zero, when it gets to the end (which will be the middle) sawp is complete
  #
  start = 0
  finish = length - 1

  while start < finish

    temp = array[start]
    array[start] = array[finish]
    array[finish] = temp

    start += 1
    finish -= 1
  end

  return array
end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
# Time complexity: ?
# Space complexity: ?
def binary_search(array, length, value_to_find)

  lower = 0
  upper = length
  mid = length/2

  while value_to_find != array[mid] && upper > lower

    mid = lower + (upper - lower) / 2

    if array[mid] < value_to_find
      lower = mid + 1
    end

    if array[mid] > value_to_find
      upper = mid - 1
    end
  end
  return value_to_find == array[mid]
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
